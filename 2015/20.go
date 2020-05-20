package main

import (
	"bufio"
	"fmt"
	"log"
	"math"
	"os"
	"strconv"
)

func filter(n []int, houses int, max int) []int {
	res := []int{}
	for _, v := range n {
		if v >= max/houses {
			res = append(res, v)
		}
	}
	return res
}

func sum(n []int) int {
	res := 0
	for _, v := range n {
		res += v
	}
	return res
}

func solve(n int) []int {
	factors := make(map[int]int)

	for i := 1; i <= int(math.Floor(math.Sqrt(float64(n)))); i++ {
		if n%i == 0 {
			factors[i] = i
			factors[n/i] = n / i
		}
	}

	res := []int{}
	for _, factor := range factors {
		res = append(res, factor)
	}

	return res
}

func main() {
	file, err := os.Open("input/20.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	var line string
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		line = scanner.Text()
		break
	}

	limit, err := strconv.Atoi(line)
	if err != nil {
		log.Fatal(err)
	}

	i := 1
	for {
		if sum(solve(i)) >= limit/10 {
			fmt.Println(i)
			break
		}
		i++
	}

	i = 1
	for {
		if sum(filter(solve(i), 50, i)) >= limit/11 {
			fmt.Println(i)
			break
		}
		i++
	}
}
