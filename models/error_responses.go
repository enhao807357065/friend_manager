package models

import (
	"net/http"
	"reflect"
)

type ErrorResponse struct {
	Code    int         `json:"cd" description:"错误码"`
	Message string      `json:"msg" description:"错误提示"`
	Data    interface{} `json:"data" description:"实际的数据"`
}

var (
	EROK                = &ErrorResponse{Code: 0, Message: "操作成功"}
	ERFAIL              = &ErrorResponse{Code: 9, Message: "操作失败"}
	ERWrongResultRow    = &ErrorResponse{Code: 9, Message: "没有数据修改"}
	TokenInvalid        = &ErrorResponse{Code: 11, Message: "token无效, 请重新登陆"}
	ERNotFound          = &ErrorResponse{Code: 404, Message: "未找到符合条件的记录"}
	ERInvalidParams     = &ErrorResponse{Code: 400, Message: "参数不正确"}
	ERUserStatusInvalid = &ErrorResponse{Code: 403, Message: "用户状态不可用"}
)

func ER(code ResultCode, message string) *ErrorResponse {
	return &ErrorResponse{Code: int(code), Message: message}
}

func NewResponse(params ...interface{}) *ErrorResponse {
	r := &ErrorResponse{Code: http.StatusOK}
	if len(params) == 0 {
		return r
	}

	for _, v := range params {
		t := reflect.TypeOf(v).Kind()
		if t == reflect.Int {
			r.Code = v.(int)
		} else if t == reflect.String {
			r.Message = v.(string)
		} else {
			r.Data = v
		}
	}

	return r
}

// 操作返回码
type ResultCode int

const (
	RetCodeSuccess   ResultCode = 0  // 成功
	RetCodeFail      ResultCode = 9  // 失败
	RetATokenInvalid ResultCode = 10 // atoken不可用
)
