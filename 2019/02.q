//--- Day 2: 1202 Program Alarm ---

f:{[i;n;v]
  i[1]:n;i[2]:v;
  p:0;w:1b;
  while[w;
    $[99=i p;w:0b;i[i p+3]:((::;+;*)i p) . i i p + 1 2];
    p+:4
    ];
  i 0
  };

f[I:"J"$"," vs first read0 `:input/02.txt;12;2]
/8017076

N:0;V:0;T:19690720;W:1b;

while[T>R:f[I;N;V];N+:1];
while[W&N;
  V:0;
  while[W&T>R:f[I;N;V];V+:1];
  $[T=R;W:0b;N-:1]
  ];

V+100*N
/3146
