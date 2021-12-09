// --- Day 9: Smoke Basin ---

c:raze til[count i],\:/:til count flip i:-48+"j"$read0 `:input/09.txt

s:(0 1;1 0;0 -1;-1 0)
sum 1 + i ./:lp:c where { all (i . x) < 0w^i ./:x+/:s } each c
/535

f:{[x]
    v:enlist 0N 0N;             // initialise visited
    q:enlist x;                 // initialise queue
    while[count q;              // while there is work to do...
        n:first q;              // pop first
        q:1 _ q;                // update queue
        if[not n in v;          // check we've not been here before
            v,:enlist n;        // add to visited
            o:n+/:s;            // all options
            o:o where not o in v; // filter visited
            sc:i ./:o;          // get surrounding cells
            q:q,o where (sc < 9) and sc > i . n // filter visited and add to queue
            ];
    ];
    :-1+count v;                // return length of visited
  }

prd -3#asc f peach lp
/1122700
