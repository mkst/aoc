//--- Day 10: Monitoring Station ---

i:read0 `:input/10.txt

ast:raze { y,/:where "."<>x }'[i;til count i]

f:{
  ae:all each 0>a:(x except enlist y)-\:y;
  cnt:count fnd a where not[ae]&a[;1]<0;
  cnt+:count fnd a where all each a>=0;
  cnt+:count fnd a where not[ae]&a[;0]<0;
  cnt+:count fnd a where ae;
  cnt
  }

fnd:{group (%).'x}
lzr:{x value first each a!g a:asc key g:fnd x}

g:{
  ae:all each 0>a:(x except enlist y)-\:y;
  q1:lzr a where not[ae]&a[;0]<0;
  q2:lzr a where all each a>=0;
  q3:lzr a where not[ae]&a[;1]<0;
  q4:lzr a where ae;
  y+/:q1,q2,q3,q4
  }

max r:ast f/:ast
/278
sum 100 1*reverse (g[ael iasc sum each abs l-/:ael:ast except enlist l;l:ast r?max r]) 199
/1417
