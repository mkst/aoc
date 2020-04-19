package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"regexp"
	"strings"
)

func format(text string) []string {
	return strings.Split(text, " => ")
}

type queueItem struct {
	molecule string
	steps    int
}

func main() {
	file, err := os.Open("input/19.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	var element string
	doneWithElements := false
	medicine := make(map[string][]string)

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		text := scanner.Text()
		// detect break in input
		if len(text) == 0 {
			doneWithElements = true
			continue
		}
		if doneWithElements {
			element = text
		} else {
			replacement := format(text)
			from, to := replacement[0], replacement[1]
			if value, found := medicine[from]; found {
				medicine[from] = append(value, to)
			} else {
				medicine[from] = []string{to}
			}
		}
	}

	tmpMap := make(map[string]int)

	for i := 0; i < len(element); i++ {
		j := i

		var lookup string
		if i+1 < len(element) && strings.ContainsRune("abcdefghijklmnopqrstuvqxyz", rune(element[i+1])) {
			lookup = element[i : i+2]
			i++
		} else {
			lookup = element[i : i+1]
		}
		if to, found := medicine[lookup]; found {
			for _, v := range to {
				tmpMap[element[:j]+v+element[i+1:]] = 0
			}
		}
	}

	possibilities := 0
	for range tmpMap {
		possibilities++
	}
	fmt.Println(possibilities)

	// part 2
	reversed := make(map[string]string)
	for key, value := range medicine {
		for _, item := range value {
			reversed[item] = key
		}
	}

	queue := []queueItem{queueItem{element, 0}}

	for {
		if len(queue) == 0 {
			break
		}
		var item queueItem
		item, queue = queue[0], queue[1:]

		if item.molecule == "e" {
			fmt.Println(item.steps)
			break
		}

		for key, value := range reversed {
			re := regexp.MustCompile(key)
			res := re.FindAllStringIndex(item.molecule, -1)
			for _, found := range res {
				newMolecule := item.molecule[:found[0]] + value + item.molecule[found[1]:]
				// depth-first-search
				queue = append([]queueItem{queueItem{newMolecule, item.steps + 1}}, queue...)
			}
		}
	}

}
