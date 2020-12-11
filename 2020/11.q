//--- Day 11: Seating System ---

f:{[x;y]
  if[0N=s:.[x;y];:0N];
  a:sum .[x;] each y+/:(0 1;0 -1;1 0;-1 0;1 1;-1 -1;-1 1;1 -1);
  $[s=0;
    a=0; // empty seat becomes occupied if no adjacent
    a<4  // occupied seat beomes empty if >3 occupied
    ]
 }

g:{ "j"$c cut f[x;] peach (til count x) cross til c:count first x }

sum raze g/[i:(".L#"!0N 0 1) read0 `:input/11.txt]
/2296

f:{[x;y]
  if[0N=s:.[x;y];:0N];
  a:sum { first d where not null d:.[x;] each y+/:z*/:1+til 20 }[x;y] each (0 1;0 -1;1 0;-1 0;1 1;-1 -1;-1 1;1 -1);
  $[s=0;
    a=0; // empty seat becomes occupied if no adjacent
    a<5  // occupied seat beomes empty if >4 occupied
    ]
 }

sum raze g/[i]
/2089
