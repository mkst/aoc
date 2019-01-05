/--- Day 14: One-Time Pad ---

salt:first read0 `:input/14.txt

f:{[func]
  ix:0;
  salts:();
  s:();

  while[64>count s;
    if[count[salts]<=ix+1000;
      salts,:func each salt,/:string count[salts] + til 1000
      ];
    if[count raze m:ss[salts ix;] each 3#'distinct salts ix;
      if[any { any x ss y }[;5#salts[ix] min raze m] each salts ix + 1 + til 1000;
        s,:ix
        ]
      ];
    ix+:1
    ];
  last s
  }

f[{raze string md5 x}]
/16106
f[{raze string md5 x}/[2017;]]
/22423
