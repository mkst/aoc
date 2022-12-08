// --- Day 5: Supply Stacks ---

w:first where 0 = count each r:read0 `:input/05.txt
crates:(w-1)#r
steps:(w+1)_r

steps:"J"$(" "vs'steps)[;1 3 5]
steps:0 -1 -1+/:steps

crates:crates[;(1 + 4 * til ceiling (max count each crates) % 4)]
crates:{x except " "} each flip crates

f:{[f;x;y]
  cnt: y 0;
  frm: y 1;
  to:  y 2;
  x: @[x;to;{y,x};f cnt#x[frm]];
  x: @[x;frm;{y _ x};cnt];
  :x;
 }

-1@raze first each f[reverse]/[crates;steps];
/ JRVNHHCSJ

-1@raze first each f[(::)]/[crates;steps];
/ GNFBSBJLH
