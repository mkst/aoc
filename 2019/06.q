//--- Day 6: Universal Orbit Map ---

t:flip`obj`orb!flip`$")"vs'read0 `:input/06.txt
f:{exec orb from t where obj = x}
g:{exec obj from t where orb = x}

o:0

{ r:f first p:first x;
  o+:d:last p;
  1_x,r,\:d+1
  }/[count;(f `COM),\:1];

o
/245089
-2+first sum where each i=first(inter/)i:{first g x}\'[`YOU`SAN]
/511
