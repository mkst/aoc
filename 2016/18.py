# --- Day 18: Like a Rogue ---

def solve(instruction, max_rows):
  rows = [instruction]
  length = len(instruction)

  for row in range(0, max_rows - 1):
    line = rows[-1]
    out = ""
    for i in range(0, length):
      if i == 0:
        if line[i+1] == "^":
          out += "^"
        else:
          out += "."
      elif i == length - 1:
        if line[i-1] == "^":
          out += "^"
        else:
          out += "."
      else:
        l = line[i-1]
        c = line[i]
        r = line[i+1]

        if l == "^" and c == "^" and r == ".":
          out += "^"
        elif l == "." and c == "^" and r == "^":
          out += "^"
        elif l == "^" and c == "." and r == ".":
          out += "^"
        elif l == "." and c == "." and r == "^":
          out += "^"
        else:
          out += "."
    rows.append(out)
    
  safes = 0

  for r in rows:
    safes += sum([ 1 for x in r if x == "." ])
  return safes


with open("input/18.txt") as instructions:
  instruction = instructions.read()[:-1]
  print "Part 1:",solve(instruction, 40)
  print "Part 2:",solve(instruction, 400000)
