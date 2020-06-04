/--- Day 5: Doesn't He Have Intern-Elves For This? ---

sw:{neg[x-1]_flip next\[x-1;y]} / sliding window

sum {(any x=prev x) and (0=count raze x ss/:("ab";"cd";"pq";"xy")) and 2<sum x in "aeiou"} each w:read0 `:input/05.txt
/238
sum {(any x=2 xprev x) and 1<sum 1_deltas where 1<sum {x~\:/:x}sw[2;x]} each w
/69
