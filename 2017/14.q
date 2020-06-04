/--- Day 14: Disk Defragmentation ---

\l 10.q

sum raze h:raze each 0b vs''hash peach (first read0 `:input/14.txt),/:"-",'string til 128
/8214

v:(`u#enlist 0N 0N)!enlist 0N; / visited, add dummy value to setup key

f:{[x;id]
  if[not h . x;   / ignore 'off' bits
    :()
    ];
  if[x in key v;  / ignore already visited
    :()
    ];
  v[x]:id;        / set region for this bit
  .z.s[x+1 0;id]; / go right
  .z.s[x-1 0;id]; / go left
  .z.s[x+0 1;id]; / go up
  .z.s[x-0 1;id]; / go down
  };

f'[til[128] cross til 128;til 128*128];
-1+count distinct value v
/1093
