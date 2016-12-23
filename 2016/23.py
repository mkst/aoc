# --- Day 23: Safe Cracking ---

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
    elif inst[0][0] == "j":                     # jnz
      if inst[2] in registers:
         jmp = registers[inst[2]]
      else:
         jmp = int(inst[2])
      if inst[1] in registers:
        if registers[inst[1]] != 0:
          cnt += jmp; continue
      else:
        if int(inst[1]) != 0:
          cnt += jmp; continue
    else:                                       # tgl
      jmp = cnt + registers[inst[1]]
      if jmp < len(instructions):
        tgl = instructions[jmp]
        inst = tgl.split()
        if len(inst) == 2:
          if inst[0] == "inc":
            instructions[jmp] = "dec " + inst[1]
          else:
            instructions[jmp] = "inc " + inst[1]
        else:
          if inst[0] == "jnz":
            instructions[jmp] = "cpy " + " ".join(inst[1:])
          else:
            instructions[jmp] = "jnz " + " ".join(inst[1:])

    # increment program counter
    cnt += 1

  return registers

with open ("input/23.txt") as input:
  instructions = [x[:-1] for x in input] # drop "\n"

  print "Part 1:",solve(instructions, { "a" : 7, "b" : 0, "c" : 0, "d" : 0} )["a"]
  print "Part 1:",solve(instructions, { "a" : 12, "b" : 0, "c" : 0, "d" : 0} )["a"]
