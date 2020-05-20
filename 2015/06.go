package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
)

const gridSize = 1000

func format(text string) []int {
	split := strings.Split(text, ",")
	from, err := strconv.Atoi(split[0])
	if err != nil {
		log.Fatal(err)
	}

	to, err := strconv.Atoi(split[1])
	if err != nil {
		log.Fatal(err)
	}
	return []int{from, to}
}

func on(array [gridSize][gridSize]int, from []int, to []int, brightness bool) [gridSize][gridSize]int {
	for i := from[0]; i <= to[0]; i++ {
		for j := from[1]; j <= to[1]; j++ {
			if brightness {
				array[i][j]++
			} else {
				array[i][j] = 1
			}
		}
	}
	return array
}

func off(array [gridSize][gridSize]int, from []int, to []int, brightness bool) [gridSize][gridSize]int {
	for i := from[0]; i <= to[0]; i++ {
		for j := from[1]; j <= to[1]; j++ {
			if brightness && array[i][j] > 1 {
				array[i][j]--
			} else {
				array[i][j] = 0
			}
		}
	}
	return array
}

func toggle(array [gridSize][gridSize]int, from []int, to []int, brightness bool) [gridSize][gridSize]int {
	for i := from[0]; i <= to[0]; i++ {
		for j := from[1]; j <= to[1]; j++ {
			if brightness {
				array[i][j] += 2
			} else {
				value := array[i][j]
				if value == 0 {
					array[i][j] = 1
				} else {
					array[i][j] = 0
				}
			}
		}
	}
	return array
}

func main() {
	file, err := os.Open("input/06.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	var lights [gridSize][gridSize]int
	var brightLights [gridSize][gridSize]int

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		fields := strings.Fields(scanner.Text())
		action := fields[1]
		if action == "on" {
			lights = on(lights, format(fields[2]), format(fields[4]), false)
			brightLights = on(brightLights, format(fields[2]), format(fields[4]), true)
		} else if action == "off" {
			lights = off(lights, format(fields[2]), format(fields[4]), false)
			brightLights = off(brightLights, format(fields[2]), format(fields[4]), true)
		} else {
			lights = toggle(lights, format(fields[1]), format(fields[3]), false)
			brightLights = toggle(brightLights, format(fields[1]), format(fields[3]), true)
		}
	}

	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}

	lit := 0
	brightness := 0

	for i := 0; i < gridSize; i++ {
		for j := 0; j < gridSize; j++ {
			if lights[i][j] == 1 {
				lit++
			}
			brightness += brightLights[i][j]
		}
	}

	fmt.Println(lit)
	fmt.Println(brightness)
}
