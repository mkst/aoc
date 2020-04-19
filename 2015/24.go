package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"sort"
	"strconv"
)

func combinations(packages []int, target int) [][]int {

	queue := [][]int{}
	combos := [][]int{}

	for _, p := range packages {
		queue = append(queue, []int{p})
	}

	bestCombo := len(packages)

	for {
		if len(queue) == 0 {
			break
		}

		var item []int
		item, queue = queue[0], queue[1:]

		sum := 0
		for _, v := range item {
			sum += v
		}

		if sum == target {
			combos = append(combos, append(item))
			if len(item) < bestCombo {
				bestCombo = len(item)
			}
			continue
		}

		if len(item) >= bestCombo {
			continue
		}

		for _, v := range packages {
			if v < item[len(item)-1] && sum+v <= target {
				// avoid references
				newItem := make([]int, len(item))
				copy(newItem, item)
				queue = append(queue, append(newItem, v))
			}
		}
	}

	return combos
}

func bestCombo(combos [][]int) int {

	bestLength := 1000000
	for _, v := range combos {
		if len(v) < bestLength {
			bestLength = len(v)
		}
	}
	bestProduct := 1000000000000
	for _, v := range combos {
		prd := 1
		for _, w := range v {
			prd *= w
		}
		if prd < bestProduct {
			bestProduct = prd
		}
	}
	return bestProduct

}
func main() {

	file, err := os.Open("input/24.txt")
	if err != nil {
		log.Fatal(err)
	}

	packages := []int{}

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		weight, err := strconv.Atoi(scanner.Text())
		if err != nil {
			log.Fatal(err)
		}
		packages = append(packages, weight)
	}

	// sort descending
	sort.Sort(sort.Reverse(sort.IntSlice(packages)))

	sum := 0
	for _, p := range packages {
		sum += p
	}

	fmt.Println(bestCombo(combinations(packages, sum/3)))
	fmt.Println(bestCombo(combinations(packages, sum/4)))
}
