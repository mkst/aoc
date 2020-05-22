"""--- Day 6: Signals and Noise ---"""

with open("input/06.txt", "r") as f:
  transposed = []

  part_1 = part_2 = ""

  first = True
  for instruction in f:
    # intialise transposed on first instruction
    if first:
      transposed = [{} for x in range(len(instruction))]
      first = False
    for i, c in enumerate(instruction):
      if c in transposed[i].keys():
        transposed[i][c] += 1
      else:
        transposed[i][c] = 1

  for t in transposed:
    part_1 += [k for k, v in t.items() if v == max(t.values())][0]
    part_2 += [k for k, v in t.items() if v == min(t.values())][0]

  print(part_1[:-1])
  print(part_2[:-1])
