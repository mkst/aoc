// --- Day 14: Chocolate Charts ---

maxsteps:"J"$first read0 `:input/14.txt

r:3 7
e:0 1

while[count[r] < 10+maxsteps;
  e:mod[1 + e + r e;count r,:$[null first t:10 vs sum r e;0;t]]
 ];

10 sv 10#maxsteps _ r
/ 1191216109

r:3 7
e:0 1
lastrecipe:()

while[not maxsteps in lastrecipe;
  e:mod[e + 1 + r e;count r,:$[null first t:10 vs sum r e;0;t]];
  lastrecipe:(10 sv 1_l;10 sv -1_l:-7#r)
 ];

$[maxsteps~10 sv -1_-7#r;-7;-6] + count r
/20268576
