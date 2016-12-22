# --- Day 21: Scrambled Letters and Hash ---

def swap(l, i, j):
  t = l[i]
  l[i] = l[j]
  l[j] = t
  return l

def move(l, i, j):
  t = l.pop(i)
  l.insert(j, t)
  return l

def reverse(l, i, j):
  sub = l[i:j][::-1]
  return l[:i] + sub + l[j:]

def rotate_right(l, n):
  i = n % len(l)
  return l[-i:] + l[:-i]

def rotate_left(l, n):
  i = n % len(l)
  return l[i:] + l[:i]

with open("input/21.txt") as instructions:

  password = list("abcdefgh")

  for instruction in instructions:
    cmd = instruction.split()
    if cmd[0] == "swap":
      if cmd[1] == "position":
        password = swap(password, int(cmd[2]), int(cmd[5]))
      else:
        password = swap(password, password.index(cmd[2]), password.index(cmd[5]))
    elif cmd[0] == "reverse":
      password = reverse(password, int(cmd[2]), int(cmd[4]) + 1)
    elif cmd[0] == "rotate":
      if cmd[1] == "left":
        password = rotate_left(password, int(cmd[2]))
      elif cmd[1] == "right":
        password = rotate_right(password, int(cmd[2]))
      else:
        rotations = password.index(cmd[6]) + 1
        if rotations > 4:
          rotations += 1
        password = rotate_right(password, rotations)
    elif cmd[0] == "move":
      password = move(password, int(cmd[2]), int(cmd[5]))

  print "Part 1:","".join(password)

with open("input/21.txt") as input:
  instructions = input.read().split("\n")
  instructions.reverse()

  password = list("fbgdceah")

  for instruction in instructions[1:]:
    cmd = instruction.split()
    if cmd[0] == "swap":
      if cmd[1] == "position":
        password = swap(password, int(cmd[5]), int(cmd[2]))
      else:
        password = swap(password, password.index(cmd[5]), password.index(cmd[2]))
    elif cmd[0] == "reverse":
      password = reverse(password, int(cmd[2]), int(cmd[4]) + 1)
    elif cmd[0] == "rotate":
      if cmd[1] == "left":
        password = rotate_right(password, int(cmd[2]))
      elif cmd[1] == "right":
        password = rotate_left(password, int(cmd[2]))
      else:
        cur_pos = password.index(cmd[6])
        if cur_pos == 0:
          rotations = 1
        elif cur_pos == 1:
          rotations = 1
        elif cur_pos == 2:
          rotations = 6
        elif cur_pos == 3:
          rotations = 2
        elif cur_pos == 4:
          rotations = 7
        elif cur_pos == 5:
          rotations = 3
        elif cur_pos == 6:
          rotations = 0
        elif cur_pos == 7:
          rotations = 4
        password = rotate_left(password, rotations)
    elif cmd[0] == "move":
      password = move(password, int(cmd[5]), int(cmd[2]))
  print "Part 2:","".join(password)
