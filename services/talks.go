package services

import (
	"friend-manager-server/models"
	"friend-manager-server/utils"
	"github.com/go-xorm/xorm"
	"time"
)

func InsertTalksInDb(talks *models.Talks) (int64, error) {
	return Ormer().Insert(talks)
}

func GetTalkByTalkId(talkId int64) (*models.TalksResult, error) {

	talk := &models.TalksResult{}
	has, err := Ormer().SQL("select t.id, t.uid, t.content, t.photo, t.status, u.nickname from talks t left join user u on t.uid = u.id where t.id = ?", talkId).Get(talk)
	if !has {
		return nil, nil
	}

	return talk, err
}

func TalkLooksIncr(uid, visitor int64) (err error) {

	now := time.Now()

	session := Ormer().NewSession()
	defer session.Close()
	session.Begin()

	userTalk := &models.UserTalks{}
	//has, err := session.Where("uid = ? and visitor = ?", uid, visitor).Get(userTalk)
	has, err := session.SQL("select * from "+utils.GetPhyisicalTableName("user_talks", uid)+" where uid = ? and visitor = ?", uid, visitor).Get(userTalk)
	if !has {
		userTalk = nil
	}

	if userTalk == nil {
		userTalk = &models.UserTalks{Uid: uid, Visitor: visitor, Total: 1, CreateTime: &now}
		//rows, err := session.Insert(userTalk)
		sqlResult, err := session.Exec("insert into "+utils.GetPhyisicalTableName("user_talks", uid)+"(uid, visitor, total, create_time) values (?, ?, ?, ?)", uid, visitor, 1, now.Format(models.F_DATETIME))
		if err != nil {
			session.Rollback()
			return err
		}

		rows, err := sqlResult.RowsAffected()
		if err != nil {
			session.Rollback()
			return err
		}

		if rows <= 0 {
			session.Rollback()
			return err
		}

	} else {
		_, err = session.Exec("update "+utils.GetPhyisicalTableName("user_talks", uid)+" set `total` = `total` + 1 where `uid` = ? and `visitor` = ?", uid, visitor)
		if err != nil {
			session.Rollback()
			return
		}
	}

	if err != nil {
		session.Rollback()
		return
	}

	if err == nil {
		session.Commit()
	}

	return nil
}

func QueryUserTalksRankInDb(uid int64, page, size int) (items []*models.UserTalksRank, count int, err error) {

	if size <= 0 {
		size = models.DEFAULT_PAGESIZE
	}

	sql := "select uk.visitor, u.nickname, u.avatar, uk.total from " + utils.GetPhyisicalTableName("user_talks", uid) + " uk left join user u on uk.visitor = u.id where uk.uid = ? order by uk.total desc limit ?, ?"
	items = make([]*models.UserTalksRank, 0)
	err = Ormer().SQL(sql, uid, page*size, size).Find(&items)
	if err != nil {
		if err == xorm.ErrNotExist {
			return
		}
		return
	}

	sqlStr2 := "select count(*) as count from " + utils.GetPhyisicalTableName("user_talks", uid) + " where uid = ?"
	counter := &models.Counter{}
	_, err = Ormer().SQL(sqlStr2, uid).Get(counter)
	if err != nil {
		return
	}

	count = int(counter.Count) / size
	if int(counter.Count)%size > 0 {
		count++
	}

	return
}
