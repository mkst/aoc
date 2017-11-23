with open("input/22.txt") as input:

  nodes = []
  pairs = 0

  instructions = input.read()

  for instruction in instructions.split("\n")[2:-1]:
    path,size,used,avail,pct = instruction.split()

    _,x,y = path.split("-")
    nodes.append({ "x" : x[1:],
                   "y" : y[1:],
                   "used" : int(used[:-1]),
                   "avail" : int(avail[:-1]),})

  for i in range(0, len(nodes)):
    nodeA = nodes[i]
    if nodeA["used"] > 0:
      for j in range(0, len(nodes)):
        nodeB = nodes[j]
        if nodeB["avail"] >= nodeA["used"]:
          if nodeA["x"] != nodeB["x"] or nodeA["y"] != nodeB["y"]:
            pairs += 1

  print "Part 1:",pairs
