package routes

import (
	"bytes"
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"friend-manager-server/models"
	"friend-manager-server/utils"
	"github.com/bitly/go-simplejson"
	"github.com/garyburd/redigo/redis"
	"github.com/gin-gonic/gin"
	"github.com/qiniu/api.v7/auth/qbox"
	"github.com/qiniu/api.v7/storage"
	l4g "github.com/thinkboy/log4go"
	"io"
	"io/ioutil"
	"net/http"
	"strconv"
	"time"
)

type ServiceQrReq struct {
	*models.BaseUserRequest
	Path  string `form:"path" json:"path" binding:"required"`
	Width int    `form:"width" json:"width" binding:"required"`
	//Scene     string           `form:"scene" json:"scene" binding:"required"`
	//Page      string           `form:"page" json:"page" binding:"required"`
	//Width     int              `form:"width" json:"width" binding:"required"`
	//AutoColor bool             `form:"auto_color" json:"auto_color" binding:"-"`
	//LineColor models.LineColor `form:"line_color" json:"line_color" binding:"-"`
	//IsHyaline bool             `form:"is_hyaline" json:"is_hyaline" binding:"-"`
}

func ServiceQr(c *gin.Context) {

	bytesArr, has := c.Get(c.Request.RequestURI)
	if !has {
		c.JSON(http.StatusOK, models.ERInvalidParams)
		return
	}

	serviceReq := &ServiceQrReq{}
	err := json.Unmarshal(bytesArr.([]byte), serviceReq)
	if err != nil {
		c.JSON(http.StatusOK, models.ERInvalidParams)
		return
	}

	if !utils.IsValidString(serviceReq.Path) {
		c.JSON(http.StatusOK, models.ERInvalidParams)
		return
	}

	accessToken, err := getAccessToken()
	if err != nil {
		l4g.Error("get access token error!")
		c.JSON(http.StatusOK, models.ERFAIL)
		return
	}

	url := "https://api.weixin.qq.com/cgi-bin/wxaapp/createwxaqrcode?access_token=" + accessToken
	//url := "https://api.weixin.qq.com/wxa/getwxacodeunlimit?access_token=" + accessToken

	miniParam := &models.MiniQRInfo{
		//Scene:     serviceReq.Scene,
		//Page:      serviceReq.Page,
		//Width:     serviceReq.Width,
		//AutoColor: serviceReq.AutoColor,
		//LineColor: serviceReq.LineColor,
		//IsHyaline: serviceReq.IsHyaline,
		Path:  serviceReq.Path,
		Width: serviceReq.Width,
	}
	paramStr, err := jsonMarchal(miniParam)
	if err != nil {
		l4g.Error("jsonMarchal! %v", err)
		c.JSON(http.StatusOK, models.ERFAIL)
		return
	}

	resp, err := http.Post(url, "", bytes.NewBuffer([]byte(paramStr)))
	if err != nil {
		l4g.Error("send post! %v", err)
		c.JSON(http.StatusOK, models.ERFAIL)
		return
	}

	body, err := ioutil.ReadAll(resp.Body)

	_, err = c.Writer.Write(body)

	return
}

func ServiceQr1(c *gin.Context) {

	bytesArr, has := c.Get(c.Request.RequestURI)
	if !has {
		c.JSON(http.StatusOK, models.ERInvalidParams)
		return
	}

	serviceReq := &ServiceQrReq{}
	err := json.Unmarshal(bytesArr.([]byte), serviceReq)
	if err != nil {
		c.JSON(http.StatusOK, models.ERInvalidParams)
		return
	}

	if !utils.IsValidString(serviceReq.Path) {
		c.JSON(http.StatusOK, models.ERInvalidParams)
		return
	}

	accessToken, err := getAccessToken()
	if err != nil {
		l4g.Error("get access token error!")
		c.JSON(http.StatusOK, models.ERFAIL)
		return
	}

	url := "https://api.weixin.qq.com/cgi-bin/wxaapp/createwxaqrcode?access_token=" + accessToken

	miniParam := &models.MiniQRInfo{
		Path:  serviceReq.Path,
		Width: serviceReq.Width,
	}
	paramStr, err := jsonMarchal(miniParam)
	if err != nil {
		l4g.Error("jsonMarchal! %v", err)
		c.JSON(http.StatusOK, models.ERFAIL)
		return
	}

	resp, err := http.Post(url, "", bytes.NewBuffer([]byte(paramStr)))
	if err != nil {
		l4g.Error("send post! %v", err)
		c.JSON(http.StatusOK, models.ERFAIL)
		return
	}

	body, err := ioutil.ReadAll(resp.Body)

	key, _, err := UploadStream(bytes.NewReader(body), int64(len(body)))
	//fmt.Println("key: ", key, err)
	if err != nil {
		l4g.Error(err)
		c.JSON(http.StatusOK, models.ERFAIL)
		return
	}

	retData := simplejson.New()
	retData.Set("cd", 0)
	retData.Set("key", key)

	c.JSON(http.StatusOK, retData)
}

func FileUpload(c *gin.Context) {

	uid, err := strconv.ParseInt(c.PostForm("uid"), 10, 64)
	if err != nil {
		l4g.Error("parse uid fail")
		c.JSON(http.StatusOK, models.ERInvalidParams)
		return
	}

	token, err := strconv.ParseInt(c.PostForm("token"), 10, 64)
	if err != nil {
		l4g.Error("parse token fail")
		c.JSON(http.StatusOK, models.ERInvalidParams)
		return
	}

	tm, err := strconv.ParseInt(c.PostForm("tm"), 10, 64)
	if err != nil {
		l4g.Error("parse tm fail")
		c.JSON(http.StatusOK, models.ERInvalidParams)
		return
	}

	r := utils.GetLoginTokenByCode(uid, token, tm)
	fmt.Println("rrrrrr: ", r, uid, token, tm)
	if r != utils.STATUS_SUCCESS {
		c.JSON(http.StatusOK, models.TokenInvalid)
		return
	}

	file, fileHeader, err := c.Request.FormFile("file")
	if err != nil {
		l4g.Error(err)
		c.JSON(http.StatusOK, models.ERFAIL)
		return
	}

	key, _, err := UploadStream(file, fileHeader.Size)
	if err != nil {
		l4g.Error(err)
		c.JSON(http.StatusOK, models.ERFAIL)
		return
	}

	retData := simplejson.New()
	retData.Set("cd", 0)
	retData.Set("key", key)

	c.JSON(http.StatusOK, retData)
}

func ReloadAccessToken() {

	var err error

	// 先检查是否有accesstoken信息 没有则重新拉取一条
	token, err := getAccessToken()
	if err != nil {
		l4g.Error("[server]getAccessToken error! %v", err)
	}

	// 如果token不存在 强制刷新一波
	if !utils.IsValidString(token) {
		err = setAccessToken()
		if err != nil {
			l4g.Error("[server]getAccessToken error! %v", err)
		}
	}

	reloadRankTime := 1

	now := time.Now()
	location := now.Location()

	nextRunTime := time.Date(now.Year(), now.Month(), now.Day(), now.Hour()+reloadRankTime, 0, 0, 0, location)

	go func() {

		var nowInGo time.Time
		var timer *time.Timer

		<-time.NewTimer(nextRunTime.Sub(now)).C

		for {

			nowInGo = time.Now()

			// 每小时运行一次
			timer = time.NewTimer(time.Date(nowInGo.Year(), nowInGo.Month(), nowInGo.Day(), nowInGo.Hour()+reloadRankTime, 0, 0, 0, location).Sub(nowInGo))

			l4g.Info("setAccessToken---------------------------------------------------------" + time.Now().Format(models.F_DATETIME))
			err = setAccessToken()
			if err != nil {
				l4g.Error("[server]getAccessToken error! %v", err)
			}

			<-timer.C

		}
	}()
}

func getAccessToken() (token string, err error) {

	// 取连接
	rc := utils.LoginStatusPool.Get()
	if rc == nil {
		// 取不到连接
		err = errors.New("can't get redis conn!")
		l4g.Error("[server]getAccessToken error! %v", err)
		return
	}
	defer rc.Close()

	// 放入redis
	err = rc.Send("MULTI")
	if err != nil {
		l4g.Error("[server]getAccessToken error! %v", err)
		return
	}

	err = rc.Send("GET", models.ACCESS_TOKEN_KEY)
	if err != nil {
		l4g.Error("[server]getAccessToken error! %v", err)
		return
	}

	var rr interface{}
	rr, err = rc.Do("EXEC")
	if err != nil {
		l4g.Error("[server]getAccessToken error! %v", err)
		return
	}

	var v []interface{}

	v, err = redis.Values(rr, err)
	if err != nil {
		l4g.Error("[server]getAccessToken error! %v", err)
		return
	}

	if v[0] != nil {
		token = string(v[0].([]uint8))
	}

	return
}

func setAccessToken() error {

	bytesArr, err := utils.SendGetRequest(fmt.Sprintf(models.ACCESS_TOKEN_URL_TEMPLATE, models.APPID, models.APPCECRET))
	if err != nil {
		return err
	}

	accessToken := &models.AccessTokenResp{}
	err = json.Unmarshal(bytesArr, accessToken)
	if err != nil {
		return err
	}

	if !utils.IsValidString(accessToken.AccessToken) {
		return errors.New("access token invalid!")
	}

	// 取连接
	rc := utils.LoginStatusPool.Get()
	if rc == nil {
		// 取不到连接
		err = errors.New("can't get redis conn!")
		return err
	}
	defer rc.Close()

	// 放入redis
	err = rc.Send("MULTI")
	if err != nil {
		return err
	}

	err = rc.Send("SET", models.ACCESS_TOKEN_KEY, accessToken.AccessToken)
	if err != nil {
		return err
	}

	err = rc.Send("EXPIRE", models.ACCESS_TOKEN_KEY, accessToken.ExpireIn)
	if err != nil {
		return err
	}

	_, err = rc.Do("EXEC")
	if err != nil {
		return err
	}

	return nil

}

func jsonMarchal(object interface{}) (string, error) {
	buffer := &bytes.Buffer{}
	encoder := json.NewEncoder(buffer)
	encoder.SetEscapeHTML(false)
	err := encoder.Encode(object)
	return buffer.String(), err
}

func UploadStream(reader io.Reader, size int64) (string, string, error) {
	putPolicy := storage.PutPolicy{
		Scope: models.QINIU_BUCKET,
	}
	mac := qbox.NewMac(models.QINIU_ACCESS_KEY, models.QINIU_SECRET_KEY)
	upToken := putPolicy.UploadToken(mac)

	cfg := storage.Config{}
	// 空间对应的机房
	zone := storage.ZoneHuanan
	cfg.Zone = &zone
	// 是否使用https域名
	cfg.UseHTTPS = false
	// 上传是否使用CDN上传加速
	cfg.UseCdnDomains = false

	formUploader := storage.NewFormUploader(&cfg)
	ret := storage.PutRet{}
	putExtra := storage.PutExtra{
		//Params: map[string]string{
		//	"x:name": "github logo",
		//},
	}

	//data := []byte("hello, this is qiniu cloud")
	//dataLen := int64(len(data))
	err := formUploader.PutWithoutKey(context.Background(), &ret, upToken, reader, size, &putExtra)
	if err != nil {
		return "", "", err
	}
	return ret.Key, ret.Hash, nil
}
