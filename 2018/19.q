// --- Day 19: Go With The Flow ---

\l 16.q

ipr:"J"$last" "vs first i:read0 `:input/19.txt
inst:{ "SJJJ"$'4#" "vs x} each 1 _ i


df:{asc distinct div[x;b],b:a where 0=mod[x;a:1+til floor sqrt x]};

go:{[]
  ip:0;
  while[not ip=2;
    / store ip
    r[ipr]:ip;
    / execute op
    { opcodes[x 0] . x[1 2 3] } inst ip;
    / restore ip
    ip:r[ipr];
    / increment ip
    ip+:1
    ];
  / sum distinct factors of register 5
  sum df r 5
  }

r:6#0
go[]
/1482

r:1,5#0
go[]
/14068560
