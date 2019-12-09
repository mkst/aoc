/--- Day 9: Sensor Boost ---

O:(
  // 0 noop
  { };
  // 1 adds, z:x+y
  { (0N;z;x+y) };
  // 2 multiplies, z:x*y
  { (0N;z;x*y) };
  // 3 stores input in x
  { (0N;x;STDIN) };
  // 4 outputs x
  { STDOUT::x;0N };
  // 5 jump if true
  { $[x;y;0N] };
  // 6 jump if false
  { $[x;0N;y] };
  // 7 less-than
  { (0N;z;"j"$x<y) };
  // 8 equals
  { (0N;z;"j"$x=y) };
  // 9 relative offset
  { BASE+:x;0N }
  );

A:(0;3;3;1;1;2;2;3;3;1)
B:(0;2;2;1;1;2;2;2;2;1)
L:`a`b`c`d`e!`b`c`d`e`a

f:{[i;p;q]
  if[9 9~2#ii:reverse (5#10) vs i p;
    :()
    ];
  a:i p + 1 + til A o:first ii;
  if[3=o;
    a[w]:BASE + a w:where 2=B[o]#2_ii;
    if[0=count STDINS q;
      :enlist (i;p)
      ];
    if[count STDINS q;
      STDIN::first STDINS q;
      STDINS[q]::1_STDINS[q]
      ]
    ];
  if[not o=3;
    a[w]:i        a w:where 0=B[o]#2_ii;
    a[w]:i BASE + a w:where 2=B[o]#2_ii
    if[2=ii 4;
      a[2]:BASE + a 2
      ];
    ];
  if[1<count r:(O o). a;
    i[r 1]:r 2
    ];
  if[o=4;
    STDINS[L q],:STDOUT
    ];
  p:$[null first r;
    p + 1 + A o;
    first r];
  enlist (i;p)
  };

g:{[i;queues;x]
  QUEUES::queues#`a`b`c`d`e!enlist each 5#enlist(i;0);
  STDINS::queues#`a`b`c`d`e!((x 0;0);enlist x 1;enlist x 2;enlist x 3;enlist x 4);
  STDOUT::0N;
  BASE::0;
  while[sum c:count each QUEUES;
    {
      ip:first QUEUES x;
      QUEUES[x]::1_QUEUES[x];
      QUEUES[x],:f[first ip;last ip;x]
    } each where c;
   ];
  STDOUT
  };

if[`09.q~.z.f;
  -1@string g[(I:"J"$"," vs first read0 `:input/09.txt),1000#0;1#`a] 1#1;
  /2745604242
  -1@string g[I,1000#0;1#`a] 1#2
  /51135
  ];
