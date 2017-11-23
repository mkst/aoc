# --- Day 12: JSAbacusFramework.io ---

import re
import json

def get_value_of_string(string):
  total = 0

  l = re.sub("[^0-9\-]", " ", string)
  split = l.split(" ")

  for s in split:
    if s != "":
      total+= int(s)

  return total

def day_12 (instructions):

  red = 0
  no_red = 0

  for block in instructions:
    line = block.split("]]")

    for l in line:

      # strip out all the redness
      l_ = re.sub("{.*:\"red\".*}", "",l)

      #if l.find(":\"red\"") > 0:
      #  print "before",l,"\nafter",l_

      red += get_value_of_string(l)
      no_red += get_value_of_string(l_)

  return { "red" : red, "no_red" : no_red }

with open("input/12.txt") as instructions:
  res = day_12(instructions)
  print res["red"]
