// --- Day 9: Rope Bridge ---

lut:"UDLR"!(1 0;-1 0;0 -1;0 1)

i:raze { y#enlist lut x }.' flip ("CJ";" ")0: `:input/09.txt

f:{[x;y]
  h:x 0;
  t:x 1;
  // move head in direction
  h+:y;
  // determine whether to move tail
  :$[(2 > sum d) or 1 1~d:abs h - t;
    (h;t);
    (h;t+1&-1|h - t)
    ];
 }

r:f\[(0 0;0 0);i]
count distinct last flip r
/ 6269

r2:{ f\[(0 0;0 0);deltas {x where differ x} last flip x] }/[8;r]
count distinct last flip r2
/ 2557
