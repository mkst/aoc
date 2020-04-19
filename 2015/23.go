package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
)

type instruction struct {
	inst     string
	register string
	offset   int
}

func run(instructions []instruction, a int) int {
	ptr, b := 0, 0

	for {
		if ptr >= len(instructions) {
			break
		}

		instruction := instructions[ptr]

		switch instruction.inst {
		case "hlf":
			if instruction.register == "a" {
				a = a / 2
			} else {
				b = b / 2
			}
			ptr++
			break
		case "tpl":
			if instruction.register == "a" {
				a = a * 3
			} else {
				b = b * 3
			}
			ptr++
			break
		case "inc":
			if instruction.register == "a" {
				a++
			} else {
				b++
			}
			ptr++
			break
		case "jmp":
			ptr += instruction.offset
			break
		case "jie":
			if instruction.register == "a" {
				if a%2 == 0 {
					ptr += instruction.offset
				} else {
					ptr++
				}
			} else {
				if b%2 == 0 {
					ptr += instruction.offset
				} else {
					ptr++
				}
			}
			break
		case "jio":
			if instruction.register == "a" {
				if a == 1 {
					ptr += instruction.offset
				} else {
					ptr++
				}
			} else {
				if b == 1 {
					ptr += instruction.offset
				} else {
					ptr++
				}
			}
			break
		}
	}
	return b
}

func format(line string) instruction {
	inst := instruction{"", "", 0}

	split := strings.Split(line, " ")
	inst.inst = split[0]
	if len(split) == 2 {
		if inst.inst == "jmp" {
			offset, err := strconv.Atoi(split[1])
			if err != nil {
				log.Fatal(err)
			}
			inst.offset = offset
		} else {
			inst.register = split[1]
		}
	} else {
		inst.register = string(split[1][0])
		offset, err := strconv.Atoi(split[2])
		if err != nil {
			log.Fatal(err)
		}
		inst.offset = offset
	}
	return inst
}

func main() {

	file, err := os.Open("input/23.txt")
	if err != nil {
		log.Fatal(err)
	}

	instructions := []instruction{}

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		instructions = append(instructions, format(scanner.Text()))
	}

	fmt.Println(run(instructions, 0))
	fmt.Println(run(instructions, 1))
}
