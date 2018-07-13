package services

import (
	"friend-manager-server/utils"
	_ "github.com/go-sql-driver/mysql" // import your used driver
	"github.com/go-xorm/xorm"
)

var engine *xorm.Engine

func Init() {
	initEngine()
}

func initEngine() {

	var err error
	engine, err = xorm.NewEngine("mysql", utils.GetMysqlUrl())
	if err != nil {
		panic(err)
	}

	err = engine.Ping()
	if err != nil {
		panic(err)
	}

	engine.ShowSQL(true)
	engine.SetMaxIdleConns(utils.GetMaxIdleConns())
	engine.SetMaxOpenConns(utils.GetMaxOpenConns())

	//tables := []interface{}{
	//	new(models.Admin),
	//}
	//
	//err = engine.Sync2(tables...)
	//if err != nil {
	//	panic(err)
	//}
}

func Ormer() *xorm.Engine {
	return engine
}
