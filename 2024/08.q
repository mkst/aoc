// --- Day 8: Resonant Collinearity ---

// from https://code.kx.com/phrases/math/#combinations
comb:{[n;k] $[k=n;enlist til k; k=1;enlist each til n; .z.s[n-1;k],.z.s[n-1;k-1],\:enlist n-1] }

i:read0 `:input/08.txt

// identify antennas
a:{x[;1] group x[;0] } raze { $["."=v:.[i;x];();enlist (v;enlist x)]} each t cross t:til count i

// antenna pair combos
c:{x@/:comb[count x;2]}

// antinodes either side of antenna
f:{x+(::;neg)@\:(-) . x}

g:{count distinct {x where all each (x >= 0) and (x < count i)} raze each raze { raze x each c y }[x;] peach a }
g f
/ 357

// antinodes along a line up to 50x distance between antenna
f2:{ distinct raze x+\:/:raze (1 _ til count i)*\:(::;neg)@\:(-) . x}
g f2
/ 1266
