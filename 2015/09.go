package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"regexp"
	"sort"
	"strconv"
)

// Keys returns the keys of a map
func Keys(x map[string]int) []string {
	var keys []string
	for key := range x {
		keys = append(keys, key)
	}
	sort.Strings(keys)
	return keys
}

// Unique dedupliates a list
func Unique(x []string) []string {
	m := make(map[string]int)
	for _, v := range x {
		if _, ok := m[v]; !ok {
			m[v] = 0
		}
	}
	return Keys(m)
}

// Contains checks if string y exists in []string x
func Contains(x []string, y string) bool {
	for _, v := range x {
		if v == y {
			return true
		}
	}
	return false
}

// Except returns list x excluding items in list y
func Except(x []string, y []string) []string {
	var e []string
	for _, v := range x {
		if !Contains(y, v) {
			e = append(e, v)
		}
	}
	return e
}

type route struct {
	from     string
	to       string
	distance int
}

type key struct {
	from string
	to   string
}

type queueItem struct {
	visited  []string
	distance int
}

func format(line string) route {
	re := regexp.MustCompile("([A-Za-z]+) to ([A-Za-z]+) = ([0-9]+)")
	res := re.FindStringSubmatch(line)
	if res == nil {
		log.Fatal("Regex failed on input", line)
	}

	distance, err := strconv.Atoi(res[3])
	if err != nil {
		log.Fatal("Failed to convert distance", res[3])
	}

	return route{res[1], res[2], distance}
}

func main() {
	file, err := os.Open("input/09.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	routes := make(map[key]int)
	cities := []string{}

	for scanner.Scan() {
		res := format(scanner.Text())
		routes[key{res.from, res.to}] = res.distance
		routes[key{res.to, res.from}] = res.distance
		cities = append(cities, res.from, res.to)
	}
	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}

	var queue []queueItem
	var trips []queueItem

	cities = Unique(cities)
	// setup queue
	for _, city := range cities {
		queue = append(queue, queueItem{[]string{city}, 0})
	}
	// fill/drain the queue
	for {
		if len(queue) == 0 {
			break
		}
		// pop front
		var item queueItem
		item, queue = queue[0], queue[1:]
		// keep track of completed journeys
		if len(item.visited) == len(cities) {
			trips = append(trips, item)
		}

		from := item.visited[len(item.visited)-1]

		for _, to := range Except(cities, item.visited) {
			visited := make([]string, len(item.visited))
			/* avoid references */
			copy(visited, item.visited)
			distance := item.distance + routes[key{from, to}]
			queue = append(queue, queueItem{append(visited, to), distance})
		}
	}

	min := 1000000
	max := -1

	for _, trip := range trips {
		if trip.distance < min {
			min = trip.distance
		}
		if trip.distance > max {
			max = trip.distance
		}
	}

	fmt.Println(min)
	fmt.Println(max)
}
