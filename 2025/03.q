// --- Day 3: Lobby ---

/sum "J"${ m,max (1+first where x = m:max -1_x) _ x } each i:read0 `:input/03.txt
/17155

f2:{[x;y]
    first w where not null w:{ w first where x <= (count y) - w:where y=z }[x;y;] each desc distinct y
    }

f:{[x;y]
    if[x = 1;:max y];
    best:f2[x;y];
    :(y best), .z.s[x - 1; (1 + best) _ y];
  }

sum "J"$f[2;] each i:read0 `:input/03.txt
/ 17155

sum "J"$f[12;] each i
/ 169685670469164
