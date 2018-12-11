// --- Day 11: Chronal Charge ---

p:{
  /Find the fuel cell's rack ID, which is its X coordinate plus 10.
  rid:x + 11;
  /Begin with a power level of the rack ID times the Y coordinate.
  rid*:1+y;
  /Increase the power level by the value of the grid serial number (your puzzle input).
  rid+:sn;
  /Set the power level to itself multiplied by the rack ID.
  rid*:x + 11;
  /Keep only the hundreds digit of the power level (so 12345 becomes 3; numbers with no hundreds digit become 0).
  rid:{ mod[;10] x div 100 } rid;
  /Subtract 5 from the power level.
  rid-:5;
  / Update grid
  .[`grid;(x;y);:;rid]
  };

s:{
  sum .[grid;] each x+/:(0 0;1 0;1 1;0 1;-1 1;-1 0;-1 -1;0 -1;1 -1)
  };

sn:"J"$first read0 `:input/11.txt

grid:300 300#0

coords:raze til[300],\:/:til 300

p .'coords;
g2:s each coords
m:first where g2=max g2

","sv string (m mod 300;m div 300)
/ 7139

\

sw:{[x;y] y#'next\[(count x)-y;x] }
