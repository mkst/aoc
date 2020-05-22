"""--- Day 17: No Such Thing as Too Much ---"""

from itertools import chain, combinations

buckets = [ 11, 30, 47, 31,
            32, 36, 3, 1,
            5, 3, 32, 36,
            15, 11, 46, 26,
            28, 1, 19, 3]

def powerset(s):
  return chain.from_iterable(combinations(s, r) for r in range(len(s)+1))

combos = 0
containers = len(buckets)

for x in powerset(buckets):
  if sum(x) == 150:
    combos += 1
    if len(x) < containers:
      containers = len(x)

print(combos)
print(containers)
