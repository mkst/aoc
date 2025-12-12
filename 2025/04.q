// --- Day 4: Printing Department ---

N:(0 1; 1 1; 1 0; 1 -1;0 -1; -1 -1; -1 0; -1 1)

f:{ x where not { 4>count (y+/:N) inter x }[`u#x;] each x }

p: {raze (where each "@"=flip x),''til count x} i:read0 `:input/04.txt
r: count each f\[p]

r[0] - r[1]
/ 1523

r[0] - last r
/ 9290
