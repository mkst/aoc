/--- Day 9: Stream Processing ---

rg:{
  if[g;
    $[x=">";
      g::0b; / no longer garbage
      gc+:1  / else increment garbage count
      ];
    :""
    ];
  if[x="<";
    g::1b;   / garbage section
    :""
    ];
  x
  };

cg:{
  if["{"=x;
    d+:1
    ];
  if["}"=x;
    :d-:1
    ];
  :0;
  };

solve:{
  g::0b;            / reset garbage flag
  d::1;             / reset depth
  gc::0;            / reset garbage count
  x:ssr[x;"!?";""]; / remove escaped characters
  x:raze rg each x; / remove garbage
  sum cg each x     / count groups
  };

solve first read0 `:input/09.txt
/12505
gc
/6671