# --- Day 13: Distress Signal ---

import json

with open("input/13.txt") as f:
    data = f.readlines()

pairs = []

for i in range(0, len(data), 3):
    pair_1 = json.loads(data[i].strip())
    pair_2 = json.loads(data[i+1].strip())
    pairs.append((pair_1, pair_2))

results = []

def f(left, right):
    if isinstance(left, int) and isinstance(right, int):
        if left == right:
            return None
        return left < right
    elif isinstance(left, list) and isinstance(right, int):
        return f(left, [right])
    elif isinstance(left, int) and isinstance(right, list):
        return f([left], right)
    elif isinstance(left, list) and isinstance(right, list):
        if len(left) == 0 and len(right) == 0:
            return None
        if len(left) == 0:
            return True
        if len(right) == 0:
            return False

        res = f(left[0], right[0])
        if res is None:
            return f(left[1:], right[1:])
        else:
            return res

    raise Exception("Invalid input")


for i, (p1, p2) in enumerate(pairs):
    if f(p1, p2):
        results.append(i+1)

print(sum(results))
# 6235

class Pair():
    def __init__(self, value):
        self.value = value

    def __lt__(self, other):
        return f(self.value, other.value)

    def __eq__(self, other):
        return self.value == other.value

new_pairs = []
for (left, right) in pairs:
    new_pairs.append(Pair(left))
    new_pairs.append(Pair(right))

divider_1 = Pair([[2]])
divider_2 = Pair([[6]])

new_pairs.append(divider_1)
new_pairs.append(divider_2)

res = []
for i,x in enumerate(sorted(new_pairs)):
    if x == divider_1 or x == divider_2:
        res.append(i + 1)

print(res[0] * res[1])
# 22866
