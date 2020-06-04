/--- Day 17: No Such Thing as Too Much ---

B:(count[i]#.Q.a)!i:desc "J"$ read0 `:input/17.txt

f:{
  // success
  if[x=s:sum B y;:enlist y];
  // discover possibilities
  w:where (z > last y) and x >= B[z] + s;
  // recurse
  raze .z.s'[x;y,/:z w;z _/:w]
 }

count r:f[150;"";key B]
/4372
min count each r
/4
