package main

import (
	"fmt"
	"io/ioutil"
	"log"
)

type key struct {
	x int
	y int
}

func solve(data []byte, roboSanta bool) int {
	x, y, rx, ry := 0, 0, 0, 0

	visited := make(map[key]int)
	visited[key{x: x, y: y}] = 2

	north, east, south, west := byte('^'), byte('>'), byte('v'), byte('<')

	for i, v := range data {
		santa := i%2 == 0 && roboSanta

		if v == north {
			if santa {
				x++
			} else {
				rx++
			}
		} else if v == east {
			if santa {
				y++
			} else {
				ry++
			}
		} else if v == south {
			if santa {
				x--
			} else {
				rx--
			}
		} else if v == west {
			if santa {
				y--
			} else {
				ry--
			}
		}

		if santa {
			visited[key{x, y}]++
		} else {
			visited[key{rx, ry}]++
		}
	}

	return len(visited)
}

func main() {
	data, err := ioutil.ReadFile("input/03.txt")

	if err != nil {
		log.Fatal(err)
	}

	fmt.Println(solve(data, false))
	fmt.Println(solve(data, true))
}
