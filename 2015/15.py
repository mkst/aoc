from itertools import permutations

def day_15(instructions, seconds):

  ingredients = {}

  for line in instructions:

    #Sugar: capacity 3, durability 0, flavor 0, texture -3, calories 2
    ingredient,_,capacity,_,durability,_,flavour,_,texture,_,calories = line.replace(",", "").split(" ")
    ingredients[ingredient] = { "capacity" : int(capacity), "durability" : int(durability), "flavour" : int(flavour), "texture" : int(texture), "calories" : int(calories) }

  print ingredients

  for i in permutations(ingredients):
    print i
