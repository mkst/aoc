// --- Day 3: Binary Diagnostic ---

prd 2 sv'(not;::)@\:"j"$avg i:-48+"j"$read0 `:input/03.txt
/2250414

f:{first {$[1=count x;x;x where x[;y] = z "j"$avg x[;y]]}[;;y]/[x;til count flip x]}
prd 2 sv'f[i;] each (not;::)
/6085575
