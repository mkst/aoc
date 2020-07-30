/--- Day 11: Corporate Policy ---

a:"abcdefghijklmnopqrstuvwxyz"

n:{[x]                              / generate next pass
  $[0=#x
      "a"
    "z">last x
      (-1_ x),a@1+a?last x
      (n@-1_x),"a"]}

s:{[x] (1_-':&1=-':a?x)'1}          / straight
b:{[x] ~|/"iol"'x}                  / no bad chars
p:{[x] 1<+/{[x] (1_-':&x)'1}'a=\x}  / pairs

c:{[x]
  $[~s x                            / no straight
      n x
    ~b x                            / bad chars
      n x
    ~p x                            / no pairs
      n x
    x]}

r:c/:*0:"input/11.txt";r
c/:n r
