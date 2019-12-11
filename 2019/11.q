//--- Day 11: Space Police ---

\l 09.q

f:{[i;p]
  if[9 9~2#ii:reverse (5#10) vs i p;
    :()
    ];
  a:i p + 1 + til A o:first ii;
  if[3=o;
    STDIN::0^PANELS LOC;
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
    $[MOVE::not MOVE;
      LOC+:(0 1;0 -1;-1 0;1 0)"UDLR"?DIR::$[STDOUT;"RLUD";"LRDU"]"UDLR"?DIR;
      PANELS[LOC]:STDOUT
      ];
    ];
  p:$[null first r;
    p + 1 + A o;
    first r];
  enlist (i;p)
  };

g:{[i;loc;col]
  QUEUE:enlist(i;0);
  STDOUT::0N;
  BASE::0;
  LOC::loc;
  DIR::"U";
  PANELS::(`u#enlist loc)!enlist col;
  MOVE::1b;

  while[count QUEUE;
    ip:first QUEUE;
    QUEUE:1_QUEUE;
    QUEUE,:f[first ip;last ip]
    ]
  };

I:"J"$"," vs first read0 `:input/11.txt

g[I;0 0;0];
count PANELS
/1686

g[I,1000#0;0 5;1];
OUT:{.[x;y;:;"@"]}/[(1+max each flip key PANELS)#" ";where PANELS];
-1@reverse flip OUT;
/  @@   @@  @@@  @@@  @  @ @@@@ @  @ @
/ @  @ @  @ @  @ @  @ @ @     @ @  @ @
/ @    @  @ @  @ @  @ @@     @  @  @ @
/ @ @@ @@@@ @@@  @@@  @ @   @   @  @ @
/ @  @ @  @ @ @  @    @ @  @    @  @ @
/  @@@ @  @ @  @ @    @  @ @@@@  @@  @@@@
