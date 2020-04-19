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
	file, err := os.Open("input/16.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	sue := make(map[string]int)

	sue["children"] = 3
	sue["cats"] = 7
	sue["samoyeds"] = 2
	sue["pomeranians"] = 3
	sue["akitas"] = 0
	sue["vizslas"] = 0
	sue["goldfish"] = 5
	sue["trees"] = 3
	sue["cars"] = 2
	sue["perfumes"] = 1

	scanner := bufio.NewScanner(file)

	re := regexp.MustCompile(" ([a-z]+): ([0-9]+)")

	sue1, sue2 := 0, 0

	for i := 1; scanner.Scan(); i++ {
		isSue, isRealSue := true, true

		line := scanner.Text()
		res := re.FindAllStringSubmatch(line, -1)
		if res == nil {
			log.Fatal("Regex failed on input", line)
		}
		for _, v := range res {
			item := v[1]
			qty, err := strconv.Atoi(v[2])
			if err != nil {
				log.Fatal("Failed to convert", v[2])
			}
			if sue[item] != qty {
				isSue = false
			}
			if item == "cats" || item == "trees" {
				if sue[item] > qty {
					isRealSue = false
				}
			} else if item == "pomeranians" || item == "goldfish" {
				if sue[item] < qty {
					isRealSue = false
				}
			} else {
				if sue[item] != qty {
					isRealSue = false
				}
			}
		}
		if isSue {
			sue1 = i
		}
		if isRealSue {
			sue2 = i
		}
	}
	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}

	fmt.Println(sue1)
	fmt.Println(sue2)
}
