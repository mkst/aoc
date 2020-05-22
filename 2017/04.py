"""--- Day 4: High-Entropy Passphrases ---"""

with open("input/04.txt", "r") as f:
    data = f.read()[:-1] # drop newline
    rows = data.split("\n")
    print(sum([len(set(x)) == len(x) for x in [row.split() for row in rows]]))
    #386
    print(sum(map(lambda x: len(set(x))==len(x), map(lambda x: ["".join(sorted(y)) for y in x], map(str.split, rows)))))
    #208
