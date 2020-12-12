//--- Day 12: Rain Risk ---

f:{[pd;a]
  p:first pd;
  d:last pd;
  if[a[0] in `N`E`S`W;
    :(p+a[1]*(`N`S`E`W!(0 1;0 -1;1 0;-1 0)) a[0];d)
    ];
  if[a[0]=`F;
    :(p+a[1]*(`N`S`E`W!(0 1;0 -1;1 0;-1 0)) d;d)
    ];
  if[a[0] in `L`R;
    r:"j"$a[1] % 90;
    :$[a[0]=`L;
      (p;{(`N`E`S`W!`W`N`E`S) x}/[r;d]);
      (p;{(`N`E`S`W!`E`S`W`N) x}/[r;d])
      ]
    ];
  };

i:{(`$first x;"J"$1_x)} each read0 `:input/12.txt

sum abs first f/[(0 0;`E);i]
/1148

f:{[wp;a]
  w:first wp;
  p:last wp;
  if[a[0] in `N`E`S`W;
    :(w+a[1]*(`N`S`E`W!(0 1;0 -1;1 0;-1 0)) a[0];p)
    ];
  if[a[0] = `F;
    :(p+d;p:p+a[1]*d:w - p)
  ];
  if[a[0] in `L`R;
    r:"j"$a[1] % 90;
    d:w - p;
    :$[a[0]=`L;
      (p+{[x] (-1*x[1];x[0]) }/[r;d];p);
      (p+{[x] (x[1];-1*x[0]) }/[r;d];p)
      ]
    ];
  };

sum abs last f/[(10 1;0 0);i]
/52203
