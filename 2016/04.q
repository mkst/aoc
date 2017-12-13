/--- Day 4: Security Through Obscurity ---

res:{(r;$[(-1_-6#x)~5#.Q.a idesc sum .Q.a=/:r:except[;"-"](first where x in .Q.n)#x;"J"$x inter .Q.n;0])} each read0 `:input/04.txt
sum res[;1]
/245102
last res where ({ "c"$97+mod[y+-97+"j"$x;26] }.' res) like "*pole*"
/324