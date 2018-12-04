// --- Day 4: Repose Record ---

/ read input
r:{ (where like[;"*Guard*"] each x) cut x} asc read0 `:input/04.txt
/ build table from input
t:{ `g`m`s!(enlist"J"$1_@[;3]" "vs x 0),$[1=count x;(0;0);(::;sum)@'raze each flip { (x+til y-x;y-x) }.'2 cut "J"$.[;(::;1;3 4)]" "vs'1_x] } each r
/ group by guard
t:exec { `mx`m`s!(max[c];first where c=max c:count each group raze x;sum y) }[m;s] by g:g from t

first exec g*m from t where s=exec max s from t
/ 21083
first exec g*m from t where mx=exec max mx from t
/ 53024
