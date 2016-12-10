# --- Day 9: Explosives in Cyberspace ---

instructions = ["A(1x5)BC", "(3x3)XYZ", "A(2x2)BCD(2x2)EFG", "(6x1)(1x3)A", "X(8x2)(3x3)ABCY"]

with open ("input/09.txt") as input:
  instructions = input.read().split("\n")[:-1]
  decompressed_length = 0
  for instruction in instructions:
    output = ""
    i = 0
    while i < len(instruction):
      c = instruction[i]
      if c == "(":
        marker = ""
        i += 1 # skip over (
        while instruction[i] != ")":
          marker += instruction[i]
          i += 1
        characters, count = map(lambda x: int(x), marker.split("x"))
        i += 1 # skip over )
        output += count * instruction[i:i+characters]
        i += characters
      else:
        output += c + ""
        i += 1
    decompressed_length += len(output)

  print decompressed_length
