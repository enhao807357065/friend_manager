package models

const (
	F_DATE        = "2006-01-02"          //长日期格式
	F_SHORTDATE   = "06-01-02"            //短日期格式
	F_TIMES       = "15:04:05"            //长时间格式
	F_SHORTTIME   = "15:04"               //短时间格式
	F_DATETIME    = "2006-01-02 15:04:05" //日期时间格式
	F_NEWDATETIME = "2006/01/02 15~04~05" //非标准分隔符的日期时间格式
	F_NEWTIME     = "15~04~02"            //非标准分隔符的时间格式
	F_DATE2       = "2006_01_02"
	F_YEAR        = "2006"

	DEFAULT_PAGESIZE = 50

	IdentityTimeOut = 3600 * 24 //秒

	ACCESS_TOKEN_URL_TEMPLATE   = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=%s&secret=%s"
	GET_SESSIONKEY_URL_TEMPLATE = "https://api.weixin.qq.com/sns/jscode2session?appid=%s&secret=%s&js_code=%s&grant_type=authorization_code"
	APPID                       = "wx77ecae5f740dfea6"
	APPCECRET                   = "cf61a97e23a5be7562a2f92ba7d93b54"
	ACCESS_TOKEN_KEY            = "ACCESS_TOKEN_KEY"
	IMAGE_PREFIX                = "https://img.quguangjie.cn/"

	QINIU_ACCESS_KEY = "kos7C6b1dhDySkL0_WM83-CZNK2fSiMXg9rqzp7i"
	QINIU_SECRET_KEY = "YI8jZe0hz-DAgdm4jUalcrSRDhsLVZgZyK1cyqt4"
	QINIU_BUCKET     = "pailetech"
)

type BaseUserRequest struct {
	Uid   int64 `form:"uid" json:"uid" binding:"-"`
	Token int64 `form:"token" json:"token" binding:"-"`
	Tm    int64 `form:"tm" json:"tm" binding:"-"`
	//Client string `json:"client"`
}
