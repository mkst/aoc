# --- Day 25: Clock Signal ---

def solve(instructions, registers):

  # intialise program counter to zero
  cnt = 0
  # initialise blank transmission
  transmission = []

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
    elif inst[0][0] == "o":                     # out
      transmission.append(registers[inst[1]])
      if len(transmission) == 16:
        return transmission == 8*[0,1]
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

  return False

with open ("input/25.txt") as input:
  instructions = [x[:-1] for x in input] # drop "\n"
  for i in range(1000):
    if solve(instructions, { "a" : i, "b" : 0, "c" : 0, "d" : 0 }):
      print "Part 1:",i
      break
