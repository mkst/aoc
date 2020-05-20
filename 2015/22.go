package main

import (
	"fmt"
)

type spell struct {
	name     string
	cost     int
	damage   int
	heal     int
	armor    int
	mana     int
	duration int
}

type character struct {
	hp     int
	mana   int
	damage int
	armor  int
	spells []spell
}

type turn struct {
	player character
	boss   character
	mana   int
	hard   bool
	turn   int
}

func play(hardMode bool) int {

	spells := []spell{
		spell{"Magic Missile", 53, 4, 0, 0, 0, 0},
		spell{"Drain", 73, 2, 2, 0, 0, 0},
		spell{"Shield", 113, 0, 0, 7, 0, 6},
		spell{"Poison", 173, 3, 0, 0, 0, 6},
		spell{"Recharge", 229, 0, 0, 0, 101, 5}}

	newGame := turn{
		character{50, 500, 0, 0, []spell{}},
		character{51, 0, 9, 0, []spell{}},
		0,
		hardMode,
		0,
	}

	bestMana := 2000

	queue := []turn{newGame}

	for {
		if len(queue) == 0 {
			break
		}

		var round turn
		round, queue = queue[0], queue[1:]

		if round.player.hp <= 0 {
			// we lost
			continue
		}

		if round.mana >= bestMana {
			// we have won with less mana
			continue
		}

		// hardmode reduces health by 1
		if hardMode && round.turn%2 == 0 {
			round.player.hp--
			// TODO: why does <= give wrong answer?
			if round.player.hp < 0 {
				continue
			}
		}

		// use spell effects
		armor := 0
		if len(round.player.spells) > 0 {
			for i, spell := range round.player.spells {
				// use effect
				round.boss.hp -= spell.damage
				round.player.hp += spell.heal
				armor += spell.armor
				spell.duration--
				round.player.mana += spell.mana
				round.player.spells[i] = spell
			}

			activeSpells := []spell{}

			for _, spell := range round.player.spells {
				if spell.duration > 0 {
					activeSpells = append(activeSpells, spell)
				}
			}

			round.player.spells = activeSpells
		}

		if round.boss.hp <= 0 {
			// we won
			if round.mana < bestMana {
				bestMana = round.mana
			}
			continue
		}

		if round.turn%2 == 0 {
			// players turn
			for _, spell := range spells {
				active := false
				for _, activeSpell := range round.player.spells {
					if activeSpell.name == spell.name {
						active = true
					}
				}
				if spell.cost <= round.player.mana && !active {
					player := round.player
					boss := round.boss
					player.mana -= spell.cost

					if spell.duration == 0 {
						// instant spell
						player.hp += spell.heal
						boss.hp -= spell.damage
					} else {
						// effect
						player.spells = append(player.spells, spell)
					}

					queue = append(queue, turn{
						player,
						boss,
						round.mana + spell.cost,
						round.hard,
						round.turn + 1,
					})
				}
			}
		} else {
			// boss' turn
			damage := round.boss.damage - armor
			if damage <= 0 {
				damage = 1
			}
			round.player.hp -= damage
			// put round back on queue for later
			round.turn++
			queue = append(queue, round)
		}
	}

	return bestMana
}
func main() {
	fmt.Println(play(false))
	fmt.Println(play(true))
}
