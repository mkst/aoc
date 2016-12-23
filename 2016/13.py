# --- Day 13: A Maze of Twisty Little Cubicles ---

def decisions(x, y):
  d = []
  # check up
  if x > 0:
    if office[y][x-1] == ".": d.append([x-1,y])
  # check down
  if x < X -1:
    if office[y][x+1] == ".": d.append([x+1,y])
  # check left
  if y > 0:
    if office[y-1][x] == ".": d.append([x,y-1])
  if y < Y -1:
    if office[y+1][x] == ".": d.append([x,y+1])
  return d

def solve(x, y, steps, destination, max_steps):

  if max_steps > 0 and len(steps) > max_steps:
    return

  if not [x,y] in visited and len(steps) <= 50:
    visited.append([x,y])

  if [x,y] == destination:
    results.append(steps)
  else:
    ds = decisions(x, y)
    d = [a for a in ds if a not in steps]

    for dd in d:
      solve(dd[0], dd[1], steps + [[x,y]], destination, max_steps)

office = []
results = []
visited = []

with open("input/13.txt") as instructions:

  favourite_number = int(instructions.read())

  X = Y = 100

  # pre-populate 100x100 grid
  for y in range(0, Y):
    office.append([])
    for x in range(0, X):
      res = x*x + 3*x + 2*x*y + y + y*y + favourite_number
      b = str(bin(res))[2:]
      ones = [a for a in b if a == "1"]
      office[y].append("." if len(ones) % 2 == 0 else "#")

  # optimise so we dont take too long
  solve(1, 1, [], [31,39], X)

  results.sort(key=lambda x: len(x))

  print "Part 1:",len(results[0])
  print "Part 2:",len(visited)
