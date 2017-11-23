# --- Day 2: I Was Told There Would Be No Math ---

paper = ribbon = 0

with open("input/02.txt") as input:
  for line in input:
    dimensions = map(lambda x: int(x), line.split("x")) # "8x5x3" -> [ 8, 5, 3]
    dimensions.sort()                                   # [ 8, 5, 3 ] -> [ 3, 5, 8 ]
    l, w, h = dimensions                                # l = 3, w = 5, h = 8
    paper += (2*l*w + 2*w*h + 2*h*l) + l*w              # (surface) + slack
    ribbon += (2*l+2*w) + l*w*h                         # (wrap) + bow

print paper
print ribbon
