/--- Day 24: It Hangs in the Balance ---

d:{[x;y] x@((),y)_!#x} / drop

f:{[x;y;z] $[x=s:+/y;,y;,/f[x;;]'[y,/z w;d[z]'w:&(z<*|y)&~x<z+s]]}
m:{[x] &/*/'x@&c=&/c:#'x}

m f[3 div +/i;1#i;] 1_i:|^`i$0:"input/24.txt"
m f[4 div +/i;1#i;] 1_i
