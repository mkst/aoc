//--- Day 3: Crossed Wires ---

f:{[w]
 d:first w;
 t:"J"$1_w;
 s:$[d="U";
     (p[0] + 1 + til t),\:p 1;
     d="D";
     (p[0] - 1 + til t),\:p 1;
     d="R";
     p[0],/:(p[1] + 1 + til t);
     p[0],/:(p[1] - 1 + til t)
     ];
  p::last s;
  s
  };

i:","vs'read0 `:input/03.txt

p:0 0
w1:raze f each i 0

p:0 0
w2:raze f each i 1

min sum each abs c:w1 inter w2
/489

2+min raze { sum (where z~/:x;where z~/:y) }[w1;w2;] each c
/93654
