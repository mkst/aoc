// --- Day 5: Print Queue ---

i:(0,where 0 = count each i) cut i:read0 `:input/05.txt

i0:"J"$("|"vs) each i 0
i1:"J"$(","vs) each 1 _ i 1

f:{ all { $[all y in x; a~asc a:raze where each y=\:x; 1b] }[y; ] each x }

res:f[i0;] each i1

sum { x count[x] div 2 } each i1 where res
/ 5651

d:asc each group (!). flip reverse each i0;

g:{
    $[()~m:min raze where each x=/:d[y];
        x;
        m >= w:first where x=y;
        x;
        [
            // swap places
            t:x[m];
            x[m]:y;
            x[w]:t;
            x
        ]
        ]
    }

sum { x count[x] div 2 } each  { g/[x;x] }/[20;] each i1 where not res
/ 4743
