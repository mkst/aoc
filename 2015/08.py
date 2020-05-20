"""--- Day 8: Matchsticks ---"""

with open("input/08.txt") as f:
  total_code = total_mem = total_recode = 0
  for line in f:
    mem = 0
    code = 2 # assume "" in every string
    i = 1
    recode = 6 # assume "\"\"" in every string

    while i < (len(line) -2):
      if line[i] == "\\":
        if line[i+1] == "x": # \x00
          code += 4
          mem += 1
          i += 4
          recode += 5
        elif line[i+1] == "\\" or line[i+1] == "\"": # \\ or \"
          code += 2
          mem += 1
          i += 2
          recode += 4
      else:
        code += 1
        i += 1
        mem += 1
        recode += 1

    total_mem += mem
    total_code += code
    total_recode += recode

  print(total_code - total_mem)
  print(total_recode - total_code)
