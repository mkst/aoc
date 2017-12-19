/--- Day 18: Duet ---

i:" "vs'read0`:input/18.txt      / instructions
i[;0 1]:`$i[;0 1];               / cast to symbol

tr:{[x;y] $[all y in .Q.a;r[x;`$y];value y] }; / try register

On:enlist[`]!enlist[(::)];

On.snd:{[p;x]   snd::r[p;x];1 }
On.rcv:{[p;x]   $[0=r[p;x];1;0] }
On.set:{[p;x;y] r[p;x]:tr[p;y]; 1 }
On.add:{[p;x;y] r[p;x]+:tr[p;y]; 1 }
On.mul:{[p;x;y] r[p;x]*:tr[p;y]; 1 }
On.mod:{[p;x;y] r[p;x]:r[p;x] mod tr[p;y]; 1 }
On.jgz:{[p;x;y] $[0<tr[p;string x];tr[p;y];1] }

p:()!();p[`0]:0;     / initialise pointers
r:()!();r[`0]:()!(); / initialise registers

{ r[`0;x]:0 } each (`$ string .Q.a) inter distinct i[;1]; / initialise registers to zero

r0:1 / result 0
while[r0;
  p[`0]+:r0:On[o 0][`0;] . 1_ o:i p[`0]; / run program 0
  ];
snd
/3423

snd:0;
On.snd:{[p;x] q[$[p=`0;`1;[snd+:1;`0]]],:tr[p;string x]; 1 }
On.rcv:{[p;x] $[count q[p];[r[p;x]:first q[p];q[p]:1_q[p];1];0] }

p[`0]:0;p[`1]:0;           / re-initialise pointers to zero
q:()!();q[`0]:();q[`1]:(); / initialise queues
{ r[`0;x]:0;r[`1;x]:0 } each (`$ string .Q.a) inter distinct i[;1]; / initialise registers to zero

r[`1;`p]:1 / program b has id 1

r0:r1:1 / result 0, result 1
while[sum(r0;r1);
  p[`0]+:r0:On[o 0][`0;] . 1_ o:i p[`0]; / run program 0
  p[`1]+:r1:On[o 0][`1;] . 1_ o:i p[`1]; / run program 1
  ];
snd
/7493