// --- Day 19: Go With The Flow ---

AND:{ 0b sv (&). 0b vs'x,y }
OR:{ 0b sv (|). 0b vs'x,y }

opcodes:(!). flip (
  (`addr;{[a;b;c] r[c]:r[a]+r[b] });
  (`addi;{[a;b;c] r[c]:r[a]+b });
  (`mulr;{[a;b;c] r[c]:r[a]*r[b] });
  (`muli;{[a;b;c] r[c]:r[a]*b });
  (`banr;{[a;b;c] r[c]:AND . r[a,b] });
  (`bani;{[a;b;c] r[c]:AND . r[a],b });
  (`borr;{[a;b;c] r[c]:OR . r[a,b] });
  (`bori;{[a;b;c] r[c]:OR . r[a],b });
  (`setr;{[a;b;c] r[c]:r[a] });
  (`seti;{[a;b;c] r[c]:a });
  (`gtir;{[a;b;c] r[c]:0 1 a>r[b] });
  (`gtri;{[a;b;c] r[c]:0 1 r[a]>b });
  (`gtrr;{[a;b;c] r[c]:0 1 r[a]>r[b] });
  (`eqir;{[a;b;c] r[c]:0 1 a=r[b] });
  (`eqri;{[a;b;c] r[c]:0 1 r[a]=b });
  (`eqrr;{[a;b;c] r[c]:0 1 r[a]=r[b] })
  );

ipr:"J"$last" "vs first i:read0 `:input/19.txt
inst:{ "SJJJ"$'4#" "vs x} each 1 _ i
r:6#0
ip:0

step:0
/r[0]:1

while[ip<count inst;
  r[ipr]:ip;
  { opcodes[x 0] . x[1 2 3] } inst ip;
  ip:r[ipr];
  ip+:1;
  step+:1
 ];

r 0
/1482

\

1017 + 465?
1017
113 9 are factors
465

10551417 + ???
note: 10551882 is too low
