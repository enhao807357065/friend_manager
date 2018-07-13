package services

import (
	"friend-manager-server/models"
)

func GetUserByUnionId(unionId string) (*models.User, error) {

	user := &models.User{}
	has, err := Ormer().Where("unionid = ?", unionId).Get(user)
	if !has {
		return nil, nil
	}

	return user, err
}

func GetUserByOpenId(openId string) (*models.User, error) {

	user := &models.User{}
	has, err := Ormer().Where("openid = ?", openId).Get(user)
	if !has {
		return nil, nil
	}

	return user, err
}

func GetUserByUserId(userId int64) (*models.User, error) {

	user := &models.User{}
	has, err := Ormer().Where("id = ?", userId).Get(user)
	if !has {
		return nil, nil
	}

	return user, err
}

func InsertUserInDb(user *models.User) (int64, error) {
	return Ormer().Insert(user)
}

func UpdateUserInDb(user *models.User) (int64, error) {
	return Ormer().Where("id = ?", user.Id).Update(user)
}
