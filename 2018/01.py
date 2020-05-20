"""--- Day 1: Chronal Calibration ---"""

with open("input/01.txt") as f:
    freq = list(map(int, f.read().split("\n")[:-1]))
    c = set([0])
    a = i = 0
    while True:
        a += freq[i % len(freq)]
        if a in c:
            break
        c.add(a)
        i += 1
    print(sum(freq))
    # 536
    print(a)
    # 75108
