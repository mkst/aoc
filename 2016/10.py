# --- Day 10: Balance Bots ---

with open ("input/10.txt") as instructions:

  bots = {}
  bot_instructions = {}

  outputs = {}

  for instruction in instructions:
    instruction = instruction.replace("\n", "")
    if instruction.startswith("value"):
      _,chip,_,_,_,bot = instruction.split(" ")

      if not bot in bots.keys(): bots[bot] = []

      # give bot the chip
      bots[bot].append(int(chip))
      bots[bot].sort()
    else:
      _,bot,_,_,_,low_type,low,_,_,_,high_type,high = instruction.split(" ")

      bot_instructions[bot] = { "low_type" : low_type, "low" : low,\
                                "high_type": high_type, "high": high }

  while True:
    todo = [k for k,v in bots.iteritems() if len(v) == 2]

    if len(todo) == 0:
      break
    for t in todo:
      bot = t
      chips = bots[bot]
      if chips == [17, 61]:
        print "Part 1:",bot
      # execute instruction
      low = bot_instructions[bot]["low"]
      high = bot_instructions[bot]["high"]

      chip_low = chips.pop(0) # pop low
      chip_high = chips.pop() # pop high

      # sort out lows
      if bot_instructions[bot]["low_type"] == "output":
        if not low in outputs.keys(): outputs[low] = []
        outputs[low].append(chip_low)
      else:
        if not low in bots.keys(): bots[low] = []
        bots[low].append(chip_low)
        bots[low].sort()
      # sort out highs
      if bot_instructions[bot]["high_type"] == "output":
        if not high in outputs.keys(): outputs[high] = []
        outputs[high].append(chip_high)
      else:
        if not high in bots.keys(): bots[high] = []
        bots[high].append(chip_high)
        bots[high].sort()

  print "Part 2:", outputs["0"][0] * outputs["1"][0] * outputs["2"][0]
