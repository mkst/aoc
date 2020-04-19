package main

import (
	"fmt"
)

func lookAndSay(input []byte) []byte {
	var new []byte
	count := byte('0')
	compare := input[0]

	for _, v := range input {
		if v == compare {
			count++
		} else {
			new = append(new, count, compare)
			// reset
			count = byte('1')
			compare = v
		}
	}
	return append(new, count, input[len(input)-1])
}

func main() {
	res := lookAndSay([]byte("1113222113"))

	for i := 1; i < 50; i++ {
		if i == 40 {
			fmt.Println(len(res))
		}
		res = lookAndSay(res)
	}
	fmt.Println(len(res))
}
