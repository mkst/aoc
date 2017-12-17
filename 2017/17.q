/--- Day 17: Spinlock ---

s:"J"$first read0 `:input/17.txt
p:1 / position

spinlock:{
  $[y=p::1+(p+s) mod y;
    x,y;
    (p#x),y,(p-y)#x
    ]
  };

res:spinlock over til 1+2017
res p+1
/596

p:1;
{ if[1=p::1+(p+s) mod x;r::x] } each 1 + til 50000000;
r
/39051595