/--- Day 19: A Series of Tubes ---

g:read0 `:input/19.txt

udlr:(-1 0;1 0;0 -1;0 1)
move:{
  d:x 0;                / direction
  yx:x 1;               / yx coord
  v:x 2;                / visited
  if[null n:g . yx;:x]; / complete
  if["+"=n;             / crossroads
    d:"UDLR" first where (not d="DURL") and not null .[g;] each yx+/:udlr
    ];
  (d;yx+:udlr"UDLR"?d;v,$[n in .Q.A;n;()])
  };

r:move\[("D";0,first where "|"=g 0;"")]

-1 last last r;
/NDWHOYRUEA
-1+count r
/17540
