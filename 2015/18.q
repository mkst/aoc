/ --- Day 18: Like a GIF For Your Yard ---

g:"#"=read0 `:input/18.txt; // build grid

c:t cross t:til count g; // build coordinates

f:{
  s:sum .[x;] each (0  1;1  1;1  0;1 -1;0 -1;-1 -1;-1  0;-1  1)+\:y; / sum of neighbours
  $[.[x;y]; / check state of current light
    s in 2 3;
    s = 3]
  };

sum raze { (2#count x)#f[x;] peach c }/[100;g]
/814

/ set corner lights on
sc:{
  m:-1 + count x;
  x[0;0]:1b;
  x[0;m]:1b;
  x[m;0]:1b;
  x[m;m]:1b;
  x
 }

sum raze { sc (2#count x)#f[x;] peach c }/[100;sc g]
/ 924
