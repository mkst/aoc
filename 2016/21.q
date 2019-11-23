/--- Day 21: Scrambled Letters and Hash ---

swpp:{ x[z,y]:x y,z;x }
swpl:{ wy:where x=y; wz:where x=z; x[wy,wz]:(count[wy]#z),count[wz]#y;x }
rotc:{ ($[y~"left";;neg]@z) rotate x }
rotp:{ i:first where x=y; rotc[x;"right";1 + i + $[i>3;1;0]] }
rvrs:{ x[reverse i]:x i:y + til 1 + z - y;x }

move:{
  / length of x
  c:count x;
  / temp var
  t:x y;
  / remove
  x:x _ y;
  $[z=0;
    t,x;
    z=c;
    x,t;
    (z#x),t,neg[c-z+1]#x
  ]
  };

r:" "vs'read0 `:input/21.txt

f:{
  if["swap"~y 0;
    :$["position"~y 1;
      swpp[x;] . "I"$ y 2 5;
      swpl[x;] . raze y 2 5]
    ];
  if["rotate"~y 0;
    :$["based"~y 1;
      rotp[x;] first y 6;
      rotc[x;y 1;] "I"$ y 2]
  ];
  if["reverse"~y 0;
    :rvrs[x;] . "I"$ y 2 4
  ];
  if["move"~y 0;
    :move[x;] . "I"$ y 2 5
  ];
 }

f/["abcdefgh";r]
/aefgbcdh

g:{
  if["swap"~y 0;
    :$["position"~y 1;
      swpp[x;] . "I"$ y 5 2;
      swpl[x;] . raze y 5 2]
    ];
  if["rotate"~y 0;
    :$["based"~y 1;
      rotc[x;"left";] 1 1 6 2 7 3 0 4 first where x=first y 6;
      rotc[x;("left";"right")@"left"~y 1;] "I"$ y 2]
  ];
  if["reverse"~y 0;
    :rvrs[x;] . "I"$ y 2 4
  ];
  if["move"~y 0;
    :move[x;] . "I"$ y 5 2
  ];
 }

g/["fbgdceah";reverse r]
/egcdahbf
