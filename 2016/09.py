# --- Day 9: Explosives in Cyberspace ---

def recurse(chomp, recurse_level, recurse_once):

  if recurse_once and recurse_level > 0:
    return len(chomp)

  i = length = 0
  while i < len(chomp):
    if chomp[i] == "(":
      rb = chomp.find(")", i)
      marker = chomp[i+1:rb]
      count, multi = [ int(x) for x in marker.split("x") ]
      length += multi * recurse(chomp[rb+1:rb+1+count], recurse_level+1, recurse_once)
      i = rb + count + 1 # skip over "(AxB)..."
    elif chomp[i] == "\n":
      i += 1
    else:
      length += 1
      i += 1

  return length

with open ("input/09.txt") as instructions:

  part1 = part2 = 0

  for instruction in instructions:
    part1 += recurse(instruction, 0, True)
    part2 += recurse(instruction, 0, False)

  print "Part 1:",part1
  print "Part 2:",part2
