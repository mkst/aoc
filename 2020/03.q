//--- Day 3: Toboggan Trajectory ---

f:{ x[y;z mod count x y] };
g:{ "j"$ sum f[x;;]'[z*til count x;y*til count x] };

g[;3;1] t:"#"=read0 `:input/03.txt
/ 162
prd g[t;;].'(1 1;3 1;5 1;7 1;1 2)
/ 3064612320
