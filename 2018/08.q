/ --- Day 8: Memory Maneuver ---

e:"J"$" "vs first read0 `:input/08.txt

md:()
nodes:()!()

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
  md,:enlist M:metadata#d _ x;
  if[level;
    / add node value to nodes
    nodes[level],:sum $[children;
                        nodes[level+1] M-1;
                        M];
    / clean up level
    nodes[level+1]:()
    ];
  / return length to drop
  d+2+metadata
  };

r[0;1;0;e];

sum raze md
/42798
sum nodes 1
/ 23798
