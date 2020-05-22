"""--- Day 14: One-Time Pad ---"""

import hashlib

def generate_hashes(count, hash_count, salt, key):
  h = []
  for i in range(key, key + count):
    m = salt + str(i)
    for _ in range(hash_count):
      m = hashlib.md5(m.encode('utf-8')).hexdigest()
    h.append(m)
  return h

def check_batch(batch, char, count):
  for b in batch:
    if b.find(count*char) > -1:
      return True
  return False

def solve(salt, key_length, hash_count):

  key = []
  hashes = generate_hashes(1000, hash_count, salt, 0)
  i = 0

  while len(key) < key_length:
    h = hashes[i]
    j = 0
    while j < len(h) - 2:
      if h[j] == h[j+1] and h[j] == h[j+2]:
        if i+1001 > len(hashes):
          hashes += generate_hashes(1000, hash_count, salt, len(hashes))
        if check_batch(hashes[i+1:i+1001], h[j], 5):
          key.append(i)
        break # only use first instance
      j += 1
    i += 1
  return key[-1]

with open("input/14.txt", "r") as f:

  salt = f.read()[:-1] # drop trailing "\n"

  print(solve(salt, 64, 1))
  print(solve(salt, 64, 1+2016))
