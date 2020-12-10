//--- Day 9: Encoding Error ---

sw:{neg[x-1]_flip next\[x-1;y]}

i:"J"$read0 `:input/09.txt
show v:first { x y+where 0={ count a inter last[y]-a:x#y }[y;] each sw[y+1;x] }[i;] 127
/138879426

sum (min;max)@\:i w + til 1 + first where v=s w:first where v in/:s:sums each (til count j)_\:j:(where v=i)#i
/23761694
