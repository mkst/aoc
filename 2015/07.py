# --- Day 7: Some Assembly Required ---

import re

def solve(instructions, find):

  wires = {}
  values = {}

  for line in instructions:

    left,right = map(str.strip, line.split("->"))

    gate  = None
    inputs = []

    # lx -> x, 123 -> x
    m = re.findall("^([a-z]+|[0-9]+)$", left)
    if m:
      inputs = m[0]
      gate = "WIRE"

    # x OR y -> e, 1 OR z
    m = re.findall("(AND|OR)", left)
    if m:
      gate = m[0]
      inputs = re.findall("([a-z]+|[0-9]+)", left)

    # NOT x -> h
    m = re.findall("(NOT) ([a-z]+)$", left)
    if m:
      gate, inputs = m[0]

    # y RSHIFT 2 -> g
    m = re.findall("([a-z]+) (LSHIFT|RSHIFT) ([0-9]+)", left)
    if m:
      inputs = m[0][0], m[0][2]
      gate = m[0][1].strip()

    wires[right] = { "gate" : gate, "inputs" : inputs}

  # bruteforce
  for i in range(0,1000):

    for wire, circuit in wires.iteritems():
      if wire not in values:
        if circuit["gate"] == "WIRE":
          if re.match("[0-9]+", circuit["inputs"]):
            values[wire] = int(circuit["inputs"])
          elif circuit["inputs"] in values:
            values[wire] = values[circuit["inputs"]]

        elif circuit["gate"] == "LSHIFT":
          if circuit["inputs"][0] in values:
            values[wire] = values[circuit["inputs"][0]] << int(circuit["inputs"][1])

        elif circuit["gate"] == "RSHIFT":
          if circuit["inputs"][0] in values:
            values[wire] = values[circuit["inputs"][0]] >> int(circuit["inputs"][1])

        elif circuit["gate"] == "NOT":
          if re.match("[0-9]+", circuit["inputs"]):
            values[wire] = ~ int(circuit["inputs"])
          elif circuit["inputs"] in values:
            values[wire] = ~ values[circuit["inputs"]]

        elif circuit["gate"] == "AND":
          if re.match("[0-9]+", circuit["inputs"][0]):
            # number & value
            if circuit["inputs"][1] in values:
              values[wire] = int(circuit["inputs"][0]) & values[circuit["inputs"][1]]
          elif circuit["inputs"][0] in values and circuit["inputs"][1] in values:
            values[wire] = values[circuit["inputs"][0]] & values[circuit["inputs"][1]]

        elif circuit["gate"] == "OR":
          if re.match("[0-9]+", circuit["inputs"][0]):
            # number & value
            if circuit["inputs"][1] in values:
              values[wire] = int(circuit["inputs"][0]) | values[circuit["inputs"][1]]
          elif circuit["inputs"][0] in values and circuit["inputs"][1] in values:
            values[wire] = values[circuit["inputs"][0]] | values[circuit["inputs"][1]]

  if find in values:
    return  { find : values[find] % 65536 }
  else:
    return None

with open("input/07.txt") as instructions:
  print solve(instructions, "a")["a"]


with open("input/07_2.txt") as instructions:
  print solve(instructions, "a")["a"]

