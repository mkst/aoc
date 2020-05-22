"""--- Day 9: All in a Single Night ---"""

def recurse(current, routes, distance):
  if len(routes) > 1:
    for route in routes:
      # python lists are a bastard
      r = list(routes)
      # been there, done that
      r.remove(route)
      # next stop ...
      recurse(route, r, distance + destinations[current][route])
  else:
    # final destination
    final_destinations.append(distance + destinations[current][routes[0]])

def day_9(instructions):
  # build destinations
  for line in instructions:
    location, _, destination, _, distance = line.split(" ")
    if location not in destinations:
      destinations[location] = {}
    if destination not in destinations:
      destinations[destination] = {}
    # double-pack
    destinations[location][destination] = destinations[destination][location] = int(distance)

  # bootstrap
  for route, _ in destinations.items():
    r = list(destinations.keys())
    r.remove(route)
    recurse(route, r, 0)
  return final_destinations

with open("input/09.txt") as f:
  final_destinations = []
  destinations = {}
  res = day_9(f)
  print(min(res))
  print(max(res))
