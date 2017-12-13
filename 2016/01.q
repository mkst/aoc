/--- Day 1: No Time for a Taxicab ---

d:"N" / start facing north
sum abs last s:sums raze {("J"$1_x)#enlist("NESW"!(0 1;1 0;0 -1;-1 0))d::("WNES";"ESWN")["R"=first x]"NESW"?d} each ", " vs first read0 `:input/01.txt
/181
sum abs s first where 1<sum s~\:/:s
/140