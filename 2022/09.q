// --- Day 9: Rope Bridge ---

lut:"UDLR"!(1 0;-1 0;0 -1;0 1)

i:raze { y#enlist lut x }.' flip ("CJ";" ")0: `:input/09.txt

f:{[x;y]
  h:x 0;
  t:x 1;

  h+:y; // move head in direction

  xd:h[1] - t[1];
  yd:h[0] - t[0];
  d: sum abs xd,yd;

  if[(d<2) or (1 1~abs xd,yd);
    :(h;t);
  ];

  $[yd=0;
    t+:(0;1*signum xd); // move in x axis
    xd=0;
    t+:(1*signum yd;0); // move in y axis
    t+:(1*signum yd;1*signum xd) // move in diagonal
    ];
  :(h;t);
 }

r:f\[(0 0;0 0);i]
count distinct last flip r
/ 6269

r2:{ f\[(0 0;0 0);deltas last flip x] }/[8;r]
count distinct last flip r2
/ 2557
