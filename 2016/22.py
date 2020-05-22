"""--- Day 22: Grid Computing ---"""

with open("input/22.txt") as f:

    nodes = []
    instructions = f.read()

    for instruction in instructions.split("\n")[2:-1]:
        path, size, used, avail, pct = instruction.split()

        _, x, y = path.split("-")
        nodes.append({
            "x": x[1:],
            "y": y[1:],
            "used": int(used[:-1]),
            "avail": int(avail[:-1])
        })

    pairs = 0
    for i, _ in enumerate(nodes):
        nodeA = nodes[i]
        if nodeA["used"] > 0:
            for j, _ in enumerate(nodes):
                nodeB = nodes[j]
                if nodeB["avail"] >= nodeA["used"]:
                    if nodeA["x"] != nodeB["x"] or nodeA["y"] != nodeB["y"]:
                        pairs += 1

    print(pairs)
