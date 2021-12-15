// --- Day 15: Chiton ---

i:.Q.n?read0 `:input/15.txt

s:(0 1;1 0;0 -1;-1 0)

f:{
    nxt:y+/:s;
    nxt:nxt where all each (nxt > -1) and nxt < count x;
    g[;;z]/[x;nxt]
    }

g:{
    sur:y+/:s;
    sur:sur where all each (sur > -1) and sur < count x;
    $[.[x;y] > nc:.[z;y]+min .[x;] each sur;
        .[x;y;:;nc];
        x
        ]
    }

h:{
    c:(2#count x)#0W; // costs
    c:.[c;0 0;:;0];   // seed initial

    r:f[;;x]/[c;t:til[count x] cross til count x];
    r . last t
    }

h i
/ 685

a:{ raze { x#enlist y}[count x;] each { raze x#'y }[count x;] each 5#5#'next\[til 25] } i
b:(5*count i)#{ (5*count x)#x } each i
cc:{ @[x;where x > 9;{ 1 + x mod 10 }] } each a+b
h cc
/ 2995
