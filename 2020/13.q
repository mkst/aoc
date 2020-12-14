//--- Day 13: Shuttle Search ---

i:read0 `:input/13.txt
t:"J"$first i
r:"J"$"," vs last i

(o w)*r w:first where o=m:min o:r-t mod r
/ 2382

/ convert negative modulos to positive
a:neg[(til count r) w] mod r w:where not null r
/ calculate modulo for each
b:{ prd each x except/:x } r w
/ iterate until each matches the original modulo
s:sum b*{ (1+)/[{[x;y;z;m] not z=mod[m*x;y]}[x;y;z];1] }'[b;r w;a]
/ modulo with lcm
s mod prd r w
/906332393333683


/bruteforce
/{ {y + first x}[first x;]/[{sum 0^(y + til count x) mod x}[x;];0] } r
