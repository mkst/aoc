with open("input/06.txt") as input:
  instructions = input.read()

  transposed = []

  part_1 = part_2 = ""

  for instruction in instructions.split("\n")[:-1]:

    # intialise transposed on first instruction
    if len(transposed) == 0:
      transposed = [ {} for x in range(0, len(instruction)) ]
  
    for i in range(0, len(instruction)):
      c = instruction[i]
      if c in transposed[i].keys():
        transposed[i][c] += 1
      else:
        transposed[i][c] = 1

  for t in transposed:
    part_1 += [ k for k, v in t.items() if v == max(t.values()) ][0]
    part_2 += [ k for k, v in t.items() if v == min(t.values()) ][0]

  print "Part 1:",part_1
  print "Part 2:",part_2    
