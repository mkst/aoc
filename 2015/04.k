/--- Day 4: The Ideal Stocking Stuffer ---

md5:*"../src/aoc.so"2:`md5!1

f:{[x;y;z]
  $[y<256/3#md5 x,$z
    z+1
    z]}[*0:"input/04.txt";]

f[16]/:1
f[0]/:1
