/--- Day 15: Science for Hungry People ---

c:{[x;y;z] $[z=#x;,x,y;,/c[;;z]'[x,/t;y-t:!1+y]]} / combo generator

i:{[x] "i"$@[;2 4 6 8 10]@" "\",:"_x}'0:"input/15.txt"
s:{[x;y] (t*500=a 4;t:*/0|4#a:+/x*y)}[i;]'c[!0;100;3]

|/s[;1]
|/s[;0]

\

i:xkey[;`ing]@+`ing`cap`dur`fla`tex`cal!+{[x] "niiiii"$@[;0 2 4 6 8 10]@" "\",:"_x}'0:"input/15.txt"
r:+(*.+(!i))!+c[();100;3]

s:{[x;y] (t*500=a`cal;t:*/0|4#a:+/'+(. x)*y) }[;. i]'r

|/s[;1]
|/s[;0]

\
abs:{[x] x*-1 1@0<x}
xkey:{[x;y] (y#x)!(y_x)}
