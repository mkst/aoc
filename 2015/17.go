package main

import (
	"fmt"
)

func main() {
	target := 150
	containers := []int{11, 30, 47, 31, 32, 36, 3, 1, 5, 3, 32, 36, 15, 11, 46, 26, 28, 1, 19, 3}

	var ids []int
	for i := range containers {
		ids = append(ids, i)
	}

	queue := [][]int{}
	solutions := [][]int{}
	// bootstrap queue
	for _, id := range ids {
		queue = append(queue, []int{id})
	}

	for {
		if len(queue) == 0 {
			break
		}

		var item []int
		item, queue = queue[0], queue[1:]

		used := 0
		for _, id := range item {
			used += containers[id]
		}

		if used == target {
			solutions = append(solutions, item)
			continue
		}

		for _, nextContainer := range ids {
			if nextContainer < item[len(item)-1] {
				if containers[nextContainer]+used <= target {
					/* avoid references */
					itemCopy := make([]int, len(item))
					copy(itemCopy, item)

					queue = append(queue, append(itemCopy, nextContainer))
				}
			}
		}
	}

	fmt.Println(len(solutions))

	minLength := len(containers)
	for _, solution := range solutions {
		if len(solution) < minLength {
			minLength = len(solution)
		}
	}
	minSolutions := 0
	for _, solution := range solutions {
		if len(solution) == minLength {
			minSolutions++
		}
	}
	fmt.Println(minSolutions)
}
