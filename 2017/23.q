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