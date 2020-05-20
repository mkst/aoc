"""--- Day 10: Elves Look, Elves Say ---"""

def iterate(string):
  new = []
  count = 0
  compare = string[0]
  for s in string:
    if s == compare:
      count += 1
    else:
      new.append(str(count) + compare)
      # reset
      count = 1
      compare = s
  new.append(str(count) + string[-1])
  return ''.join(new)

with open("input/10.txt") as instructions:
  for line in instructions:
    text = str(line).replace("\n", "")

  for i in range(1, 51):
    text = iterate(text)
    if i in (40, 50):
      print(len(text))
