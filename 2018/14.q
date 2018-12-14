// --- Day 14: Chocolate Charts ---

i:"J"$first read0 `:input/14.txt
r:3 7;e:0 1

while[count[r] < 10+i;
  e:mod[1 + e + r e;count r,:"J"$string string sum r e]
  ];
10 sv 10#i _ r
/ 1191216109

r:3 7;e:0 1

while[not i in "J"$raze each string -1 1_\:-7#r;
  e:mod[1 + e + r e;count r,:"J"$string string sum r e];
 ];
$[i~10 sv -1_-7#r;-7;-6] + count r
/20268576
