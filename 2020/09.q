//--- Day 9: Encoding Error ---

sw:{neg[x-1]_flip next\[x-1;y]}

i:"J"$read0 `:input/09.txt
v:first { x y+where not raze { y in raze x+/:x }.'(y cut) each sw[y+1;x] }[i;] 127
v
/138879426

c:1 + first where v=s w:first where v in/:s:sums each (til count i)_\:i
sum (min;max)@\:c#(w _ i)
/23761694
