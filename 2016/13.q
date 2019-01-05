/--- Day 13: A Maze of Twisty Little Cubicles ---

f:{[x;y;z] z+(x*x)+(3*x)+(2*x*y)+y+y*y }[;;"J"$first read0 `:input/13.txt]

G:flip (2#g)#"#."0=mod[;2]sum each 2 vs'f .' til[g] cross til g:50

target:39 31

go:{[start]

  queue:enlist (start;0);
  visited:();

  while[count queue;
    / pop first item from queue
    current:first queue;
    queue:1 _ queue;
    / break apart current item
    pos:first current;
    steps:last current;
    / nesw options
    o:pos+/:(-1 0;0 1;1 0;0 -1);
    / possibilities
    p:o where "."=.[G;] each o;
    / except done
    p:p where not p in queue[;0],visited[;0];
    / add to queue
    queue,:(;steps + 1) each p;
    / add current to visited
    visited,:enlist current
    ];
  :visited
 }

res:go[1 1]
first res[;1]where target~/:res[;0]
/96
sum res[;1]<51
/141
