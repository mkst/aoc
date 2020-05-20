"""--- Day 2: Corruption Checksum ---"""

import itertools

with open("input/02.txt", "r") as f:
    data = f.read()[:-1] # drop newline
    rows = data.split("\n")
    print(sum([max(x)-min(x) for x in [list(map(int, x)) for x in map(str.split, rows)]]))
    #45351
    print(sum(map(lambda x: [a//b for a, b in x if a%b == 0][0],
                  [itertools.permutations(x, 2) for x in [map(int, x.split()) for x in rows]])))
    #275
