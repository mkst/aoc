"""--- Day 1: No Time for a Taxicab ---"""

def manhattan(x, y):
    return abs(x) + abs(y)

with open("input/01.txt", "r") as f:
    # start at 0,0 facing north
    x = y = heading = 0
    positions = [(0, 0)]

    for instruction in f.read().split(","):
        # strip off the whitespace
        instruction = instruction.strip()
        # could use regex...
        direction, blocks = instruction[0], int(instruction[1:])
        # mod 4 to keep us in the confines of reality
        heading = (heading + (1 if direction == "R" else -1)) % 4

        for i in range(blocks):
            if heading == 0:
                # heading north
                y += 1
            elif heading == 1:
                # heading east
                x += 1
            elif heading == 2:
                # heading south
                y -= 1
            else:
                # heading west
                x -= 1
            positions.append((x, y))

    print(manhattan(x, y))

    hq = [x for x in positions if positions.count(x) > 1][0]
    print(manhattan(hq[0], hq[1]))
