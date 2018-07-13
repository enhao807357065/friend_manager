package utils

import (
	"bytes"
	"encoding/json"
	"errors"
	"friend-manager-server/models"
	"github.com/garyburd/redigo/redis"
	"github.com/go-ini/ini"
	l4g "github.com/thinkboy/log4go"
	"io"
	"io/ioutil"
	"mime/multipart"
	"net/http"
	"strconv"
	"strings"
	"sync"
	"time"
)

// redis设置错误信息
const (
	STATUS_SUCCESS          = 0
	STATUS_INVALID_SESSION  = 1 // session失效 token无效
	STATUS_TOKEN_NOT_INITED = 2
	STATUS_FAIL             = 9
)

var lock sync.Mutex

type Config struct {
	AppName           string `ini:"appname"`
	HttpPort          int    `ini:"httpport"`
	MysqlUrl          string `ini:"mysqlurl"`
	MaxIdleConns      int    `ini:"maxIdleConns"`
	MaxOpenConns      int    `ini:"maxOpenConns"`
	RedisMaxIdle      int    `ini:"redis_max_idle"`
	RedisIdleTimeout  int    `ini:"redis_idle_timeout"`
	RedisMaxActive    int    `ini:"redis_max_active"`
	LoginStatusServer string `ini:"login_status_server"`
	LoginStatusDb     int    `ini:"login_status_db"`
	LoginStatusPw     string `ini:"login_status_pw"`
	IsSplitTable      int    `ini:"is_split_table"`
	ExtendTables      string `ini:"extend_tables"`
}

var (
	_config *Config
)

// 登录状态连接池
var LoginStatusPool *redis.Pool

// 分表配置信息
var tableMaps map[string]int64

func Init() {

	lock.Lock()
	defer lock.Unlock()

	cfg, err := ini.Load("./conf/conf.ini")
	if err != nil {
		panic(err)
	}

	_config = new(Config)
	err = cfg.MapTo(_config)

	initLoginStatusPool()

	tableMaps, err = LoadTableSetting(_config.ExtendTables)
	if err != nil {
		panic(err)
	}

}

// 装载分表设置
func LoadTableSetting(extendTables string) (tableSetting map[string]int64, err error) {

	tables := strings.Split(extendTables, ",")

	tableSetting = make(map[string]int64)

	for _, tableName := range tables {

		table := strings.Split(tableName, ".")
		if len(table) != 2 {
			return nil, errors.New("table config error!")
		}

		quantity, err := strconv.ParseInt(table[1], 10, 64)
		if err != nil {
			return nil, err
		}

		tableSetting[table[0]] = quantity
	}

	return
}

// 获取分表后的物理表名
func GetPhyisicalTableName(logicTableName string, appAccountId int64) (ptName string) {

	if _config.IsSplitTable == 0 {
		return logicTableName
	}

	quantity, ok := tableMaps[logicTableName]
	if !ok {
		l4g.Error("no table setting with table name: " + logicTableName)
		return logicTableName
	}

	ptName = logicTableName + "_" + strconv.FormatInt(appAccountId%quantity, 10)

	return

}

func GetAppName() string {
	return _config.AppName
}

func GetHttpPort() int {
	return _config.HttpPort
}

func GetMysqlUrl() string {
	return _config.MysqlUrl
}

func GetMaxIdleConns() int {
	return _config.MaxIdleConns
}

func GetMaxOpenConns() int {
	return _config.MaxOpenConns
}

func UploadFile(field string, header *multipart.FileHeader, url string) (body io.ReadCloser, err error) {

	buf := new(bytes.Buffer)
	w := multipart.NewWriter(buf)
	fw, err := w.CreateFormFile(field, header.Filename)

	if err != nil {
		return nil, err
	}

	file, e := header.Open()
	if e != nil {
		return nil, e
	}
	defer file.Close()
	_, err = io.Copy(fw, file)
	if err != nil {
		return nil, err
	}

	w.Close()
	req, err := http.NewRequest("POST", url, buf)
	if err != nil {
		return nil, err
	}
	req.Header.Set("Content-Type", w.FormDataContentType())
	var client http.Client
	res, err := client.Do(req)
	if err != nil {
		return nil, err
	}
	return res.Body, err
}

func ReaderToJson(reader io.Reader, v interface{}) error {
	data, err := ioutil.ReadAll(reader)
	if err != nil {
		return err
	}

	err = json.Unmarshal(data, v)
	return err
}

func ToJsonString(v interface{}) string {
	data, _ := json.Marshal(v)
	return string(data)
}

func FullUrl(server string, path string) string {
	if path == "" {
		return ""
	}
	if len(path) > 9 && (path[:7] == "http://" || path[:8] == "https://") {
		return path
	}
	if path[0] == '/' {
		return server + path[1:]
	}
	return server + path
}

func initLoginStatusPool() {
	// 建立redigo的连接池
	LoginStatusPool = &redis.Pool{
		MaxIdle:     _config.RedisMaxIdle,
		MaxActive:   _config.RedisMaxActive,
		IdleTimeout: time.Duration(_config.RedisIdleTimeout),
		Dial: func() (redis.Conn, error) {
			c, err := redis.Dial("tcp", _config.LoginStatusServer)
			if err != nil {
				return nil, err
			}

			if _config.LoginStatusPw != "" {
				c.Do("auth", _config.LoginStatusPw)
			}

			// 选择db
			c.Do("select", _config.LoginStatusDb)
			return c, nil
		},
	}
}

// 设置指定code的登录token
func SetLoginToken(appAccoutId int64, token int64, tm int64) (err error) {

	// 取连接
	rc := LoginStatusPool.Get()
	if rc == nil {
		// 取不到连接
		err = errors.New("can't get redis conn!")
		return
	}
	defer rc.Close()

	// 放入redis
	err = rc.Send("MULTI")
	if err != nil {
		return
	}

	err = rc.Send("DEL", appAccoutId)
	if err != nil {
		return
	}

	err = rc.Send("HSET", appAccoutId, token, tm)
	if err != nil {
		return
	}

	err = rc.Send("EXPIRE", appAccoutId, models.IdentityTimeOut)
	if err != nil {
		return
	}

	_, err = rc.Do("EXEC")
	if err != nil {
		return
	}

	return
}

// 获取指定code的登录token
func GetLoginTokenByCode(code int64, token int64, tm int64) (r int) {

	var err error

	// 取连接
	rc := LoginStatusPool.Get()
	if rc == nil {
		// 取不到连接
		l4g.Error("redis: can't get connection! ")
		return STATUS_FAIL
	}
	// 用完后放回去
	defer rc.Close()

	err = rc.Send("MULTI")
	if err != nil {
		l4g.Error(err)
		return STATUS_FAIL
	}

	err = rc.Send("HGETALL", code)
	if err != nil {
		l4g.Error(err)
		return STATUS_FAIL
	}

	var rr interface{}

	rr, err = rc.Do("EXEC")
	if err != nil {
		l4g.Error(err)
		return STATUS_FAIL
	}

	var v []interface{}

	v, err = redis.Values(rr, err)
	if err != nil {
		l4g.Error(err)
		return STATUS_FAIL
	}

	var vals map[string]int64

	vals, err = redis.Int64Map(v[0], err)
	if err != nil {
		if err == redis.ErrNil {
			// redis没找到
			l4g.Error(err)
			return STATUS_TOKEN_NOT_INITED
		}
		return STATUS_FAIL
	}

	var tokenStr string
	var tmInRedis int64

	for tokenStr, tmInRedis = range vals {
		break
	}

	tokenInRedis, _ := strconv.ParseInt(tokenStr, 10, 0)

	if tokenInRedis != token {
		return STATUS_INVALID_SESSION
	}

	if tmInRedis >= tm {
		return STATUS_TOKEN_NOT_INITED
	}

	_, err = rc.Do("HSET", code, token, tm)
	if err != nil {
		return STATUS_FAIL
	}

	// 刷新超时时间，需要配置
	err = rc.Send("EXPIRE", code, models.IdentityTimeOut)
	if err != nil {
		return
	}

	return STATUS_SUCCESS
}
