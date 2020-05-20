package main

import (
	"fmt"
	"io/ioutil"
	"log"
)

func main() {
	data, err := ioutil.ReadFile("input/01.txt")
	if err != nil {
		log.Fatal(err)
	}

	floor, basement := 0, 0
	up := byte('(')

	for i, v := range data {
		if v == up {
			floor++
		} else {
			floor--
		}
		if floor < 0 && basement == 0 {
			basement = i
		}
	}

	fmt.Println(floor)
	fmt.Println(basement + 1) // answer is 1 indexed
}
