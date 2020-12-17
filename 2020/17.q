//--- Day 17: Conway Cubes ---

k:{ x,\:0 } (til count first i) cross til count i:"#"=read0 `:input/17.txt

n:0 1 -1 cross (0 0;0 1;0 -1;1 0;-1 0;1 1;-1 -1;-1 1;1 -1)

f:{ d!{ $[y z;in[;2 3];3=] sum y z+/:x }[x;y;] each d:`u#distinct raze key[y]+\:/:x }

sum f[1 _ n]/[6;k!raze i]
/348
sum f[1 _ 0 1 -1 cross n]/[6;(k,\:0)!raze i]
/2236
