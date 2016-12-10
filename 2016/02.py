# --- Day 2: Bathroom Security ---

def solve(keypad, instructions, start_row, start_col):

  row = start_row
  col = start_col

  code = []

  rc = len(keypad) - 1

  for instruction in instructions:
    if instruction == "U":
      if row > 0 and (keypad[row-1][col] != None):
        row -= 1
    elif instruction == "D":
      if row < rc and (keypad[row+1][col] != None):
        row += 1
    elif instruction == "L":
      if col > 0 and (keypad[row][col-1] != None):
        col -= 1
    elif instruction == "R":
      if col < rc and (keypad[row][col+1] != None):
        col += 1
    elif instruction == "\n":
      code.append(keypad[row][col])

  return "".join(map(lambda x: str(x), code))

with open("input/02.txt", "r") as input:
  instructions = input.read()

  keypad = {}

  # part 1
  keypad[0] = [None, None, None, None, None]
  keypad[1] = [None,  1,    2,    3  , None]
  keypad[2] = [None,  4,    5,    6  , None]
  keypad[3] = [None,  7,    8,    9  , None]
  keypad[4] = [None, None, None, None, None]

  print "Part 1:",solve(keypad, instructions, 2, 2) # start on 5

  # part 2
  keypad[0] = [None, None,  1,  None, None]
  keypad[1] = [None,  2,    3,   4,   None]
  keypad[2] = [5,     6,    7,   8,    9  ]
  keypad[3] = [None, "A",  "B", "C",  None]
  keypad[4] = [None, None, "D", None, None]

  print "Part 2:",solve(keypad, instructions, 0, 2) # start on 5
