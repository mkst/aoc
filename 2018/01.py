# --- Day 1: Chronal Calibration ---

with open("input/01.txt") as f:
  freq = map(lambda x: int(x), f.read().split("\n")[:-1])
  c = set([0])
  a = i = 0
  while True:
    a += freq[i % len(freq)]
    if a in c:
      break
    else:
      c.add(a)
    i += 1
  print sum(freq)
  # 736
  print a
  # 75108
