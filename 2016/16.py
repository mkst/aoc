# --- Day 16: Dragon Checksum ---

def dragon_tail(a, length):
  while len(a) < length:
    b = ""
    for i in reversed(range(0, len(a))):
      if a[i] == "1":
        b += "0"
      else:
        b += "1"
    a = a + "0" + b
  return a[:length]

def checksum(a):
  while len(a) % 2 == 0:
    cs = ""
    for i in range(0, len(a)-1, 2):
      if a[i] == a[i+1]:
        cs += "1"
      else:
        cs += "0"
    a = cs
  return a

with open("input/16.txt") as instructions:
  input = instructions.read()[:-1] 
  print "Part 1:",checksum(dragon_tail(input, 272))
  print "Part 2:",checksum(dragon_tail(input, 35651584))
