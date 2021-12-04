// --- Day 4: Giant Squid ---

b:"J"$"," vs first i:read0 `:input/04.txt
p:"J"$(3 cut)@''1_'6 cut 1 _ i

f:{
  { $[1=count x;
      x;
      (any all flip c) or any all c:last[x]|y=g:first x;
      y*sum raze g*not c;
      (g;c)
      ]
  }\[(x;5 5#0b);y] }

last last r m?min m:sum each 0=type@''r:f[;b] each p
/29440

last last r m?max m
/13884
