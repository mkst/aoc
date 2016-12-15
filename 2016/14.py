import hashlib

def generate_hashes(count, hash_count, salt, key):
  h = []
  for i in range(key, key + count):
    m = salt + str(i)
    for j in range(0, hash_count):
      m = hashlib.md5(m).hexdigest()
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
  return key

with open("input/14.txt") as input:

  #salt = "abc"
  salt = input.read()[:-1] # drop trailing "\n"

  key_length = 64

  print "Part 1:",solve(salt, key_length, 1)[-1]
  print "Part 2:",solve(salt, key_length, 1+2016)[-1]
