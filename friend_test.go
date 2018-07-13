package main

import (
	"fmt"
	_ "friend-manager-server/routes"
	"friend-manager-server/services"
	_ "friend-manager-server/services"
	"friend-manager-server/utils"
	_ "friend-manager-server/utils"
	"testing"
)

func TestLocal(t *testing.T) {
	// 初始化配置信息
	utils.Init()
	// 初始化数据配置信息
	services.Init()

	//dbUser, err := services.GetUserByUnionId("test")
	//fmt.Println("dbUser: ", dbUser, dbUser == nil, err)

	//user := &models.User{Name: "test2", Nickname: "test2", Avatar: "avatar2", Openid: "openid2", Id: 2}
	//id, err := services.UpdateUserInDb(user)
	//fmt.Println("id: ", id, err, user.Id)

	//code := int64(123)
	////token := rand.Int63()
	//tm := time.Now().UnixNano()
	//err := utils.GetLoginTokenByCode(code, 5577006791947779410, tm)
	//fmt.Println("err: ", err)

	//accessTokenUrl := fmt.Sprintf(models.ACCESS_TOKEN_URL_TEMPLATE, models.APPID, models.APPCECRET)
	//str, err := utils.SendGetRequest(accessTokenUrl)
	//fmt.Println("str: ", str, err)
	//routes.ReloadAccessToken()

	list, total, err := services.QueryUserTalksRankInDb(2, 0, 5)
	fmt.Println("list: ", list, total, err)
	for _, val := range list {
		fmt.Println("val: ", val)
	}
}
