"""--- Day 13: Knights of the Dinner Table ---"""

from itertools import permutations

def day_13 (instructions, add_self):

  guests = {}
  if add_self:
    guests["Mark"] = {}

  for line in instructions:
    # Carol would gain 37 happiness units by sitting next to Alice.
    guest, _, gain, happiness, _, _, _, _, _, _, neighbour = line.replace(".\n", "").split(" ")

    happiness = int(happiness)

    if gain == "lose":
      happiness *= -1

    if guest not in guests:
      guests[guest] = {}

    guests[guest][neighbour] = happiness

    if add_self:
      guests[guest]["Mark"] = 0
      guests["Mark"][guest] = 0

  h = []

  for p in permutations(guests):
    happy = 0
    for i in range(len(p) - 1):
      happy += guests[p[i]][p[i+1]]
      happy += guests[p[i+1]][p[i]]
    #wraparound
    happy += guests[p[len(p) - 1]][p[0]]
    happy += guests[p[0]][p[len(p) - 1]]

    h.append(happy)
  return max(h)

with open("input/13.txt") as instructions:
  print(day_13(instructions, False))
with open("input/13.txt") as instructions:
  print(day_13(instructions, True))
