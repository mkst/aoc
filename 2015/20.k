/ --- Day 20: Infinite Elves and Infinite Houses

d:{[x] ?f,(f:r@&0=(r:1+!_ sqrt x) mod'x) div'x} / distinct factors
f:{[x;y] +/r@&~(x%y)>r:d x}

{[x;y] $[x<+/d y;y;y+1]}[.1*i:`i$*0:"input/20.txt"]/:1
{[x;y;z] $[x<f[z;y];z;z+1]}[i%11;50]/:1
