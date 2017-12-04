#--- Day 4: High-Entropy Passphrases ---

with open("input/04.txt") as f:
    data = f.read()[:-1] # drop newline
    rows = data.split("\n")
    print sum ([len(set(x))==len(x) for x in [row.split() for row in rows]])
    #386
    print sum ([len(set(x))==len(x) for x in [["".join(sorted(y)) for y in x] for x in [row.split() for row in rows]]])
    #208