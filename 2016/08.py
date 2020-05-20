"""--- Day 8: Two-Factor Authentication ---"""

def rotate(row, n):
  i = n % len(row)
  return row[-i:] + row[:-i]

with open("input/08.txt", "r") as instructions:
  width, height = 50, 6

  # initialise display
  lcd = [[" " for i in range(width)] for i in range(height)]

  for instruction in instructions:
    if instruction.startswith("rect"):
      # e.g. 'rect 3x2'
      x, y = [int(x) for x in instruction.split(" ")[1].split("x")]
      # light em up
      for i in range(y):
        for j in range(x):
          lcd[i][j] = "#"
    else:
      # e.g. 'rotate column x=1 by 1'
      _, rc, xy, _, by = instruction.split(" ")

      if rc == "row":
        y = int(xy.split("=")[-1])
        lcd[y] = rotate(lcd[y], int(by))
      else:
        x = int(xy.split("=")[-1])
        col = rotate([l[x] for l in lcd], int(by))
        for l in lcd:
          l[x] = col.pop(0)

  part1 = 0
  part2 = "\n"
  for row in lcd:
    part2 += "".join(row) + "\n"
    for led in row:
      if led == "#":
        part1 += 1

  print(part1)
  print(part2)
