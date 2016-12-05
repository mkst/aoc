import hashlib

password_length = 8

password_part1 = ""
password_part2 = map(lambda x: "", range(0, password_length))

prefix = "ffykfhsq"

complete = False

i = 0

while True:
  m = hashlib.md5(prefix + str(i))
  hd = m.hexdigest()
  if hd.startswith("00000"):
    # part 1
    pos = hd[5]
    password_part1 += pos
    # part 2
    pos = int(pos, 16)
    if (pos < password_length) and password_part2[pos] == "":
      password_part2[pos] = hd[6]
      if not "" in password_part2:
        # we're done
        break
  i +=1

print "Part 1:",password_part1[:password_length]
print "Part 2:","".join(password_part2)
