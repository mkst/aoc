/--- Day 13: Packet Scanners ---

i:"J"$": "vs/:read0 `:input/13.txt
l:i[;0]                  / locations
d:i[;1]                  / depths
f:@[(1+max l)#0N;l;:;d]; / firewall with raw depths

sum f[w]*w:where 0=til[count g] mod g:@[f;l;{2*x-1}]
/1476
{x+1}/[{any 0=(x+til[count g]) mod g};0] / slow
/3937334