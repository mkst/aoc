package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"regexp"
	"strconv"
)

type reindeer struct {
	speed    int
	duration int
	rest     int
	distance int
	points   int
}

func format(line string) reindeer {
	re := regexp.MustCompile("fly ([0-9]+) km/s for ([0-9]+) seconds, but then must rest for ([0-9]+) seconds")

	res := re.FindStringSubmatch(line)
	if res == nil {
		log.Fatal("Regex failed on input", line)
	}

	speed, err := strconv.Atoi(res[1])
	if err != nil {
		log.Fatal(err)
	}
	duration, err := strconv.Atoi(res[2])
	if err != nil {
		log.Fatal(err)
	}
	rest, err := strconv.Atoi(res[3])
	if err != nil {
		log.Fatal(err)
	}

	return reindeer{speed: speed, duration: duration, rest: rest, distance: 0, points: 0}
}

func main() {
	file, err := os.Open("input/14.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	var reindeers []reindeer

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		reindeers = append(reindeers, format(scanner.Text()))
	}
	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}

	max := 0
	for i := 0; i < 2503; i++ {
		// update distance
		for j, r := range reindeers {
			t := i % (r.duration + r.rest)
			if t < r.duration {
				r.distance += r.speed
				reindeers[j] = r
				if r.distance > max {
					max = r.distance
				}
			}
		}
		// update points
		for j, r := range reindeers {
			if r.distance == max {
				r.points++
				reindeers[j] = r
			}
		}
	}

	distance, points := 0, 0
	for _, r := range reindeers {
		if r.distance > distance {
			distance = r.distance
		}
		if r.points > points {
			points = r.points
		}
	}

	fmt.Println(distance)
	fmt.Println(points)
}
