# --- Day 1: Not Quite Lisp ---

floor = reached_basement = 0

with open("input/01.txt") as f:
  # ( is up
  # ) is down
  instructions = f.read()
  reached_basement = False

  for i in range(len(instructions)):
    if instructions[i] == '(':
      floor += 1
    else:
      floor += -1
    if floor < 0 and reached_basement == 0:
      reached_basement = i + 1

print floor
print reached_basement
