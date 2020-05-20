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

type inst struct {
	a         string
	b         string
	happiness int
}

type key struct {
	a string
	b string
}

type queueItem struct {
	people    []string
	happiness int
}

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

func format(line string) inst {
	re := regexp.MustCompile("([A-Za-z]+) would (gain|lose) ([0-9]+) happiness.* to ([A-Za-z]+)")
	res := re.FindStringSubmatch(line)
	if res == nil {
		log.Fatal("Regex failed on input", line)
	}

	happiness, err := strconv.Atoi(res[3])
	if err != nil {
		log.Fatal(err)
	}
	if res[2] == "lose" {
		happiness = 0 - happiness
	}

	return inst{a: res[1], b: res[4], happiness: happiness}
}

func createPlan(happyMap map[key]int, people []string) []queueItem {
	var queue []queueItem
	var seatingPlan []queueItem

	for _, person := range people {
		queue = append(queue, queueItem{people: []string{person}, happiness: 0})
	}

	// fill/drain the queue
	for {
		if len(queue) == 0 {
			break
		}
		// pop front
		var item queueItem
		item, queue = queue[0], queue[1:]
		// keep track of completed seating plans
		if len(item.people) == len(people) {
			// close the loop
			happiness := happyMap[key{a: item.people[len(item.people)-1], b: item.people[0]}]
			happiness += happyMap[key{b: item.people[len(item.people)-1], a: item.people[0]}]
			seatingPlan = append(seatingPlan,
				queueItem{people: item.people,
					happiness: item.happiness + happiness})
		}

		person := item.people[len(item.people)-1]

		for _, next := range Except(people, item.people) {
			people := make([]string, len(item.people))
			/* avoid references */
			copy(people, item.people)
			//
			happiness := happyMap[key{a: person, b: next}]
			happiness += happyMap[key{b: person, a: next}]
			queue = append(queue, queueItem{people: append(people, next),
				happiness: item.happiness + happiness})
		}
	}
	return seatingPlan
}

func main() {
	file, err := os.Open("input/13.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	happyMap := make(map[key]int)
	var people []string

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		inst := format(scanner.Text())
		happyMap[key{a: inst.a, b: inst.b}] = inst.happiness
		// add me
		happyMap[key{a: "me", b: inst.b}] = 0
		happyMap[key{a: inst.a, b: "me"}] = 0

		people = append(people, inst.a, inst.b)
	}
	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}

	seatingPlan := createPlan(happyMap, Unique(people))

	max := 0
	for _, plan := range seatingPlan {
		if plan.happiness > max {
			max = plan.happiness
		}
	}
	fmt.Println(max)

	seatingPlan = createPlan(happyMap, append(Unique(people), "me"))
	max = 0
	for _, plan := range seatingPlan {
		if plan.happiness > max {
			max = plan.happiness
		}
	}
	fmt.Println(max)
}
