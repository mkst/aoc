package main

import (
	"fmt"
	"strings"
)

func increment(text string) string {
	if len(text) == 0 {
		return "a"
	}

	lastIndex := len(text) - 1
	if text[lastIndex] < byte('z') {
		return text[:lastIndex] + string(text[lastIndex]+1)
	}
	return increment(text[:lastIndex]) + "a"
}

func validate(text string) bool {
	// Passwords may not contain the letters i, o, or l, as these letters can be mistaken for other characters and are therefore confusing.
	if strings.ContainsAny(text, "iol") {
		return false
	}
	// Passwords must contain at least two different, non-overlapping pairs of letters, like aa, bb, or zz.
	doubles := ""
	for i := 0; i < len(text)-1; i++ {
		if text[i] == text[i+1] {
			if !strings.Contains(doubles, string(text[i])) {
				doubles += string(text[i])
				// skip 1 to avoid 'aaa' being counted twice
				i++
			}
		}
	}
	if len(doubles) < 2 {
		return false
	}
	// Passwords must include one increasing straight of at least three letters, like abc, bcd, cde, and so on, up to xyz. They cannot skip letters; abd doesn't count.
	for i := 0; i < len(text)-3; i++ {
		if text[i]+1 == text[i+1] && text[i]+2 == text[i+2] {
			return true
		}
	}
	return false
}

func nextPassword(current string) string {
	for {
		current = increment(current)
		if validate(current) {
			return current
		}
	}
}

func main() {
	password := "vzbxkghb"
	newPass := nextPassword(password)
	fmt.Println(newPass)
	fmt.Println(nextPassword(newPass))
}
