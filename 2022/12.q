// --- Day 12: Hill Climbing Algorithm ---

i:read0 `:input/12.txt

coords:{raze (til count x),/:'where each x=y}

start:first coords[i;"S"]
end:first coords[i;"E"]

i:.[i;start;:;"a"]
i:.[i;end;:;"z"]

m:.Q.a?i

f:{[best;pos]
  queue:enlist (pos;0);
  visited:`u#enlist pos; // 'global' visited

  while[count queue;
    pop:first queue;
    current:first pop;
    steps:last pop;
    queue:1 _ queue;

    if[steps>=best;:best]; // fast fail

    if[current~end;:min steps,best]; // success

    move:(1 0;-1 0;0 -1;0 1)+\:current;
    move:move where not move in\:visited;
    move:move where 2 > ((0W^.[m;] each move) - .[m;current]);

    visited,:move; // dont revisit (new) locations
    queue,:(;steps+1) each move;
    ];
  :best; // slow fail
  }

r:f[0W;start];r
/ 456
f/[r;] coords[i;"a"]
/ 454
