//--- Day 13: Care Package ---

\l 09.q

f:{[i;p;q]
  if[9 9~2#ii:reverse (5#10) vs i p;
    :()
    ];
  a:i p + 1 + til A o:first ii;
  if[3=o;
    a[w]:BASE + a w:where 2=B[o]#2_ii;

    paddle:first s last where 3=(s:3 cut STDINS[`b])[;2];
    ball:first s last where 4=s[;2];

    STDINS[`b]:();

    STDIN::$[ball<paddle;
      -1;
      ball>paddle;
      1;
      0]
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

g[(I:"J"$"," vs first read0 `:input/13.txt),1000#0;1#`a] 1#0;

sum 2=(3 cut STDINS`b)[;2]
/301

g[@[I;0;:;2],1000#0;1#`a] 1#0
/14096

\
draw:{ flip { $[0>y 0;x;.[x;y 0 1;:;" $=#o" y 2]] }/[38 21#" ";x] }
