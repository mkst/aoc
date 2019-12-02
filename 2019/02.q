//--- Day 2: 1202 Program Alarm ---

I:"J"$"," vs first read0 `:input/02.txt

f:{[i;n;v]
  i[1]:n;
  i[2]:v;

  p:0;
  w:1b;

  while[w;
    a:i[p];
    $[a=1;
      i[i[p+3]]:i[i[p+1]]+i[i[p+2]];
      a=2;
      i[i[p+3]]:i[i[p+1]]*i[i[p+2]];
      w:0b
      ];
    p+:4
   ];
  i 0
  };

f[I;12;2]
/8017076

T:19690720
N:32;V:1;
W:1b;
while[W&N;
  V:1;
  while[W&T>R:f[I;N;V];
    V+:1;
    ];
  $[T=R;
    W:0b;
    N-:1]
  ];

V+100*N
/3146
