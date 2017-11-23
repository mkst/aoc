# --- Day 14: Reindeer Olympics ---

from itertools import permutations

def day_14 (instructions, seconds):

  reindeers = []

  for line in instructions:

    #Rudolph can fly 22 km/s for 8 seconds, but then must rest for 165 seconds.
    reindeer,_,_,speed,_,_,duration,_,_,_,_,_,_,rest,_ = line.replace(".\n", "").split(" ")

    reindeers.append({ "name" : reindeer, "speed": int(speed), "duration" : int(duration), "rest" : int(rest), "distance" : 0, "points" : 0 })

  distance = 0

  for i in range (0,seconds):
    for r in reindeers:
      if i % (r["rest"] + r["duration"]) < r["duration"]:
        r["distance"] += r["speed"]
        if r["distance"] > distance:
          distance = r["distance"]
    # assign points to leader(s)
    for r in reindeers:
      if r["distance"] == distance:
        r["points"] += 1

  points = 0
  for r in reindeers:
    if r["points"] > points:
      points = r["points"]

  return { "max_distance" : max(reindeers)["distance"], "max_points" : points }

with open("input/14.txt") as instructions:
  res = day_14(instructions, 2503)
  print res["max_distance"]
  print res["max_points"]