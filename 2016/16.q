/--- Day 16: Dragon Checksum ---

l:272
l2:35651584

c:{ $[mod[count x;2];x;(=/)flip 2 cut x] }
f:{ c/[y#{ x,0b,reverse not x }/[{y>count x}[;y];x]] }

-1"01"f[;l] i:"1"=first read0 `:input/16.txt;
/11111000111110000
-1"01"f[i;l2];
/10111100110110100
