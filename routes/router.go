package routes

import (
	"github.com/gin-gonic/gin"
)

func RegisterRoutes(router *gin.Engine) {

	//router.Use(Prehandle)

	router.NoRoute(RouterNotFound)

	userV1 := router.Group("/user/v1")
	{
		// 获取登陆口令
		userV1.POST("/getatoken", UserGetAToken)
		// 微信登陆
		userV1.POST("/login", WechatLogin)
	}

	talks := router.Group("/talks/v1")
	{
		talks.Use(Prehandle)
		// 新建悄悄话
		talks.POST("/new", TalksNew)
		talks.POST("/get", TalksGet)
		talks.POST("/list", TalksList)
	}

	service := router.Group("/service/v1")
	{
		service.Use(Prehandle)
		service.POST("/qr", ServiceQr)
	}

	file := router.Group("/file/v1")
	{
		file.POST("/upload", FileUpload)
	}

}
