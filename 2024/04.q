// --- Day 4: Ceres Search ---

i:read0 `:input/04.txt

d:{ .[x;] @'' { ((til count x),'til count x) +\:y }[x;] each (0,/:til count x),1_(til count x),\:0 }

count (raze/) ss[;"XMAS"]@''(i; flip i; reverse each i; reverse each flip i; d i; d reverse i; d reverse each i; d reverse reverse each i)
/ 2575

f:{
    nw:.[x;] each y +/:(-1 -1;0 0; 1  1);
    ne:.[x;] each y +/:(-1  1;0 0; 1 -1);
    :(nw in ("MAS";"SAM")) and ne in ("MAS";"SAM");
 }

sum f[i;] each t cross t:til count i
/ 2041
