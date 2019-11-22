// --- Day 15: Beverage Bandits ---

units:raze { y,'where any x=/: "GE" }'[m;til count m:read0 `:input/15.txt]
units:units,'200
surrounding:{ x+/:(-1 0;0 -1;0 1;1 0) }

bfs:{[root;target]
  / metadata
  md:()!();
  / queues
  open_set:closed_set:();
  /add root to metadata
  md[enlist root]:enlist 0N 0N;
  / add root with length 0
  open_set,:enlist (root;0);
  / list of found nodes
  found:();
  / process queue
  while[count open_set;
    / take first
    current:first open_set;
    / first part is x/y
    subtree_root:current 0;
    / second part is length
    path_length:current 1;
    / drop from queue
    open_set:1_ open_set;
    / check surrounding squares for a target
    $[target in area:.[m;] each surround:surrounding subtree_root;
      [
        found,:enlist current
      ];
      [
        / add children in NWES
        children:(surround where area=".") except closed_set[;0],open_set[;0];
        / add to meta
        md[children]:(count children)#enlist subtree_root;
        / add to queue
        open_set,:(;path_length+1) each children
      ]
      ];
      closed_set,:enlist current
    ];
  f:first asc found[;0] where found[;1]=min found[;1];
  first 3_reverse md\[f]
 };

d:()
go:{[idx]
  / skip go as unit is dead
  if[idx in d;:()];
  / get current position
  pos:units[;0 1] idx;
  / get unit type (E or G)
  unit:.[m;pos];
  // check for remaining enemies
  if[not (target:"GE""G"=unit) in raze m;
      -1@ ("No enemies remaining, stopping at step ", string step);
      -1@ string step*sum units[;2] where units[;2]>0;
      'stop
    ];
  / move if there are no targets around us
  moves:$[target in surround:.[m;] each surrounding pos;
          ();
          bfs[pos;target]
          ];
  / move if we have a move
  if[count moves;
    / choose new position
    newpos:moves;
    / update old pos -> .
    .[`m;pos;:;"."];
    / update newpos -> pos
    pos:newpos;
    / update map
    .[`m;pos;:;unit];
    / update units
    units[idx;0 1]:pos;
    / update surroundings
    surround:.[m;] each surrounding pos
    ];
  / attack phase
  if[target in surround;
    /.log.Inf (unit;"|";pos;"attack";.[m;]pos+(-1 0;0 -1;0 1;1 0)first where target=surround);
    targetpos:pos+/:(-1 0;0 -1;0 1;1 0) where target=surround;
    / pick (weakest) target in NWES
    w:w first iasc units[;2] w:where (units[;2]>0)&any units[;0 1]~\:/:targetpos;
    // subtract 3 HP
    units[w;2]-:$[unit="G";3;ELFSTRENGTH];
    // trigger removal of dead units
    if[units[w;2]<1;
      /if[unit="G";'deadelf];
      // remove target from map
      .[`m;units[w;0 1];:;"."];
      // add target index to dropped
      :d,:w
      ];
    ];
  / no dead to return
  :()
  }

ELFSTRENGTH:3 / 16 for part 2

step:0
while[1b;
  / print map
  /-1@"\nRound: ",string[step],"\n";
  /-1@m,'-17$flip count[m]$flip" "sv'4$string units;
  / clear dead units
  d:();
  / go
  res:raze go each tcu:til count units;
  / remove dead units
  units:units tcu except res;
  / re-sort based on location
  units:units iasc units[;0 1];
  / increment steps
  step+:1
  ]

/261855
/59568
