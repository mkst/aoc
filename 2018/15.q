// --- Day 15: Beverage Bandits ---

units:raze { y,'where any x=/: "GE" }'[m;til count m:read0 `:input/15x1.txt]
units:units,'200
surrounding:{ x+/:(-1 0;0 -1;0 1;1 0) }

md:flip `node`path!"**"$\:()

bfs:{[start;target]
  // reset md table
  md::flip `node`path!"**"$\:();

  open_set:();
  closed_set:();

  root:start;

  `md upsert flip (enlist root;enlist ());

  open_set,:enlist root;

  found:(); / table of found at each depth

  while[count open_set;

    subtree_root:first open_set;
    open_set:1_ open_set;
    $[.[m;subtree_root]=target;
      [
        found,:enlist subtree_root
        / clear queue
        /open_set:()
      ];
      [
        / determine surroundings
        area:.[m;] each surround:surrounding subtree_root;
        / add children in NWES
        children:(surround where not area in "#","GE""G"=target) except closed_set,open_set;
        / upsert to meta
        `md upsert flip (children;raze each (exec path from md where node~\:subtree_root),/:(count children)#enlist enlist subtree_root);
        / add to queue
        open_set,:children
      ]
      ];
      closed_set,:enlist subtree_root
    ];
  $[count found;
    2#2_exec first path from md where node~\:first distinct found;
    ()
    ]
  }

d:()
go:{[idx]
  / aa
  if[idx in d;
    /.log.Wrn (idx;"Already dead, skipping...");
    :()
    ];
  / get current position
  pos:units[;0 1] idx;
  / get unit type (E or G)
  unit:.[m;pos];
  // check for remaining enemies
  if[not (target:"GE""G"=unit) in raze m;
    .log.Err ("No enemies remaining, stopping at step";step);
    .log.Hlt step*sum units[;2] where units[;2]>0;
    'stop
    ];

  moves:$[target in surround:.[m;] each surrounding pos;
          ();
          bfs[pos;target]
          ];
  // move if we have a move
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

  // attack phase
  if[target in surround;
  /  .log.Inf (unit;"|";pos;"attack";.[m;]pos+(-1 0;0 -1;0 1;1 0)first where target=surround);
    targetpos:pos+/:(-1 0;0 -1;0 1;1 0) where target=surround;
    / pick (weakest) target in NWES
    w:w first iasc units[;2] w:where any units[;0 1]~\:/:targetpos;
    /.log.Inf (idx;target;">";count where any units[;0 1]~\:/:targetpos; "many to attack, picked";w;"|";units w);
    // subtract 3 HP
    units[w;2]-:3;
    // trigger removal of dead units
    if[units[w;2]<1;
      // remove target from map
      .[`m;units[w;0 1];:;"."];
      // add target index to dropped
      :d,:w
      ];
    ];
  / no dead to return
  :()
 }

-1@m;
-1@"           ";

bfs[2 2;"G"]
/go 0;

-1@m;
-1@"           ";

\
lastm:m;
step:0
while[1b;
  /.log.Inf step;
  d:();
  res:raze go each i:iasc units;
  if[not m~lastm;
    -1@m;
    -1@"           "
  ];
  / remove dead units
  units:units (til count units) except res;
  / increment steps
  step+:1;
  lastm:m
 ]

\

249678 is too low
252200 is also too low
