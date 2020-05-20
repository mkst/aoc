package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
)

type item struct {
	cost   int
	damage int
	armor  int
}

type character struct {
	hp     int
	damage int
	armor  int
}

func cartesian2(x [][]string, y [][]string) [][]string {
	var combos [][]string

	for _, v := range x {
		for _, w := range y {
			combos = append(combos, append(v, w...))
		}
	}

	return combos
}

func cartesian(x []string, y []string) [][]string {
	var combos [][]string

	for _, v := range x {
		for _, w := range y {
			combos = append(combos, []string{v, w})
		}
	}

	return combos
}

func combinations(x []string) [][]string {
	var combos [][]string

	for i, v := range x {
		for j, w := range x {
			// no dupes
			if j < i {
				combos = append(combos, []string{v, w})
			}
		}
	}

	return combos
}

func fight(player1 character, player2 character) bool {

	i := 0
	for {
		if player1.hp <= 0 {
			return false
		}
		if player2.hp <= 0 {
			return true
		}

		if i%2 == 0 {
			// player 1
			damage := player1.damage - player2.armor
			if damage <= 0 {
				damage = 1
			}
			player2.hp -= damage
		} else {
			// player 2
			damage := player2.damage - player1.armor
			if damage <= 0 {
				damage = 1
			}
			player1.hp -= damage
		}

		i++
	}

	return false
}

func main() {

	file, err := os.Open("input/21.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	boss := character{0, 0, 0}

	scanner := bufio.NewScanner(file)
	i := 0
	for scanner.Scan() {
		tmp, err := strconv.Atoi(strings.Split(scanner.Text(), ": ")[1])
		if err != nil {
			log.Fatal(err)
		}

		if i == 0 {
			boss.hp = tmp
		} else if i == 1 {
			boss.damage = tmp
		} else if i == 2 {
			boss.armor = tmp
		}
		i++
	}

	items := make(map[string]item)
	// weapons
	items["Dagger"] = item{8, 4, 0}
	items["Shortsword"] = item{10, 5, 0}
	items["Warhammer"] = item{25, 6, 0}
	items["Longsword"] = item{40, 7, 0}
	items["Greataxe"] = item{74, 8, 0}
	// armor
	items["No Armor"] = item{0, 0, 0}
	items["Leather"] = item{13, 0, 1}
	items["Chainmail"] = item{31, 0, 2}
	items["Splintmail"] = item{53, 0, 3}
	items["Bandedmail"] = item{75, 0, 4}
	items["Platemail"] = item{102, 0, 5}
	// rings
	items["No Ring 1"] = item{0, 0, 0}
	items["No Ring 2"] = item{0, 0, 0}
	items["Damage +1"] = item{25, 1, 0}
	items["Damage +2"] = item{50, 2, 0}
	items["Damage +3"] = item{100, 3, 0}
	items["Defense +1"] = item{20, 0, 1}
	items["Defense +2"] = item{40, 0, 2}
	items["Defense +3"] = item{80, 0, 3}

	weapons := []string{"Dagger", "Shortsword", "Warhammer", "Longsword", "Greataxe"}
	armor := []string{"No Armor", "Leather", "Chainmail", "Splintmail", "Bandedmail", "Platemail"}
	rings := []string{"No Ring 1", "No Ring 2", "Damage +1", "Damage +2", "Damage +3", "Defense +1", "Defense +2", "Defense +3"}

	cheapWin := 1000
	expensiveLoss := 0

	for _, combo := range cartesian2(combinations(rings), cartesian(weapons, armor)) {
		cost := 0
		damage := 0
		armor := 0
		for _, item := range combo {
			cost += items[item].cost
			damage += items[item].damage
			armor += items[item].armor
		}

		player := character{100, damage, armor}

		if fight(player, boss) {
			if cost < cheapWin {
				cheapWin = cost
			}
		} else {
			if cost > expensiveLoss {
				expensiveLoss = cost
			}
		}
	}

	fmt.Println(cheapWin)
	fmt.Println(expensiveLoss)

}
