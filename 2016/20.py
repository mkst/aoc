"""--- Day 20: Firewall Rules ---"""

with open("input/20.txt", "r") as f:
    instructions = f.read().split("\n")[:-1]

    mn = 0
    mx = 4294967295
    mxo = 0
    gaps = 0

    # sort instructions
    instructions.sort(key=lambda x: int(x.split("-")[0]))

    for instruction in instructions:
        low, high = [int(x) for x in instruction.split("-")]
        # part 1
        if low <= mn < high:
            mn = high + 1
        # part 2
        if low > mxo:
            gaps += low - mxo
        if high >= mxo:
            mxo = high + 1

    print(mn)
    print(gaps + (mx - mxo) + 1)
