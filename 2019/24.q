//--- Day 24: Planet of Discord ---

g:@[(raze til[5],\:/:til 5)!25#0b;raze (where each i="#"),\:'til count i:read0 `:input/24.txt;:;1b]

f:{ key[x]!{ $[x;y=1;y in 1 2] }'[value x;sum each x (0 1;1 0;0 -1;-1 0)+\:/:key x] }

k:enlist value g;

while[not value[g:f g] in k;k,:value g];

sum g*prds 1,24#2
/18400817
