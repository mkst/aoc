/--- Day 1: No Time for a Taxicab ---

f:{ (("J"$1_y)#enlist(0 1;1 0;0 -1;-1 0)"NESW"?d;d:$["R"=first y;"ESWN";"WNES"]"NESW"?last x) }\["N";]

sum abs last s:sums raze first flip f ", " vs first read0 `:input/01.txt
/181
sum abs s first where 1<sum s~\:/:s
/140
