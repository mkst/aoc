package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"sort"
	"strconv"
	"strings"
)

func getDimensions(entry string) []int {
	var dimensions []int
	for _, v := range strings.Split(entry, "x") {
		dimension, err := strconv.Atoi(v)
		if err != nil {
			log.Fatal(err)
		}
		dimensions = append(dimensions, dimension)
	}
	sort.Ints(dimensions)
	return dimensions
}

func calculateWrappingPaper(dimensions []int) int {
	return (2 * dimensions[2] * dimensions[0]) + // 2 * l * w
		(2 * dimensions[0] * dimensions[1]) + // 2 * w * h
		(2 * dimensions[1] * dimensions[2]) + // 2 * h * l
		dimensions[0]*dimensions[1] // slack
}

func calculateRibbon(dimensions []int) int {
	return (2*dimensions[0] + 2*dimensions[1]) + // smallest perimeter
		(dimensions[0] * dimensions[1] * dimensions[2]) // volume
}

func main() {
	file, err := os.Open("input/02.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	wrap, ribbon := 0, 0

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		dimensions := getDimensions(scanner.Text())
		wrap += calculateWrappingPaper(dimensions)
		ribbon += calculateRibbon(dimensions)
	}

	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}

	fmt.Println(wrap)
	fmt.Println(ribbon)
}
