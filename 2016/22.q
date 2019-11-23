/--- Day 22: Grid Computing ---

/ clean input
df:{4#x where not not count each x:" "vs x} each 2_df:read0 `:input/22.txt

/ drop "/dev/grid/node-""
df[;0]:15_'df[;0]
/ split on xM-yN into M N
df[;0]:"J"$1_''"-"vs/:df[;0]
/ drop railing Ts
df[;1]:"J"$-1_'df[;1]
df[;2]:"J"$-1_'df[;2]
df[;3]:"J"$-1_'df[;3]

/ construct table
df:flip `x`y`size`used`avail!flip raze each df

sum {[T;N] count select from T where not (x=N`x) and y=N`y, avail >= N`used }[df;] each select from df where used > 0
/ 952

/ key on x/y
df:2!df

moves:{[TABLE;IDX]
  / neighbours
  n:IDX+/:(-1 0;1 0;0 -1;0 1);
  / possibilities
  p:n where (0W^TABLE[n;`used])<=TABLE[IDX;`avail];
  p
  };

move:{[TABLE;SRC;TARGET]
  TABLE:.[TABLE;(TARGET;`used);+;TABLE[SRC;`used]];
  TABLE:.[TABLE;(TARGET;`avail);-;TABLE[SRC;`used]];
  TABLE:.[TABLE;(SRC;`avail);:;TABLE[SRC;`size]];
  TABLE:.[TABLE;(SRC;`used);:;0];
  (TABLE;SRC)
  };

f:{[TABLE;START;TARGET;SORT]

  visited:enlist (START);
  queue:enlist (TABLE;START;());

  while[count queue;

    / sort by y descending
    queue:{ x iasc x[;1;1] } queue;

    item:first queue;
    queue::1_queue;

    tab:item 0;
    idx:item 1;
    stp:item 2;

    // potential next steps
    p:moves[tab;idx];

    $[TARGET in p;
      [
        :stp,enlist idx
      ];
      [
        / update table for each possible move
        o:move[tab;;idx] each p;
        / remove visited from options;
        o:o where not o[;1]in\:visited;
        / add to queue
        queue,:o,\:enlist stp,enlist idx;
        / add to visited
        visited,:idx;
      ]
      ];
    ];
  };

/ shortest path to top right
start:value first where df[;`used]=0
target:raze value exec x,y from df where x=max x, y=min y
res:f[df;start;target]

/ return journey takes 5 steps for each node
count[res] + 5*(max[target]-1)
/181
