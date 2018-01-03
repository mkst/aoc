/--- Day 3: Spiral Memory ---

/OEIS A016754
A016754:{ x*(x:1+2*x) }
{ ring:{ { x+1 }/[{[MAX;x] MAX > A016754 x}[x];0] } x;
  ring + abs ring - (x - A016754 ring - 1) mod floor 0.25*(A016754 ring)-A016754 ring - 1 } 368078
/371

g:(enlist 0 0)!enlist 1 / bootstrap
l:1 0 / move east

while[368078>g[l]:sum (n:g l +/:(0 1;1 0;0 -1;-1 0)),g l+/:(1 1;1 -1;-1 -1;-1 1);
  $[(d:"b"$0^n) in (0001b;0011b);
    l+:0 1;  / move north
    d in (0010b;0110b);
    l+:-1 0; / move west
    d in (0100b;1100b);
    l+:0 -1; / move south
    l+:1 0   / move east
    ]
  ];
g l
/369601
