"""--- Day 16: Dragon Checksum ---"""

def dragon_tail(a, length):
    while len(a) < length:
        a = a + ["0"] + ["0" if a[i] == "1" else "1" for i in reversed(range(len(a)))]
    return a[:length]

def checksum(a):
    while len(a) % 2 == 0:
        a = ["1" if a[i] == a[i+1] else "0" for i in range(0, len(a)-1, 2)]
    return a

with open("input/16.txt") as f:
    text = list(f.read()[:-1])
    print(''.join(checksum(dragon_tail(text, 272))))
    print(''.join(checksum(dragon_tail(text, 35651584))))
