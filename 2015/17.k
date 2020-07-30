/--- Day 17: No Such Thing as Too Much ---

a:"abcdefghijklmnopqrstuvwxyz"

d:{[x;y] x y_#x} / drop

b:{[x] (`$'a@!#x)!x}@|^`i$0:"input/17.txt"
f:{[x;y;z] $[x=s:+/b@y;,y;,/f[x;;]'[y,/z w;z d/w:&(z>last y)&~x<b[z]+s]]}

#r:f[150;`;!b]
-1+&/#'r
