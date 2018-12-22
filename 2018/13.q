/--- Day 13: Mine Cart Madness ---

/ coordinates of carts
carts:raze { y,'where any x=/:"^v<>" }'[r;til count r:read0 `:input/13.txt]
/ current direction of carts
carts:carts,'enlist each t:.[r;] each carts
/ set next turn to left
carts:carts,'"l"
/ replace carts with straight track
.[`r;;:;].'flip(carts[;0 1];"|-"t in\:"<>");

dir:{ (-1 0;0 1;1 0;0 -1) "^>v<"?x }
turn:{ (("<>";"><";"v^";"^v")"^v><"?x)y="/" }
crossroad:{  ((("<^>";">v<";"^>v";"v<^")"^v><"?x)"lsr"?y;"srl""lsr"?y) }

crashed:0b
go:{[x]
  / already crashed
  if[x in d;:()];
  / pick out cart
  c:carts x;
  / position of moved cart
  p:.[r;] n:c[0 1] + dir c 2;
  / crash
  if[n in carts[;0 1];
    / part 1
    if[not crashed;
      -1@","sv string reverse n;
      / 58,93
      crashed::1b
      ];
    / return crasher and crashee
    :d,:x,first where carts[;0 1]~\:n
    ];
  / turn cart
  if[p in "/\\";
    c[2]:turn[c 2;p]
    ];
  / crossroad
  if[p="+";
    c[2 3]:crossroad[c 2;c 3];
    ];
  / update new cart position
  c[0 1]:n;
  / update cart in carts
  carts[x]:c;
  / nothing to return
  :()
 };

while[not 1=count carts;
  / reset drop list
  d:();
  / process each cart
  res:raze go each iasc carts[;0 1];
  / drop crashed carts
  carts:carts (til count carts) except res;
  ];

-1","sv string reverse first carts[;0 1];
/ 91,72
