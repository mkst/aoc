/--- Day 5: Doesn't He Have Intern-Elves For This? ---

sw:{neg[x-1]_flip next\[x-1;y]} / sliding window

sum { (0 in deltas "j"$x)&(0N~first raze x ss/:("ab";"cd";"pq";"xy")) & 2<sum x in "aeiou" } each w:read0 `:input/05.txt
/238
sum{(0<sum("..",x)=x,"__")&1<last[w]-first w:where 1<sum {x~/:\:x}sw[2;x]} each w
/69