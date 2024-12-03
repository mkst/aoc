import re

with open("input/03.txt") as f:
    lines = f.readlines()

total = 0
for line in lines:
    match = re.findall(r"mul\(([0-9]+),([0-9]+)\)", line)
    for x, y in match:
        total += int(x) * int(y)

print(total)
# 161289189

total = 0
enabled = True
for line in lines:
    match = re.findall(r"mul\(([0-9]+),([0-9]+)\)|(do)\(\)|(don't)\(\)", line)
    for x, y, do, dont in match:
        if do:
            enabled = True
            continue
        if dont:
            enabled = False
            continue
        if enabled:
            total += int(x) * int(y)

print(total)
# 83595109
