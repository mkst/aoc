/--- Day 9: Stream Processing ---

rg:{
  $[first x;   / inside garbage?
    $[y=">";   / > is the end-of-garbage marker
      (0b;""); / no longer inside garbage, but still chomp '>' char
      (1b;"")  / still inside garbage therefore chomp character
      ];
    $[y="<";   / < is the beginning-of-garbage marker
      (1b;""); / we are in garbage, so chomp '<' char
      (0b;y)   / we are NOT in garbage, therefore return character
      ]
    ]
  }\[0b;]     / initialise outside of garbage

cg:{
  $[y="{";    / { is the start of a new group
    x+1;      / therefore increment group level counter
    y="}";    / } is the end of a new group
    x-1;      / threfore decrement group level counter
    x         / otherwise do nothing to the counter
    ]
  }\[0;]      / initialise at zero

sum {x where x > prev x} cg raze last f:flip rg ssr[;"!?";""] first read0 `:input/09.txt
/12505
sum 1=deltas where first f
/6671
