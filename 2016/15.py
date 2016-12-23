# --- Day 15: Timing is Everything ---

def solve(disks):
  start_t = 0
  while True:
    t = start_t
    valid = True
    for d in disks:
      t += 1
      if (d[0] + t) % d[1] != 0:
        valid = False
        break
    if valid:
      break
    start_t += 1
  return start_t

with open("input/15.txt") as instructions:

  disks = []

  for instruction in instructions:
    _,_,_,positions,_,_,_,_,_,_,_,position = instruction.split()
    disks.append([int(position[:-1]), int(positions)])

  print "Part 1",solve(disks)
  disks.append([0, 11])
  print "Part 2",solve(disks)
