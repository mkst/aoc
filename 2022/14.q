// --- Day 14: Regolith Reservoir ---

i:raze {(-1+count c)#2#'next\[c:" -> " vs x]} each read0 `:input/14.txt

range:{x + til 1 + y - x}

f:{
  xx:reverse each "J"$"," vs'x; // flip x/y
  l:first xx;
  r:last xx;
  :$[l[0]=r[0];
    l[0],/:range . asc (l 1;r 1);
    (range . asc (l 0;r 0)),\:r[1]
    ];
  }

ii:asc distinct raze f each i

maxy: max ii[;0]

// add flooring
ii,:(maxy+2),/:250 + til 500  // should base this on 2*maxy?

cave:{[x;y]
  x[y]:"#";
  :x;
  }/[(`u#enlist[0N 0N])!enlist"X";ii]

pf:{[pt2;x]
  if[1 = count x;:x];   // break iteration

  $[pt2;
    if[cave[0 500]="o";:0b]; // reached the top   (part2)
    if[maxy = x 0;:0b]       // reached the floor (part1)
    ];

  $[(cave 1 0+x) = " ";  // empty space?
    :1 0+x;              // keep going down
    (cave 1 -1+x) = " "; // empty space on diagonal left?
    :1 -1+x;             // go diagonal left
    (cave 1 1+x) = " ";  // empty space on diagonal right?
    :1 1+x;              // go diagonal right
    [cave[x]:"o";:1b]    // place some sand and we're done
    ];
  };

{pf[0b]/[0 500]}/[{x};1];
sum"o"=value cave
/719

{pf[1b]/[0 500]}/[{x};1];
sum"o"=value cave
/23390
