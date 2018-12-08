/ --- Day 8: Memory Maneuver ---

e:"J"$" "vs first read0 `:input/08.txt

md:();

r:{[children;metadata;x]
  i:d:0;
  while[i < children;
    c:x d + 0;
    m:x d + 1;
    d+:.z.s[c;m;(d + 2) _ x];
    i+:1
    ];
  if[0=children;
    md,:enlist metadata#x;
    d:2+metadata
    ];
  if[children;
    md,:enlist metadata#d _ x;
    d+:2+metadata
    ];
  d
  };

r[1;0;e];
sum raze md
/42798
