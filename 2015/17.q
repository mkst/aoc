/--- Day 17: No Such Thing as Too Much ---

TARGET:150

buckets:(count[i]#.Q.a)!i:desc "J"$ read0 `:input/17.txt

f:{[current;available;indexes]
  // target reached, return
  if[TARGET=sum buckets indexes;:enlist indexes];
  // filter available
  available:available where buckets[available] <= min buckets[indexes];
  // recurse
  raze .z.s'[c w;available _/:w;indexes,/:available w:where 0<=c:current-/:buckets[available]]
 }

count c:distinct asc each f[TARGET;key buckets;()]
/4372
min count each c
/4
