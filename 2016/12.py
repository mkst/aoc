def solve(instructions, registers):

  # intialise program counter to zero
  cnt = 0

  while(cnt < len(instructions)):
    inst = instructions[cnt].split(" ")
    if inst[0][0] == "c":                       # cpy
      if inst[1] in registers:
        registers[inst[2]] = registers[inst[1]]
      else:
        registers[inst[2]] = int(inst[1])
    elif inst[0][0] == "i":                     # inc
      registers[inst[1]] += 1
    elif inst[0][0] == "d":                     # dec
      registers[inst[1]] -= 1
    else:                                       # jnz
      if inst[1] in registers:
        if registers[inst[1]] != 0:
          cnt += int(inst[2]); continue
      else:
        if int(inst[1]) != 0:
          cnt += int(inst[2]); continue

    # increment program counter
    cnt += 1

  return registers

with open ("input/12.txt") as input:
  instructions = [x[:-1] for x in input] # drop "\n"

  print "Part 1:",solve(instructions, { "a" : 0, "b" : 0, "c" : 0, "d" : 0} )["a"]
  print "Part 2:",solve(instructions, { "a" : 0, "b" : 0, "c" : 1, "d" : 0} )["a"]
