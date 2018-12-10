/ --- Day 9: Marble Mania ---

r:"J"$@[;0 6]" "vs first read0 `:input/09.txt

prv:{ nodes[x;0] };
nxt:{ nodes[x;2] };

add:{[active;marble]
  n1idx:nxt active;
  n2idx:nxt n1idx;
  / update next and next-next nodes
  nodes[n1idx]:nodes[n1idx;0 1],c:count nodes;
  nodes[n2idx]:c,nodes[n2idx;1 2];
  / append new node
  nodes,:(n1idx;marble;n2idx);
  / active is the new one
  c
 };

rem:{[active]
  n2idx:prv prv prv prv prv prv active; / 6 before active
  n1idx:prv n2idx;                      / 7 before active
  n0idx:prv n1idx;                      / 8 before active

  nodes[n2idx]:nodes[n1idx;0],nodes[n2idx;1 2];
  nodes[n0idx]:nodes[n0idx;0 1],nodex[n1idx;2];
  / return (current value;new active)
  (nodes[n1idx;1];n2idx)
  };

f:{[marble;lastmarble]
  nodes::enlist (0;0;0); / (previous;current;next)
  active:0;
  scores:players#0;
  while[marble < lastmarble;
    active:$[marble mod 23;
      add[active;marble];
      [
        res:rem active;
        scores[marble mod players]+:marble+res 0;
        res 1
      ]
     ];
    marble+:1
   ];
  max scores
  };

players:r 0

f[1;r 1]
/ 386018
f[1;100*r 1]
/ 3085518618
