// --- Day 21: Chronal Conversion ---

\l 16.q

ipr:"J"$last" "vs first i:read0 `:input/21.txt
inst:{ "SJJJ"$'4#" "vs x} each 1 _ i
r:6#0
ip:0

while[not ip=28;
  r[ipr]:ip;
  { opcodes[x 0] . x[1 2 3] } inst ip;
  ip:r[ipr];
  ip+:1
  ];
r 3
/7967233

r3s:();
r0:r1:r2:r3:r4:r5:0
r1:65536;
r3:10373714;
while[25000>count r3s;
  r5:AND[r1;255];
  r3+:r5;
  r3:AND[r3;16777215];
  r3*:65899;
  r3:AND[r3;16777215];
  $[256>r1;
    [
      r3s,:r3;
      r1:OR[r3;65536];
      r3:10373714
    ];
    [
      r1:r1 div 256
    ]
    ]
  ];

r3s (count distinct r3s) - 1
/16477902
