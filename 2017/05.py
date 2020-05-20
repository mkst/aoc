"""--- Day 5: A Maze of Twisty Trampolines, All Alike ---"""

with open("input/05.txt") as f:
    data = f.read()[:-1] # drop newline
    inst = list(map(int, data.split("\n")))
    ptr = cnt = 0
    while ptr < len(inst):
        o = inst[ptr]
        inst[ptr] += 1
        ptr += o
        cnt += 1
    print(cnt)
    #343467
    inst = list(map(int, data.split("\n")))
    ptr = cnt = 0
    while ptr < len(inst):
        o = inst[ptr]
        inst[ptr] += -1 if o >= 3 else 1
        ptr += o
        cnt += 1
    print(cnt)
    #24774780
