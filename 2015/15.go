package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"regexp"
	"strconv"
)

type ingredient struct {
	capacity   int
	durability int
	flavor     int
	texture    int
	calories   int
}

func format(line string) ingredient {
	// Sugar: capacity 3, durability 0, flavor 0, texture -3, calories 2
	re := regexp.MustCompile("capacity (-*[0-9]+), durability (-*[0-9]+), flavor (-*[0-9]+), texture (-*[0-9]+), calories (-*[0-9]+)")
	res := re.FindStringSubmatch(line)
	if res == nil {
		log.Fatal("Regex failed on input", line)
	}

	capacity, err := strconv.Atoi(res[1])
	if err != nil {
		log.Fatal(err)
	}
	durability, err := strconv.Atoi(res[2])
	if err != nil {
		log.Fatal(err)
	}
	flavor, err := strconv.Atoi(res[3])
	if err != nil {
		log.Fatal(err)
	}
	texture, err := strconv.Atoi(res[4])
	if err != nil {
		log.Fatal(err)
	}
	calories, err := strconv.Atoi(res[5])
	if err != nil {
		log.Fatal(err)
	}

	return ingredient{capacity: capacity, durability: durability, flavor: flavor, texture: texture, calories: calories}
}

func combinations(size int, max int) [][]int {
	queue := [][]int{}
	combos := [][]int{}

	for i := 0; i <= max; i++ {
		item := []int{i}
		queue = append(queue, item)
	}

	if size == 1 {
		return queue
	}

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

		if len(item) == size-1 {
			combos = append(combos, append(item, max-sum))
			continue
		}

		for i := 0; i <= max-sum; i++ {
			queue = append(queue, append(item, i))
		}
	}

	return combos
}

func main() {

	file, err := os.Open("input/15.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	var ingredients []ingredient

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		ingredients = append(ingredients, format(scanner.Text()))
	}
	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}

	combos := combinations(len(ingredients), 100)

	best, best500 := 0, 0

	for _, combo := range combos {
		capacity := 0
		durability := 0
		flavor := 0
		texture := 0
		calories := 0

		for i, qty := range combo {
			capacity += ingredients[i].capacity * qty
			durability += ingredients[i].durability * qty
			flavor += ingredients[i].flavor * qty
			texture += ingredients[i].texture * qty
			calories += ingredients[i].calories * qty
		}
		if capacity < 0 {
			continue
		}
		if durability < 0 {
			continue
		}
		if flavor < 0 {
			continue
		}
		if texture < 0 {
			continue
		}

		recipe := capacity * durability * flavor * texture

		if recipe > best {
			best = recipe
		}

		if calories == 500 && recipe > best500 {
			best500 = recipe
		}
	}

	fmt.Println(best)
	fmt.Println(best500)
}
