# --- Day 10: Elves Look, Elves Say ---

def iteration(string):
  new = ""
  count = 0
  compare = string[0]
  for i in range(0,len(string)):
    if string[i] == compare:
      count += 1
    else:
      new += str(count) + compare
      # reset
      count = 1
      compare = string[i]
  return new + str(count) + string[-1]

def day_10 (instructions, iterations):

  string = instructions.replace("\n","")

  for j in range(0,iterations):
    string = iteration(string)
  return { "string" : string, "length" : len(string) }

with open("input/10.txt") as instructions:
  for line in instructions:
    a = day_10(line, 40)
    print a["length"]
    b = day_10(line, 50)
    print b["length"]
