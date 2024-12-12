// --- Day 11: Plutonian Pebbles ---

i:"J"$" " vs first read0 `:input/11.txt

f:{
    $[x=0;
        enlist 1;
        0=mod[;2] count s:string x;
        "J"$2 0N#s;
        enlist 2024*x
        ]
    }

r:{ {flip (key x; value x)} sum each x[;1] group x[;0] }
g:{ r raze { (f first x),\:last x } peach x }

{ sum x[;1] } g/[25;] i,'(count i)#1
/ 203457

{ sum x[;1] } g/[75;] i,'(count i)#1
/ 241394363462435
