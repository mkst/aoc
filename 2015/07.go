package main

import (
	"bufio"
	"errors"
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
)

type inst struct {
	instruction string
	left        []string
	output      string
}

func format(line string) inst {
	split := strings.Split(line, " -> ")
	output := split[1]
	command := strings.Split(split[0], " ")
	// e.g. 1 -> a
	if len(command) == 1 {
		return inst{"ASSIGN", command[0:1], output}
	}
	// e.g. NOT b -> a
	if len(command) == 2 {
		return inst{command[0], command[1:2], output}
	}
	// e.g. x LSHIFT y -> z
	return inst{command[1], []string{command[0], command[2]}, output}
}

func lookup(circuit map[string]uint16, value string) (uint16, error) {

	if strings.ContainsAny(value, "0123456789") {
		res, err := strconv.ParseUint(value, 10, 16)
		if err != nil {
			log.Fatal(err)
		}
		return uint16(res), nil
	}

	if res, ok := circuit[value]; ok {
		return res, nil
	}
	return 0, errors.New("Not found in map")
}

func lshift(x uint16, y uint16) uint16 {
	return x << y
}

func rshift(x uint16, y uint16) uint16 {
	return x >> y
}

func and(x uint16, y uint16) uint16 {
	return x & y
}

func or(x uint16, y uint16) uint16 {
	return x | y
}

func not(x uint16) uint16 {
	return (0 - x) - 1
}

func process(circuit map[string]uint16, instructions []inst) map[string]uint16 {

	for _, instruction := range instructions {
		output := instruction.output
		if _, ok := circuit[output]; ok {
			// skip if we already have decoded the output
		} else {
			wire1, err := lookup(circuit, instruction.left[0])
			if err != nil {
				continue
			}
			var fn func(uint16, uint16) uint16
			switch instruction.instruction {
			case "ASSIGN":
				circuit[output] = wire1
				continue
			case "NOT":
				circuit[output] = not(wire1)
				continue
			case "LSHIFT":
				fn = lshift
			case "RSHIFT":
				fn = rshift
			case "AND":
				fn = and
			case "OR":
				fn = or
			default:
				fmt.Println("Unknown command", instruction.instruction)
				continue
			}
			wire2, err := lookup(circuit, instruction.left[1])
			if err != nil {
				continue
			}
			circuit[output] = fn(wire1, wire2)
		}
	}
	return circuit
}

func iterate(circuit map[string]uint16, instructions []inst) uint16 {
	for {
		if a, ok := circuit["a"]; ok {
			return a
		}
		circuit = process(circuit, instructions)
	}
}

func main() {
	file, err := os.Open("input/07.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)

	var instructions []inst

	for scanner.Scan() {
		res := format(scanner.Text())
		instructions = append(instructions, res)
	}
	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}

	a := iterate(make(map[string]uint16), instructions)
	fmt.Println(a)

	instructions = append([]inst{inst{"ASSIGN", []string{strconv.Itoa(int(a))}, "b"}},
		instructions...)

	fmt.Println(iterate(make(map[string]uint16), instructions))
}
