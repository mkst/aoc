/--- Day 24: It Hangs in the Balance ---

f:{
  // success
  if[x=s:sum y;:enlist y];
  // discover possibilities
  w:where (z<last y) and x >= z + s;
  // recurse
  raze .z.s'[x;y,/:z w;z _/:w]
  };

f2:{ f[x;1#y;1_ y] };

r:f2[sum[i] div 3;] i:desc "J"$read0 `:input/24.txt;
min prd each r:r where c=min c:count each r
/10439961859

r:f2[sum[i] div 4;i];
min prd each r:r where c=min c:count each r
/72050269
