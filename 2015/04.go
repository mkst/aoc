package main

import (
	"crypto/md5"
	"encoding/hex"
	"fmt"
	"io/ioutil"
	"log"
	"strings"
)

func solve(secret string, prefix string) int {
	key := 0
	for {
		text := fmt.Sprintf("%s%d", secret, key)
		hash := md5.New()
		hash.Write([]byte(text))
		result := hex.EncodeToString(hash.Sum(nil))
		if strings.HasPrefix(result, prefix) {
			return key
		}
		key++
	}
}

func main() {
	data, err := ioutil.ReadFile("input/04.txt")
	if err != nil {
		log.Fatal(err)
	}

	secret := string(data[:len(data)-1]) // drop \n
	fmt.Println(solve(secret, "00000"))
	fmt.Println(solve(secret, "000000"))
}
