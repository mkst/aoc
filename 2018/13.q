/--- Day 13: Mine Cart Madness ---

/ coordinates of carts
carts:raze { y,'where any x=/: "^v<>" }'[r;til count r:read0 `:input/13.txt]
/ current direction of carts
carts:carts,'enlist each t:.[r;] each carts
/ set previous turn to right
carts:carts,'"l"
/ set previous square to - or |
carts:carts,'"|-"t in\:"<>"

dir:{ (-1 0;0 1;1 0;0 -1) "^>v<"?x }
turn:{ (("<>";"><";"v^";"^v")"^v><"?x)y="/" }
crossroad:{  (("<^>";">v<";"^>v";"v<^")"^v><"?x)"lsr"?y }

crashed:0b
go:{[x]
  / already crashed
  if[x in d;
    :()
    ];
  c:carts x;
  / position of moved cart
  p:.[r;] n:c[0 1] + dir c 2;
  / crash
  if[p in "<>^v";
    if[not crashed;
      -1@","sv string reverse n;
      / 58,93
      crashed::1b;
    ];
    / put back original
    .[`r;c 0 1;:;c 4];
    / replace crasher
    dc:carts w:first where carts[;0 1]~\:n;
    / replace crashee
    .[`r;dc 0 1;:;dc 4];
    / append crashed cards to droplist
    :d,:x,w;
    ];
  / turn
  if[p in "/\\";
    c[2]:turn[c 2;p]
    ];
  / crossroad
  if[p="+";
    c[2]:crossroad[c 2;c 3];
    c[3]:"lsr""rls"?c 3
    ];
  / replace old position in grid
  .[`r;c 0 1;:;c 4];
  / update new position
  c[0 1]:n;
  / update new position in grid
  .[`r;c 0 1;:;c 2];
  / update current position in cart
  c[4]:p;
  / update cart in carts
  carts[x]:c;
  / nothing to return
  :()
 };

while[not 1=count carts;
  d:();
  / process each cart
  res:raze go each iasc carts[;0 1];
  / drop crashed carts
  carts:carts (til count carts) except res;
  ];

-1","sv string reverse first raze { y,'where any x=/: "^v<>" }'[r;til count r];
/ 91,72
