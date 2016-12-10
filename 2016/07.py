with open ("input/07.txt") as input:
  instructions = input.read()

  part_1 = part_2 = 0

  for instruction in instructions.split("\n"):
    abba_bad = abba_good = False

    in_square_brackets = False

    aba_potentials = [] 
    bab_potentials = []

    # do the work
    for i in range(0, len(instruction) - 3):

      # common to both parts
      if instruction[i] == "[":
        in_square_brackets = True
        continue
      elif instruction[i] == "]":
        in_square_brackets = False
        continue

      # part 2
      if instruction[i] == instruction[i+2]:
        if instruction[i] != instruction[i+1]:
          if in_square_brackets:
            aba_potentials.append(instruction[i:i+3])
          else:
            bab_potentials.append(instruction[i:i+3])

      # part 1
      if instruction[i] != instruction[i+3]:   # a__b
        continue
      if instruction[i] == instruction[i+1]:   # aa__
        continue
      if instruction[i+1] != instruction[i+2]: # _ab_
        continue
      if in_square_brackets:
        abba_bad = True
      abba_good = True

    # ugly hack to get the final 3 chars
    if len(instruction) > 2:
      if instruction[i+1] == instruction[i+3]:
        if instruction[i+1] != instruction[i+2]:
          if in_square_brackets:
            aba_potentials.append(instruction[i+1:i+4])
          else:
            bab_potentials.append(instruction[i+1:i+4])

    if abba_good and not abba_bad:
      part_1 += 1

    if len(aba_potentials) > 0:
      for aba in aba_potentials:
        inverse = aba[1] + aba[0] + aba[1]
        if inverse in bab_potentials:
          part_2 += 1
          break

  print "Part 1:",part_1
  print "Part 2:",part_2
