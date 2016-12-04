# --- Day 1: No Time for a Taxicab ---

with open("input/01.txt", "r") as input:
  instructions = input.read()

  # start at 0,0 facing north
  x = y = heading = 0
  positions = [ [0,0] ]

  for instruction in instructions.split(","):

    # strip off the whitespace
    instruction = instruction.strip()

    # could use regex...
    direction = instruction[0]
    blocks = int(instruction[1:])

    # mod 360 to keep us in the confines of reality
    heading = (heading + (90 if direction == "R" else -90)) % 360

    if heading == 0:
      # heading north
      for i in range(0, blocks):
        y += 1
        positions.append([x,y])
    elif heading == 90:
      # heading east
      for i in range(0, blocks):
        x += 1
        positions.append([x,y])
    elif heading == 180:
      # heading south
      for i in range(0, blocks):
        y -= 1
        positions.append([x,y])
    else: 
      # heading west
      for i in range(0, blocks):
        x -= 1
        positions.append([x,y])

  print "Part 1:",abs(x) + abs(y)

  hq = [x for x in positions if positions.count(x) > 1][0]
  print "Part 2:",abs(hq[0])+abs(hq[1])
