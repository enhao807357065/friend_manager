package main

import (
	"fmt"
	"friend-manager-server/routes"
	"friend-manager-server/services"
	"friend-manager-server/utils"
	"github.com/gin-gonic/gin"
	l4g "github.com/thinkboy/log4go"
	"runtime"
)

func main() {

	runtime.GOMAXPROCS(runtime.NumCPU())

	engine := gin.Default()

	l4g.LoadConfiguration("./conf/log4go.xml")

	engine.Use(gin.Recovery())
	gin.SetMode(gin.DebugMode)
	engine.LoadHTMLGlob("templates/*")
	engine.Static("/static", "./static")
	engine.Static("/upload", "./upload")

	// 初始化配置信息
	utils.Init()
	// 初始化数据配置信息
	services.Init()
	// 定时任务：每整点 更新token信息
	routes.ReloadAccessToken()
	// 注册路由
	routes.RegisterRoutes(engine)

	engine.Run(":" + fmt.Sprint(utils.GetHttpPort()))
}
