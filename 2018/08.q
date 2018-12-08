/ --- Day 8: Memory Maneuver ---

e:"J"$" "vs first read0 `:input/08.txt

md:();

r:{[level;children;metadata;x]
  d:0;
  if[children;
    i:0;
    while[i < children;
      c:x d + 0;
      m:x d + 1;
      d+:.z.s[level+1;c;m;(d + 2) _ x];
      i+:1
      ];
    ];
  / add metadata
  md,:enlist metadata#d _ x;
  / return length to drop
  d+2+metadata
  };

r[0;1;0;e];
sum raze md
/42798
