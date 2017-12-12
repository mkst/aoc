/--- Day 9: All in a Single Night ---

/read data
r:flip`f`t`d!("s s i";" ")0:`:input/09.txt;
/combinations
c:{raze y,/:'x except/:y}[ix;]/[count[ix]-1;] ix:distinct (raze/)exec (f;t) from r;
/calculate all routes
min routes:{ sum {[x;y] first exec d from r where f in (x;y), t in (x;y) }.'-2#'prev\[count[x]-2;x] } each c
/251
max routes
/898