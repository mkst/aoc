# --- Day 6: Probably a Fire Hazard ---

import re

with open("input/06.txt") as f:

  size = 1000
  lit = brightness = 0

  # create matrix
  grid = [[[0,0] for i in range(size)] for i in range(size)]

  for line in f:

    action = re.findall("(on|off|toggle)", line)[0]
    from_x,from_y,to_x,to_y = map(int, re.findall("([0-9]+)", line))

    for x in range (from_x, to_x + 1):
      for y in range (from_y, to_y + 1):
        if action == "on":
          grid[x][y][0] = 1                 # switch on
          grid[x][y][1] += 1                # increase brightness
        elif action == "off":
          grid[x][y][0] = 0                 # switch off
          if grid[x][y][1] > 0:
            grid[x][y][1] -= 1              # decrease brightness
        else:
          grid[x][y][0] = 1 - grid[x][y][0] # toggle
          grid[x][y][1] += 2                # increase brightness by 2

  # calculate brightness
  for x in range (0, size):
    for y in range (0, size):
      brightness += grid[x][y][1]
      if grid[x][y][0] == 1:
        lit += 1

  print lit
  print brightness
