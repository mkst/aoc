package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strings"
)

func isNice(word string) int {
	vowels := 0
	for _, v := range "aeiou" {
		vowels += strings.Count(word, string(v))
	}
	if vowels < 3 {
		return 0
	}

	doubles := 0
	for i := 0; i < len(word)-1; i++ {
		if word[i] == word[i+1] {
			doubles++
		}
	}
	if doubles == 0 {
		return 0
	}

	for _, v := range []string{"ab", "cd", "pq", "xy"} {
		if strings.Contains(word, v) {
			return 0
		}
	}
	return 1
}

func isReallyNice(word string) int {
	repeats, duplicates := 0, 0

	for i := 0; i < len(word)-2; i++ {
		if word[i] == word[i+2] {
			repeats++
		}
		if strings.Index(word[i+2:len(word)], word[i:i+2]) > -1 {
			duplicates++
		}
	}
	if repeats > 0 && duplicates > 0 {
		return 1
	}
	return 0
}

func main() {
	file, err := os.Open("input/05.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	nice, reallyNice := 0, 0

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		text := scanner.Text()
		nice += isNice(text)
		reallyNice += isReallyNice(text)
	}

	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}

	fmt.Println(nice)
	fmt.Println(reallyNice)
}
