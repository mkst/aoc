package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
)

func decode(text string) int {
	memory := 0

	for i := 1; i < len(text)-1; {
		if text[i] == byte('\\') {
			if text[i+1] == byte('x') {
				i += 4
			} else {
				i += 2
			}
		} else {
			i++
		}
		memory++
	}
	return len(text) - memory
}

func encode(text string) int {
	memory := 6 // "" => "\"\""
	for i := 1; i < len(text)-1; i++ {
		if text[i] == byte('\\') || text[i] == byte('"') {
			memory++
		}
		memory++
	}
	return memory - len(text)
}

func main() {
	file, err := os.Open("input/08.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	decoded, encoded := 0, 0

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		text := scanner.Text()
		decoded += decode(text)
		encoded += encode(text)
	}

	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}

	fmt.Println(decoded)
	fmt.Println(encoded)
}
