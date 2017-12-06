/--- Day 6: Memory Reallocation ---

/ redistribution function
f:{[x]
  w:first where x=max x;
  d:x w;
  x[w]:0;
  c:count each group mod[;count x] w + 1 + til d;
  @[x;key c;+;value c]
  }

R:enlist r:"J"$ "\t" vs first read0 `:input/06.txt

while[not (r:f r) in R;R,:r]
count R
/6681

count[R] - first where r~/:R
/2392