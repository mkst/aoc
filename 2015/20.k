/ --- Day 20: Infinite Elves and Infinite Houses

d:{[x] ?`i f,x%(f:r@&d=_d:x%r:1+!_sqrt x)} / distinct factors
f:{[x;y] +/r@&~(x%y)>r:d x}

({[x;y] x>+/d y}[.1*i:`i$*0:"input/20.txt"];1+)/:0
({[x;y;z] x>f[z;y]}[i%11;50];1+)/:0
