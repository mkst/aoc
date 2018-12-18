// --- Day 14: Chocolate Charts ---

s:string i:"J"$first read0 `:input/14.txt
r:"37";
f:{ mod[1 + x + a;count r,:string sum a:"J"$string r x] }

f/[{count[r] < 10+i};0 1];
-1@10#i _r;
/ 1191216109

r:"37";n:`long$()
f/[{ss[-7#r;s]~n};0 1];
$[s~-1_-7#r;-7;-6] + count r
/20268576
