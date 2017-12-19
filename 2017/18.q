/--- Day 18: Duet ---

On:enlist[`]!enlist[(::)];

On.snd:{[x]   snd::.r[x];1 }
On.set:{[x;y] .r[x]:$[all y in .Q.a;.r[`$y];value y];1 }
On.add:{[x;y] .r[x]+:$[all y in .Q.a;.r[`$y];value y];1 }
On.mul:{[x;y] .r[x]*:$[all y in .Q.a;.r[`$y];value y];1 }
On.mod:{[x;y] .r[x]:.r[x] mod $[all y in .Q.a;.r[`$y];value y];1 }
On.rcv:{[x]   $[0=.r[x];1;count[i]]}
On.jgz:{[x;y] $[0<.r[x];value y;1]}

.r:()!();                        / registers
p:0;                             / pointer
i:" "vs'read0`:input/18.txt      / instructions

i[;0 1]:`$i[;0 1];               / cast to symbol
{ .r[x]:0 } each distinct i[;1]; / initialise registers to zero

while[count[i]>p+:On[o 0] . 1 _ o:i p;()]
snd
/3423