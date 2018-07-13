package routes

import (
	"encoding/json"
	"fmt"
	"friend-manager-server/models"
	"friend-manager-server/services"
	"friend-manager-server/utils"
	"github.com/gin-gonic/gin"
	"io/ioutil"
	"net/http"
)

func Prehandle(c *gin.Context) {

	c.Header("Access-Control-Allow-Origin", "*")
	c.Header("Access-Control-Allow-Methods", "POST, GET")
	c.Header("Access-Control-Allow-Headers", "*")

	bytes, err := ioutil.ReadAll(c.Request.Body)
	baseUserInfo := &models.BaseUserRequest{}
	err = json.Unmarshal(bytes, baseUserInfo)
	if err != nil {
		c.JSON(http.StatusInternalServerError, models.ERInvalidParams)
		c.Abort()
		return
	}

	dbUser, err := services.GetUserByUserId(baseUserInfo.Uid)
	if err != nil {
		c.JSON(http.StatusInternalServerError, models.ERInvalidParams)
		c.Abort()
		return
	}

	if dbUser == nil || dbUser.Status != 0 {
		c.JSON(http.StatusOK, models.ERUserStatusInvalid)
		c.Abort()
		return
	}

	r := utils.GetLoginTokenByCode(baseUserInfo.Uid, baseUserInfo.Token, baseUserInfo.Tm)
	fmt.Println("rrrrr: ", r, baseUserInfo.Uid, baseUserInfo.Token, baseUserInfo.Tm)
	if r != utils.STATUS_SUCCESS {
		c.JSON(http.StatusOK, models.TokenInvalid)
		c.Abort()
		return
	}

	c.Set(c.Request.RequestURI, bytes)

}

func RouterNotFound(c *gin.Context) {
	c.HTML(http.StatusOK, "404.html", gin.H{"title": "访问的地址不存在"})
}
