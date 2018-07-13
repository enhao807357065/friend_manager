package routes

import (
	"crypto/aes"
	"crypto/cipher"
	"encoding/base64"
	"encoding/json"
	"fmt"
	"friend-manager-server/models"
	"friend-manager-server/services"
	"friend-manager-server/utils"
	"github.com/bitly/go-simplejson"
	"github.com/gin-gonic/gin"
	l4g "github.com/thinkboy/log4go"
	"math/rand"
	"net/http"
	"strings"
	"time"
)

func UserGetAToken(c *gin.Context) {

	retData := simplejson.New()
	retData.Set("atoken", time.Now().Unix())
	retData.Set("cd", models.RetCodeSuccess)

	c.JSON(http.StatusOK, retData)
}

type WechatLoginReq struct {
	Atoken        int64  `form:"atoken" json:"atoken" binding:"required"`
	Code          string `form:"code" json:"code" binding:"required"`
	EncryptedData string `form:"encryptedData" json:"encryptedData" binding:"required"`
	Iv            string `form:"iv" json:"iv" binding:"required"`
	Nickname      string `form:"nickname" json:"nickname" binding:"-"`
	Avatar        string `form:"avatar" json:"avatar" binding:"-"`
	Gender        int    `form:"gender" json:"gender" binding:"-"`
}

// content-type application/x-www-form-urlencoded c.PostForm才能取值
func WechatLogin(c *gin.Context) {

	var login WechatLoginReq
	if err := c.ShouldBindJSON(&login); err == nil {

		now := time.Now()
		retData := simplejson.New()

		// atoken不可用
		if !utils.IsValidAToken(login.Atoken) {
			c.JSON(http.StatusOK, models.ER(models.RetATokenInvalid, "atoken无效"))
			return
		}

		// openid或unionid不可用
		if !utils.IsValidString(login.Code) {
			c.JSON(http.StatusOK, models.ERInvalidParams)
			return
		}

		sessionCodeResp, err := GetSessionKeyByCode(login.Code)
		fmt.Println("sessionCodeResp, err : ", sessionCodeResp, err)
		if err != nil {
			l4g.Error("[server]services.GetUserByUnionId error! %v", err)
			c.JSON(http.StatusOK, models.ERFAIL)
			return
		}

		if sessionCodeResp.ErrCode != 0 {
			l4g.Error("requet mini code return err. err_code: %v. err_msg: %v", sessionCodeResp.ErrCode, sessionCodeResp.ErrMsg)
			c.JSON(http.StatusOK, models.ERInvalidParams)
			return
		}

		userInfo := &models.UserInfo{}
		fmt.Println("#################: ", login.EncryptedData, sessionCodeResp.SessionKey, login.Iv)
		err = DecryptFromEncryptedData(login.EncryptedData, sessionCodeResp.SessionKey, login.Iv, userInfo)
		fmt.Println("userInfo: ", userInfo, err)
		fmt.Println("unionId############## ", userInfo.UnionId)
		if err != nil {
			l4g.Error("DecryptFromEncryptedData: %v", err)
			c.JSON(http.StatusOK, models.ERInvalidParams)
			return
		}

		// 查询该unionid是否注册过
		dbUser, err := services.GetUserByUnionId(userInfo.UnionId)
		if err != nil {
			l4g.Error("[server]services.GetUserByUnionId error! %v", err)
			c.JSON(http.StatusOK, models.ERFAIL)
			return
		}

		// 用户状态非正常
		if dbUser != nil && dbUser.Status != 0 {
			c.JSON(http.StatusOK, models.ERUserStatusInvalid)
			return
		}

		// 如果用户不存在 新注册， 否则更新信息
		if dbUser == nil || dbUser.Id <= 0 {
			dbUser = &models.User{}
			dbUser.Name = login.Nickname
			dbUser.Nickname = login.Nickname
			dbUser.Avatar = login.Avatar
			dbUser.Gender = login.Gender
			dbUser.Openid = userInfo.OpenId
			dbUser.Unionid = userInfo.UnionId
			dbUser.CreateTime = &now

			rows, err := services.InsertUserInDb(dbUser)
			if rows <= 0 {
				c.JSON(http.StatusOK, models.ERWrongResultRow)
				return
			}

			if err != nil {
				l4g.Error("[server]services.InsertUserInDb error! %v", err)
				c.JSON(http.StatusOK, models.ERFAIL)
				return
			}
		} else {
			dbUser.Name = login.Nickname
			dbUser.Nickname = login.Nickname
			dbUser.Avatar = login.Avatar
			dbUser.Gender = login.Gender
			dbUser.Openid = userInfo.OpenId

			_, err := services.UpdateUserInDb(dbUser)
			if err != nil {
				l4g.Error("[server]services.UpdateUserInDb error! %v", err)
				c.JSON(http.StatusOK, models.ERFAIL)
				return
			}
		}

		// 更新token信息
		// 生成token
		token := rand.Int31()
		err = utils.SetLoginToken(dbUser.Id, int64(token), 0)
		if err != nil {
			l4g.Error("[server]services.GetUserByUnionId error! %v", err)
			c.JSON(http.StatusOK, models.ERFAIL)
			return
		}

		retData.Set("cd", models.RetCodeSuccess)
		retData.Set("token", token)
		retData.Set("user", dbUser)

		c.JSON(http.StatusOK, retData)

	} else {
		c.JSON(http.StatusBadRequest, models.ERInvalidParams)
	}
}

func GetSessionKeyByCode(jsCode string) (*models.GetSessionKeyByCodeResponse, error) {

	url := fmt.Sprintf(models.GET_SESSIONKEY_URL_TEMPLATE, models.APPID, models.APPCECRET, jsCode)

	resp := &models.GetSessionKeyByCodeResponse{}

	r, err := utils.SendGetRequest(url)
	if err != nil {
		return nil, err
	}

	err = json.Unmarshal(r, resp)
	if err != nil {
		return nil, err
	}

	return resp, nil
}

func DecryptFromEncryptedData(encryptedData string, sessionKey string, iv string, info interface{}) error {

	decodedEncryptedData, err := base64.StdEncoding.DecodeString(encryptedData)
	if err != nil {
		return err
	}

	decodedSessionKey, err := base64.StdEncoding.DecodeString(sessionKey)
	if err != nil {
		return err
	}

	decodedIv, err := base64.StdEncoding.DecodeString(iv)

	block, err := aes.NewCipher(decodedSessionKey)
	if err != nil {
		return err
	}

	decrypter := cipher.NewCBCDecrypter(block, decodedIv)
	plant := make([]byte, len(decodedEncryptedData))
	decrypter.CryptBlocks(plant, decodedEncryptedData)
	plant = PKCS7UnPadding(plant)
	plant = []byte(strings.Replace(string(plant), "\a", "", -1))

	err = json.Unmarshal(plant, info)
	if err != nil {
		return err
	}

	return nil

}

func PKCS7UnPadding(plantText []byte) []byte {
	length := len(plantText)
	unPadding := int(plantText[length-1])
	if unPadding < 1 || unPadding > 32 {
		unPadding = 0
	}
	return plantText[:(length - unPadding)]
}
