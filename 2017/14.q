/--- Day 14: Disk Defragmentation ---

\l 10.q

sum raze h:raze each 0b vs''hash each (first read0 `:input/14.txt),/:"-",'string til 128
/8214

v:(enlist 0N 0N)!enlist 0N; / visited, add dummy value to setup key
g:0;                        / group id

f:{
  if[not h[x;y];
    :()
    ];
  if[(x;y) in key v;
    :()
    ];
  v[(x;y)]:g;
  .z.s[x+1;y]; / go right
  .z.s[x-1;y]; / go left
  .z.s[x;y+1]; / go up
  .z.s[x;y-1]; / go down
  };

til[128]{g+:1;f[x;y]}\:/:til 128;
-1+count distinct value v
/1093