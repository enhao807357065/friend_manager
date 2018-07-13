package routes

import (
	"encoding/json"
	"friend-manager-server/models"
	"friend-manager-server/services"
	"friend-manager-server/utils"
	"github.com/bitly/go-simplejson"
	"github.com/gin-gonic/gin"
	l4g "github.com/thinkboy/log4go"
	"net/http"
	"strconv"
	"time"
)

type TalksNewReq struct {
	*models.BaseUserRequest
	Content string `form:"content" json:"content" binding:"required"`
	Photo   string `form:"photo" json:"photo" binding:"-"`
}

func TalksNew(c *gin.Context) {

	bytes, has := c.Get(c.Request.RequestURI)
	if !has {
		c.JSON(http.StatusOK, models.ERInvalidParams)
		return
	}

	talksReq := &TalksNewReq{}
	err := json.Unmarshal(bytes.([]byte), talksReq)
	if err != nil {
		c.JSON(http.StatusOK, models.ERInvalidParams)
		return
	}

	now := time.Now()
	retData := simplejson.New()

	// content不可用
	if !utils.IsValidString(talksReq.Content) {
		c.JSON(http.StatusOK, models.ERInvalidParams)
		return
	}

	talks := &models.Talks{Uid: talksReq.Uid, Content: talksReq.Content, Photo: talksReq.Photo, CreateTime: &now}
	rows, err := services.InsertTalksInDb(talks)
	if rows <= 0 {
		c.JSON(http.StatusOK, models.ERWrongResultRow)
		return
	}

	if err != nil {
		l4g.Error("[server]services.InsertUserInDb error! %v", err)
		c.JSON(http.StatusOK, models.ERFAIL)
		return
	}

	retData.Set("cd", models.RetCodeSuccess)
	retData.Set("talk", talks)

	c.JSON(http.StatusOK, retData)
}

type TalksGetReq struct {
	*models.BaseUserRequest
	TalkId int64 `form:"talk_id" json:"talk_id" binding:"required"`
}

func TalksGet(c *gin.Context) {

	bytes, has := c.Get(c.Request.RequestURI)
	if !has {
		c.JSON(http.StatusOK, models.ERInvalidParams)
		return
	}

	talksReq := &TalksGetReq{}
	err := json.Unmarshal(bytes.([]byte), talksReq)
	if err != nil {
		c.JSON(http.StatusOK, models.ERInvalidParams)
		return
	}

	talkId := int64(0)
	talkIdStr := c.DefaultQuery("talk_id", "0")
	queryTalkId, _ := strconv.ParseInt(talkIdStr, 10, 64)
	if queryTalkId != 0 {
		talkId = queryTalkId
	} else {
		talkId = talksReq.TalkId
	}

	retData := simplejson.New()

	dbTalk, err := services.GetTalkByTalkId(talkId)
	if err != nil {
		l4g.Error("[server]services.InsertUserInDb error! %v", err)
		c.JSON(http.StatusOK, models.ERFAIL)
		return
	}

	if dbTalk == nil || dbTalk.Status != 0 {
		c.JSON(http.StatusOK, models.ERNotFound)
		return
	}

	// 统计浏览次数+1
	if dbTalk.Uid != talksReq.Uid {
		err = services.TalkLooksIncr(dbTalk.Uid, talksReq.Uid)
		if err != nil {
			l4g.Error("[server]services.TalkLooksIncr error! %v", err)
			c.JSON(http.StatusOK, models.ERFAIL)
			return
		}
	}

	dbTalk.Photo = utils.AddImagePrefix(dbTalk.Photo)

	retData.Set("cd", models.RetCodeSuccess)
	retData.Set("talk", dbTalk)

	c.JSON(http.StatusOK, retData)
}

type TalksListReq struct {
	*models.BaseUserRequest
	Page int `form:"page" json:"page" binding:"required"`
	Size int `form:"size" json:"size" binding:"required"`
}

func TalksList(c *gin.Context) {

	bytes, has := c.Get(c.Request.RequestURI)
	if !has {
		c.JSON(http.StatusOK, models.ERInvalidParams)
		return
	}

	talksReq := &TalksListReq{}
	err := json.Unmarshal(bytes.([]byte), talksReq)
	if err != nil {
		c.JSON(http.StatusOK, models.ERInvalidParams)
		return
	}

	retData := simplejson.New()

	rankList, count, err := services.QueryUserTalksRankInDb(talksReq.Uid, talksReq.Page, talksReq.Size)
	if err != nil {
		l4g.Error("[server]services.InsertUserInDb error! %v", err)
		c.JSON(http.StatusOK, models.ERFAIL)
		return
	}

	retData.Set("cd", models.RetCodeSuccess)
	retData.Set("list", rankList)
	retData.Set("count", count)

	c.JSON(http.StatusOK, retData)
}
