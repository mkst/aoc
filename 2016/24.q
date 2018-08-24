/ --- Day 24: Air Duct Spelunking ---

g:read0 `:input/24.txt;

bfs:{[S]
  // initialise queue as starting node
  Q::enlist S;
  // initialise visited dictionary
  V::(`u#enlist S)!enlist 0;
  // iterate until queue is empty
  {
    // remove first item from queue
    v:{ q:first Q;Q::1_Q;q }[];
    // pick out valid neighours
    n:enlist each n where {not x in key V} each n:n where not "#"=.[g;] each n:v+/:(-1 0;1 0;0 -1;0 1);
    // add neighbours to Q and Visited
    { Q,:x; V[x]:y }[;1+V v] each n;
  }/[{count Q};(::)]
  };

route:{ exec sum d from r -2#'prev\[count[x]-2;x] };

find:{ (first where any flip w;first where any w:x=y) };

res:raze {
  // perform bfs starting at x
  bfs find[g;] x;
  // return levels (ie distance to each point)
  V find[g;] each p
  } each p:asc (distinct raze g) except "#.";

// code stolen from 2015.09
r:2!delete from (flip `f`t`d!(`$string raze count[p]#enlist til count p;`$string raze count[p]#'p;res)) where d=0;
// generate all route combinations that begin with 0
c:`0,/:{raze y,/:'x except/:y}[ix;]/[count[ix]-1;] ix:exec distinct f from r where not f=`0;

min route each c
/448
min route each c,\:`0
/672
