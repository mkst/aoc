/ --- Day 24: It Hangs in the Balance ---

f:{
  // success
  if[x=s:sum y;:enlist y];
  // discover possibilities
  p:z where z <= x - s;
  // optimisation to avoid recalculations
  p:p where all p</:y;
  // recurse
  raze .z.s'[x;y,/:p;z except/:p]
  };

f2:{ f[x;1#y;y except first y] };

r:f2[sum[i]%3;] i:desc "J"$read0 `:input/24.txt;
prd r first iasc prd each r:r where c=min c:count each r
/10439961859

r:f2[sum[i]%4;i];
prd r first iasc prd each r:r where c=min c:count each r
/72050269
