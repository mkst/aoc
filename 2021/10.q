// --- Day 10: Syntax Scoring ---

d:")]}>([{<"!"([{<)]}>"

f:{
    $[not first x;                 // already errored?
        x;                         // return last result
        y in ")]}>";               // closing stream?
            $[(last last x)=d y;   // as expected?
                (1b;-1 _ last x);  // (good;drop last)
                (0b;y)];           // (bad;found)
            (1b;last[x],y)         // (good;append new)
        ]
    }

r:{ f/[(1b;"");x] } each read0 `:input/10.txt

s:")]}>"!3 57 1197 25137

sum s r[;1] where not r[;0]
/319329

s2:")]}>"!1 2 3 4

"j"$med { { (s2 y)+5*x }/[0;reverse x] } each d r[;1] where r[;0]
/3515583998
