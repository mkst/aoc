// --- Day 5: Supply Stacks ---

w:first where 0 = count each r:read0 `:input/05.txt
crates:(w-1)#r
steps:(w+1)_r

steps:"J"$(" "vs'steps)[;1 3 5]
steps:{(x;y-1;z-1)}.'steps

crates:crates[;(1 + 4 * til ceiling (max count each crates) % 4)]
crates:{ x except " " } each flip crates

f:{[x;y]
  cnt: $[3=count y;y[0];1];
  frm: y $[3=count y;1;0];
  to:  y $[3=count y;2;1];
  tmp: cnt#x[frm];
  x:   @[x;frm;{y _ x};cnt];
  x:   @[x;to;{y,x};tmp];
  :x;
 }

-1@raze first each f/[crates;] raze {[x;y;z] x#enlist (y;z) }.' steps;
/ JRVNHHCSJ

-1@raze first each f/[crates;steps];
/GNFBSBJLH
