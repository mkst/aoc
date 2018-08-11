/ --- Day 18: Like a GIF For Your Yard ---

o:g:"#"=read0 `:input/18.txt; // build grid

c:t cross t:til count g; // build coordinates

i:{
  s:sum .[g;] each (0  1;1  1;1  0;1 -1;0 -1;-1 -1;-1  0;-1  1)+\:x; / sum of neighbours
  $[.[g;x]; / check state of current light
    s in 2 3;
    s = 3]
  };

do[100;g:(2#count g)#i each c];

sum raze g
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

/ reset grid and set corners on
g:sc o;

do[100;g:sc (2#count g)#i each c];

sum raze g
/ 924
