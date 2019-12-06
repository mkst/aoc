//--- Day 6: Universal Orbit Map ---

t:flip`obj`orb!flip`$")"vs'read0 `:input/06.txt

f:{exec orb from t where obj = x}
g:{exec obj from t where orb = x}

q: (f `COM),\:0
io:0

while[count q;
  p:first q;
  q:1_q;
  r: f first p;
  io+:d:last p;
  q,:r,\:d+1
  ];

io+count t
/245089
-2+first sum where each i=first(inter/)i:{ first g x }\'[`YOU`SAN]
/511
