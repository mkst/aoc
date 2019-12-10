//--- Day 10: Monitoring Station ---

i:read0 `:input/10.txt

ast:raze { y,/:where not "."=x y }[i;] each til count i

f:{
  a:(x except enlist y)-\:y;
  c1:count group (%).'a where ae:all each a<0;
  c2:count group (%).'a where not[ae]&a[;0]<0;
  c3:count group (%).'a where not[ae]&a[;1]<0;
  c4:count group (%).'a where all each a>=0;
  c1+c2+c3+c4
  }

max r:ast f/:ast
/278

l:ast where r=max r
