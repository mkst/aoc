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

g:0b / garbage?
d:1  / depth
gc:0 / garbage count

sum cg each raze rg each ssr[;"!?";""] first read0 `:input/09.txt
/12505
gc
/6671
