import re

with open("input/04.txt") as rooms:

  sectors = northpole_objects = 0

  alphabet = "abcdefghijklmnopqrstuvwxyz"

  for room in rooms:

    regex = re.search("([a-z\-]*)-([0-9]+)\[([a-z]*)\]", room)

    roomname = regex.group(1)
    sector   = int(regex.group(2))
    checksum = regex.group(3)

    letters = "".join(roomname.split("-"))

    uniq = {}

    # calculated checksum
    cs = ""

    for l in letters:
      if not l in uniq.keys():
        uniq[l] = letters.count(l)

    i = max(uniq.values()) # work backwards down to 1

    while i > 0:
      chars = [ k for k, v in uniq.items() if v == i ]
      chars.sort()
      cs += "".join(chars)
      i -= 1

    if(cs[:5] == checksum):
      sectors += sector

    decrypted = ""

    for r in roomname:
      if r == "-":
        decrypted += " "
      else:
        loc = alphabet.find(r)
        decrypted += alphabet[(loc + sector) % len(alphabet)]

    if decrypted == "northpole object storage":
      northpole_objects = sector

  print "Part 1:",sectors
  print "Part 2:",northpole_objects
