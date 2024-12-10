// --- Day 9: Disk Fragmenter ---

i:0N 2#first read0 `:input/09.txt

u:-48+"j"$    i[;0] / used
s:-48+"j"$"0"^i[;1] / space

d:raze { (x#z),(y#0N) } .' (u,'s),'til count u

d[where null d]: (sum null d)#r where not null r:reverse d
sum (til sum u) * sum[u]#d
/ 6201130364722


f:{
    s:sum each null x { x where mod[x;2] x } til count x;
    /s:sum each null (0N 2#x)[;1];

    if[0N~w:first where s >= c:count x[y*2];
        / no space large enough
        :x
        ];

    if[w >= y;
        / avoid moving used to the RIGHT!
        :x
        ];

    / copy used into space
    t: x[1+2*w];
    x[1+2*w]: @[t;(first where null t) + til c;:;y];

    / clear the used and return
    :@[x;2*y;:;c#0N];
    }

/ reset
d:raze { enlist[(x#z)],enlist[(y#0N)] } .' (u,'s),'til count u

sum {x*til count x} raze f/[d;reverse 1 _ til count u]
/ 6221662795602
