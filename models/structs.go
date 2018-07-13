package models

import "time"

var AdminGroupName = map[int]string{
	0: "申请中",
	1: "普通管理员",
	2: "高级管理员",
}

type AdminGroup int

const (
	NoneGroup   AdminGroup = iota
	NormalAdmin            = 1 // 普通管理员
	HighAdmin              = 2 // 高级管理员
	HighAdmin3             = 3 // 高级大管理员
)

// 管理员用户结构体
type Admin struct {
	Id            int64      `json:"id,omitempty" xorm:"int(11) pk not null autoincr" description:"标识id"`
	Name          string     `json:"name,omitempty" xorm:"varchar(128) default ''" description:"昵称"`
	Account       string     `json:"account,omitempty" xorm:"varchar(45)  not null unique" description:"登录账户"`
	Password      string     `json:"-,omitempty" xorm:"varchar(45) default ''" description:"明文密码"`
	EncryPassword string     `json:"-" xorm:"varchar(45) default ''" description:"密文密码"`
	Group         AdminGroup `json:"gp" xorm:"tinyint(4) not null default '0'" description:"用户分组"`
	Content       string     `json:"cn" xorm:"varchar(45) default ''" description:"备注信息"`
	CreateTime    *time.Time `json:"create_time,omitempty" xorm:"timestamp not null" description:"创建时间"`
}

type AdminLogin struct {
	UserName string `json:"nm,omitempty"`
	Password string `json:"pw,omitempty"`
}

type User struct {
	Id         int64      `json:"id"`
	Name       string     `json:"name"`
	Nickname   string     `json:"nickname"`
	Avatar     string     `json:"avatar"`
	Phone      string     `json:"phone"`
	Gender     int        `json:"gender"`
	Openid     string     `json:"openid"`
	Unionid    string     `json:"unionid"`
	Status     int        `json:"status"`
	CreateTime *time.Time `json:"create_time"`
}

//分页
type PageableList struct {
	Page      int         `json:"pg"` //当前页
	PageCount int         `json:"ct"` //总页数
	List      interface{} `json:"ls"` //列表内容
}

type Counter struct {
	Count int
}

type StringStruct struct {
	StringName string
}

type Talks struct {
	Id         int64      `json:"id"`
	Uid        int64      `json:"uid"`
	Content    string     `json:"content"`
	Photo      string     `json:"photo"`
	Status     int        `json:"status"`
	CreateTime *time.Time `json:"create_time"`
}

type TalksResult struct {
	Id         int64      `json:"id"`
	Uid        int64      `json:"uid"`
	Content    string     `json:"content"`
	Photo      string     `json:"photo"`
	Status     int        `json:"status"`
	Nickname   string     `json:"nickname"`
	CreateTime *time.Time `json:"create_time"`
}

type UserTalks struct {
	Id         int64      `json:"id"`
	Uid        int64      `json:"uid"`
	Visitor    int64      `json:"visitor"`
	Total      int        `json:"total"`
	CreateTime *time.Time `json:"create_time"`
}

type AccessTokenResp struct {
	AccessToken string `json:"access_token"`
	ExpireIn    int    `json:"expires_in"`
}

type MiniQRInfo struct {
	Path  string `json:"path"`
	Width int    `json:"width"`
}

type LineColor struct {
	R string `json:"r"`
	G string `json:"g"`
	B string `json:"b"`
}

type MiniQRInfo2 struct {
	Scene     string    `form:"scene" json:"scene" binding:"required"`
	Page      string    `form:"page" json:"page" binding:"required"`
	Width     int       `form:"width" json:"width" binding:"required"`
	AutoColor bool      `form:"auto_color" json:"auto_color" binding:"-"`
	LineColor LineColor `form:"line_color" json:"line_color" binding:"-"`
	IsHyaline bool      `form:"is_hyaline" json:"is_hyaline" binding:"-"`
}

type GetSessionKeyByCodeResponse struct {
	ErrCode    int64  `json:"errcode"`     // 发生错误时,返回错误码
	ErrMsg     string `json:"errmsg"`      // 发生错误时，返回具体错误信息
	OpenId     string `json:"openid"`      // 登陆用户 openid
	UnionId    string `json:"unionid"`     // 登陆用户 unionid
	SessionKey string `json:"session_key"` // 登陆用户 session_key
}

type UserInfo struct {
	OpenId    string            `json:"openId"`
	NickName  string            `json:"nickName"`
	Gender    int               `json:"gender"` // 0 未知， 1 男， 2 女
	City      string            `json:"city"`
	Province  string            `json:"province"`
	Country   string            `json:"country"`
	AvatarUrl string            `json:"avatarUrl"`
	UnionId   string            `json:"unionId"`
	Watermark UserInfoWaterMark `json:"watermark"`
}

type UserInfoWaterMark struct {
	Appid     string `json:"appid"`
	Timestamp int    `json:"timestamp"`
}

type UserTalksRank struct {
	Visitor  int64  `json:"visitor"`
	Nickname string `json:"nickname"`
	Avatar   string `json:"avatar"`
	Total    int    `json:"total"`
	Rank     int    `json:"rank"`
}
