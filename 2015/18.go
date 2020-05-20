package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
)

const gridSize = 100

type tuple struct {
	x int
	y int
}

func getOptions(xy tuple) []tuple {
	var options []tuple
	for x := xy.x - 1; x <= xy.x+1; x++ {
		for y := xy.y - 1; y <= xy.y+1; y++ {
			if 0 <= x && x < gridSize && 0 <= y && y < gridSize && !(x == xy.x && y == xy.y) {
				options = append(options, tuple{x, y})
			}
		}
	}
	return options
}

func format(text string) [gridSize]int {
	res := [gridSize]int{}
	for i, v := range text {
		if v == '#' {
			res[i] = 1
		} else {
			res[i] = 0
		}
	}
	return res
}

func solve(grid [gridSize][gridSize]int, lightCorners bool) int {
	if lightCorners {
		grid[0][0] = 1
		grid[0][gridSize-1] = 1
		grid[gridSize-1][0] = 1
		grid[gridSize-1][gridSize-1] = 1
	}
	newGrid := grid
	for i := 0; i < 100; i++ {
		for x := 0; x < gridSize; x++ {
			for y := 0; y < gridSize; y++ {
				options := getOptions(tuple{x, y})
				surroundOn := 0
				for _, v := range options {
					if grid[v.x][v.y] == 1 {
						surroundOn++
					}
				}
				if grid[x][y] == 0 {
					if surroundOn == 3 {
						newGrid[x][y] = 1
					}
				} else {
					if !(surroundOn == 2 || surroundOn == 3) {
						newGrid[x][y] = 0
					}
				}
			}
		}
		if lightCorners {
			newGrid[0][0] = 1
			newGrid[0][gridSize-1] = 1
			newGrid[gridSize-1][0] = 1
			newGrid[gridSize-1][gridSize-1] = 1
		}
		grid = newGrid
	}

	lit := 0
	for x := 0; x < gridSize; x++ {
		for y := 0; y < gridSize; y++ {
			if grid[x][y] == 1 {
				lit++
			}
		}
	}
	return lit
}

func main() {

	file, err := os.Open("input/18.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	var grid [gridSize][gridSize]int

	scanner := bufio.NewScanner(file)
	i := 0
	for scanner.Scan() {
		row := format(scanner.Text())
		grid[i] = row
		i++
	}

	fmt.Println(solve(grid, false))
	fmt.Println(solve(grid, true))
}
