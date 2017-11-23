# --- Day 23: Opening the Turing Lock ---

def day_23(instructions, register_a):

  registers = {}
  registers["a"] = register_a
  registers["b"] = 0

  counter = 0
  inst = []

  for line in instructions:
    inst.append(line.replace("\n", "").split(" "))

  i = 0
  while counter < len(inst):
    x = inst[counter]
    #print i,counter,x,registers["a"],registers["b"]
    if x[0] == "hlf":
      registers[x[1]] = registers[x[1]] / 2
      counter += 1
    elif x[0] == "tpl":
      registers[x[1]] = registers[x[1]] * 3
      counter += 1
    elif x[0] == "inc":
      registers[x[1]] = registers[x[1]] + 1
      counter += 1
    elif x[0] == "jmp":
      counter += int(x[1])
    elif x[0] == "jie":
      if registers[x[1].replace(",","")] % 2 == 0:
        counter += int(x[2])
      else:
        counter += 1
    elif x[0] == "jio":
      if registers[x[1].replace(",","")] == 1:
        counter += int(x[2])
      else:
        counter += 1
    i += 1

  return registers

with open("input/23.txt") as instructions:
  print day_23(instructions, 0)["b"]
with open("input/23.txt") as instructions:
  print day_23(instructions, 1)["b"]
