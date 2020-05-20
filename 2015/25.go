package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"regexp"
	"strconv"
)

func main() {

	file, err := os.Open("input/25.txt")
	if err != nil {
		log.Fatal(err)
	}

	var text string
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		text = scanner.Text()
	}

	re := regexp.MustCompile("Enter the code at row ([0-9]+), column ([0-9]+).")
	res := re.FindStringSubmatch(text)
	if res == nil {
		log.Fatal("Regex failed on input", text)
	}
	row, err := strconv.Atoi(res[1])
	if err != nil {
		log.Fatal(err)
	}
	column, err := strconv.Atoi(res[2])
	if err != nil {
		log.Fatal(err)
	}

	entry := 0
	// find row
	for i := 1; i < row; i++ {
		entry += i
	}
	// find column
	for i := 1; i < column; i++ {
		entry += row + i
	}

	i := 0
	code := 20151125
	for {
		if i == entry {
			fmt.Println(code)
			break
		}
		code = (code * 252533) % 33554393
		i++
	}
}
