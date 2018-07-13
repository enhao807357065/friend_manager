package utils

import (
	"encoding/base64"
	"friend-manager-server/models"
	"github.com/bitly/go-simplejson"
	"io/ioutil"
	"net/http"
	"strings"
	"time"
)

// 检测token可用性
func IsValidAToken(aToken int64) bool {
	return time.Now().Unix()-aToken <= 600
}

func UnicodeIndex(str, substr string) int {
	// 子串在字符串的字节位置
	result := strings.Index(str, substr)
	if result >= 0 {
		// 获得子串之前的字符串并转换成[]byte
		prefix := []byte(str)[0:result]
		// 将子串之前的字符串转换成[]rune
		rs := []rune(string(prefix))
		// 获得子串之前的字符串的长度，便是子串在字符串的字符位置
		result = len(rs)
	}
	return result
}

// 检测字符串
func IsValidString(source string) bool {
	return source != "" && len(strings.TrimSpace(source)) > 0
}

// 加密密码
func EncodePassword(data string) string {
	return base64.StdEncoding.EncodeToString([]byte(data))
}

// 解密密码
func DecodePassword(data string) ([]byte, error) {
	return base64.StdEncoding.DecodeString(data)
}

func GetJsonFromResponse(resp *http.Response) (jsn *simplejson.Json, err error) {

	var body []byte

	body, err = ioutil.ReadAll(resp.Body)
	if err != nil {
		return
	}

	jsn, err = simplejson.NewJson(body)

	return
}

func SendGetRequest(url string) ([]byte, error) {

	client := &http.Client{}
	reqest, err := http.NewRequest("GET", url, nil) //建立一个请求
	if err != nil {
		return nil, err
	}

	response, err := client.Do(reqest) //提交
	if err != nil {
		return nil, err
	}
	defer response.Body.Close()

	arr, err := ioutil.ReadAll(response.Body)
	if err != nil {
		return nil, err
	}

	return arr, nil
}

func AddImagePrefix(imageUrl string) string {
	if imageUrl == "" || strings.HasPrefix(imageUrl, "http") {
		return imageUrl
	} else {
		return models.IMAGE_PREFIX + imageUrl
	}

}
