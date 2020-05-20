"""--- Day 5: How About a Nice Game of Chess? ---"""

import hashlib

password_length = 8

password_part1 = []
password_part2 = ["" for x in range(password_length)]

prefix = "ffykfhsq"

i = 0
while True:
  plaintext = prefix + str(i)
  m = hashlib.md5(plaintext.encode("utf-8"))
  hd = m.hexdigest()
  if hd.startswith("00000"):
    # part 1
    pos = hd[5]
    password_part1.append(pos)
    # part 2
    pos = int(pos, 16)
    if (pos < password_length) and password_part2[pos] == "":
      password_part2[pos] = hd[6]
      if "" not in password_part2:
        # we're done
        break
  i += 1

print("".join(password_part1[:password_length]))
print("".join(password_part2))
