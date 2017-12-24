/--- Day 23: Coprocessor Conflagration ---

tr:{ $[all x in .Q.a;r[`$x];"J"$x] };      / try register

i:" "vs'read0`:input/23.txt                / instructions
i[;0 1]:`$i[;0 1];                         / cast to symbol
r:(`$'8#.Q.a)!8#0;                         / initialise registers to zero

On:(`u#enlist`)!enlist[(::)];              / initialise instruction set
On.set:{[x;y] r[x]:tr[y];1 };
On.sub:{[x;y] r[x]:r[x]-tr[y];1 };
On.mul:{[x;y] m+:1; r[x]:r[x]*tr[y];1 };
On.jnz:{[x;y] $[0=tr[string x];1;"J"$y] };

p:0;                                       / initialise pointer to zero
while[p<count i;p+:On[o 0] . 1_ o:i p];m   / run program
/3025

sum { any 0=x mod 2_til floor sqrt x } each 105700+17*til 1+div[122700-105700;17]
/915

\
b:57;            /set b 57
c:v;             /set c b
b*:100;          /mul b 100
b-:-100000;      /sub b -100000
c:b;             /set c b
c-:-17000;       /sub c -17000
while[1b;        /jnz 1 -23
  f:1;           /set f 1
  d:2;           /set d 2
  while[g<>0;    /jnz g -13
    e:2;         /set e 2
    while[g<>0;  /jnz g -8
      g:d;       /set g d
      g*:e;      /mul g e
      g-:b;      /sub g b
      if[g=0;    /jnz g 2
        f:0];    /set f 0
      e-:-1;     /sub e -1
      g:e;       /set g e
      g-:b];     /sub g b
    d-:-1;       /sub d -1
    g:d;         /set g d
    g-:b];       /sub g b
  if[f=0;        /jnz f 2
    h-:-1];      /sub h -1
  g:b;           /set g b
  g-:c;          /sub g c
  if[g=0;        /jnz g 2
    :()];        /jnz 1 3
  b-:-17];       /sub b -17