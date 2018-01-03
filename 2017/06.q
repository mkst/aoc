/--- Day 6: Memory Reallocation ---

/ redistribution function
f:{[x]
  w:first where x=m:max x;
  x[w]:0;
  c:count each group mod[;count x] w + 1 + til m;
  @[x;key c;+;value c]
  }

s:enlist r:"J"$ "\t" vs first read0 `:input/06.txt

while[not (r:f r) in s;s,:r]
count s
/6681

(count s) - first where r~/:s
/2392
