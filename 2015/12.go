package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"reflect"
)

func process(data interface{}, ignoreRed bool) int {
	total := 0
	dataType := reflect.TypeOf(data)

	if dataType == reflect.TypeOf(make([]interface{}, 0)) {
		for _, item := range data.([]interface{}) {
			total += process(item, ignoreRed)
		}
		return total
	}
	if dataType == reflect.TypeOf(make(map[string]interface{}, 0)) {
		for _, item := range data.(map[string]interface{}) {
			if ignoreRed && item == "red" {
				return 0
			}
			total += process(item, ignoreRed)
		}
		return total
	}
	if dataType == reflect.TypeOf(0.0) {
		return int(data.(float64))
	}

	return 0
}

func main() {

	data, err := ioutil.ReadFile("input/12.txt")

	if err != nil {
		log.Fatal(err)
	}

	var result []interface{}

	json.Unmarshal(data, &result)

	fmt.Println(process(result, false))
	fmt.Println(process(result, true))
}
