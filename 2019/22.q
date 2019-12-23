//--- Day 22: Slam Shuffle ---

c:{ $[y>0;(y _ x),y#x;(y # x),y _ x] }
d:{ x iasc mod[;count x] y * til count x }

f:{
  $[y like "*stack*";
    reverse;
    y like "*cut*";
    c[;"J"$ last " " vs y];
    d[;"J"$ last " " vs y]
    ] x
  };

r:f/[til 10007;i:read0 `:input/22.txt]

r?2019
/2939
