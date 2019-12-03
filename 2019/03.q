//--- Day 3: Crossed Wires ---

f:{
  r:{
    p:first x;
    d:first y;
    t:1 + til"J"$1_y;
    s:$[d="U";
        (p[0]+t),'p 1;
        d="D";
        (p[0]-t),'p 1;
        d="R";
        p[0],'(p[1]+t);
        p[0],'(p[1]-t)
        ];
    (last s;s)
    }\[enlist 0 0;x];
  :last each r
  };

min sum each abs c:(inter). w:raze each f each i:","vs'read0 `:input/03.txt
/489
2+min raze { sum raze where each y~/:/:x }[w;] each c
/93654
