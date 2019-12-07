//--- Day 5: Sunny with a Chance of Asteroids ---

f:{[i;stdin]

  O:(
    // 0 noop
    { -1"noop" };
    // 1 adds, z:x+y
    { (0N;z;x+y) };
    // 2 multiplies, z:x*y
    { (0N;z;x*y) };
    // 3 stores input in x
    { r:first STDIN;STDIN::1_STDIN;(0N;x;r) };
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
  p:0;

  STDIN::(),stdin;
  STDOUT::-1;

  while[9>o:first ii:reverse (5#10) vs i p;
    a:i p + 1 + til A o;
    if[o in 1 2 5 6 7 8;
      a[w]:i a w:where not 2#2_ii;
      ];
    if[o=4;
      a[w]:i a w:where not 1#2_ii;
      ];
    if[1<count r:(O o). a;
      i[r 1]:r 2
      ];
    p:$[null first r;
      p + 1 + A o;
      first r]
    ];
  :STDOUT;
  };

if[`05.q~.z.f;
  -1@string f[I:"J"$"," vs first read0 `:input/05.txt;1];
  /12428642
  -1@string f[I;5]
  /918655
  ];
