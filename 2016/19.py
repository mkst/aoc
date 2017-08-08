# --- Day 19: An Elephant Named Joseph ---

def solve_1(elves):
  circle = map(lambda x: [1, 1+x], range(elves))

  while len(circle) > 1:
    for i in range(0, len(circle)):
      p = circle[i]
      if p[0] > 0:
        # get second elf
        p2 = circle[(i+1) % len(circle)]
        # steal presents
        p2[0] = 0
    # only need to update once we've been around once
    circle = [e for e in circle if e[0] > 0]
  return circle[0][1]

def solve_2(elves):
  circle = map(lambda x: 1+x, range(elves))

  # start at first elf
  i = 0

  while len(circle) > 1:
    # find elf opposite
    opposite = (i + int(len(circle) / 2)) % len(circle)
    # remove that elf
    circle.pop(opposite)
    # determine next elf in circle
    if i == len(circle):
      i = 0     # last elf, next is first
    elif i < opposite:
      i += 1    # we removed elf ahead of us
    else:
      continue  # we removed an elf before us

  return circle[0]

with open("input/19.txt") as f:
  input = int(f.readline())
  print "Part 1:",solve_1(input)
  print "Part 2:",solve_2(input)
