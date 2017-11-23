# --- Day 9: All in a Single Night ---

def recurse(current, routes, travelled, distance):
  if len(routes) > 1:
    for route in routes:
      # python lists are a bastard
      r = list(routes)
      t = list(travelled)
      # been there, done that
      r.remove(route)
      t.append(route + " -> ")
      # next stop ...
      recurse(route, r, t, distance + destinations[current][route])
  else:
    # final destination
    travelled.append(routes[0])
    travelled_string = ""
    for t in travelled:
      travelled_string += t
    final_destinations.append({"route" : travelled_string, "distance": distance + destinations[current][routes[0]] })

def day_9(instructions):
  # build destinations
  for line in instructions:
    location,_,destination,_,distance = line.split(" ")

    if location not in destinations:
      destinations[location] = {}
    if destination not in destinations:
      destinations[destination] = {}

    # double-pack
    destinations[location][destination] = destinations[destination][location] = int(distance)

  # bootstrap
  for route in destinations.keys():
    r = list(destinations.keys())
    r.remove(route)
    recurse(route, r, [route + " -> "], 0)
  return { "shortest_route" : min(final_destinations) , "longest_route" : max(final_destinations)}

with open("input/09.txt") as instructions:
  final_destinations = []
  destinations = {}
  res = day_9(instructions)
  print res["shortest_route"]["distance"]
  print res["longest_route"]["distance"]
