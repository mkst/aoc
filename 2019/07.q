/--- Day 7: Amplification Circuit ---

\l 05.q

I:"J"$"," vs first read0 `:input/07.txt

g:{[i;p]
  a:f[i;p[0],0];
  b:f[i;p[1],a];
  c:f[i;p[2],b];
  d:f[i;p[3],c];
  e:f[i;p[4],d];
  e
  };

max r:g[I;] each d where (all each 5>d) and 5=count each d:distinct each "J"$string "0"^-5$string til 43211
/65464

O:(
  // 0 noop
  { -1"noop" };
  // 1 adds, z:x+y
  { (0N;z;x+y) };
  // 2 multiplies, z:x*y
  { (0N;z;x*y) };
  // 3 stores input in x
  { (0N;x;STDIN) };
  // 4 outputs x
  { if[x>0;STDOUT::x];0N };
  // 5 jump if true
  { $[x;y;0N] };
  // 6 jump if false
  { $[x;0N;y] };
  // 7 less-than
  { (0N;z;"j"$x<y) };
  // 8 equals
  { (0N;z;"j"$x=y) }
  );

A:(0;3;3;1;1;2;2;3;3);
LUT:`a`b`c`d`e!`b`c`d`e`a

f:{[i;p;q]
  o:first ii:reverse (5#10) vs i p;
  if[9=o;
    :()
    ];
  a:i p + 1 + til A o;
  if[o in 1 2 5 6 7 8;
    a[w]:i a w:where not 2#2_ii;
    ];
  if[o=4;
    a[w]:i a w:where not 1#2_ii;
    ];
  if[o=3;
    if[0=count STDINS q;
      :enlist (i;p)
      ];
    if[count STDINS q;
      STDIN::first STDINS q;
      STDINS[q]::1_STDINS[q]
      ]
    ];
  if[1<count r:(O o). a;
    i[r 1]:r 2
    ];
  if[o=4;
    STDINS[LUT q],:STDOUT
    ];
  p:$[null first r;
    p + 1 + A o;
    first r];
  enlist (i;p)
  };

h:{
  QUEUES::`a`b`c`d`e!enlist each 5#enlist(I;0);
  STDINS::`a`b`c`d`e!((x 0;0);enlist x 1;enlist x 2;enlist x 3;enlist x 4);
  STDOUT::0N;
  while[sum c:count each QUEUES;
    {
      ip:first QUEUES x;
      QUEUES[x]::1_QUEUES[x];
      QUEUES[x],:f[first ip;last ip;x]
    } each where c;
   ];
  STDOUT
  };

max h each d where (all each 4<d) and 5=count each d:distinct each "J"$string "0"^-5$string 56789 + til 100000-56789
/1518124
