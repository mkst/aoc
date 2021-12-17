// --- Day 17: Trick Shot ---

i:"J"$".."vs/:2_'", "vs 13 _ first read0 `:input/17.txt

X:first i; Y:last i

f:{[pv] // (position;velocity)
    v:last pv;
    pv + (v;$[0>v 0;1 -1;0<v 0;-1 -1;0 -1])
 }

g:{[pv;tx;ty]
    r:f\[{[pv;tx;ty] (pv[0;0] < tx) and (pv[0;1] > ty) }[;max tx;min ty];(0 0;pv)];
    a:any {[xy;tx;ty] (xy[0] within tx) and xy[1] within ty }[;tx;ty] each r[;0];
    m:max r[;0;1]; // max y value
    (a;m)
  }

r:g[;X;Y] peach t:til[1 + max X] cross min[Y] + til[1 + 2 * max abs Y]
max r[;1] where r[;0]
/3003
sum r[;0]
/940i
