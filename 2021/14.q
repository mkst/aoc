// --- Day 14: Extended Polymerization ---

sw:{neg[x-1]_flip next\[x-1;y]}

s:first i:read0 `:input/14.txt

pt:raze { (enlist `$x)!enlist (`$x[0],y;`$y,x 1) }.'" -> "vs/:2 _ i
k:key[pt]!"j"$sum(`$sw[2;s])=\:key pt

f:{
    x:{ @[x;last y;+;first y] }/[x;flip (xw:x w;pt w:where 0 < x)];
    x:{ @[x;last y;-;first y] }/[x;flip (xw;w)];
    x
 }

g:{
    // pull out distinct keys
    k:distinct raze string key x;
    // sum up each pair
    d:k!{ div[;2] sum (sum each y=/:string key x) * value x }[x;] each k;
    // add 1 to last letter in original string
    d[last s]+:1;
    // difference of min/max
    (-). (max;min)@\:d
  }

g f/[10;k]
/2712
g f/[40;k]
/8336623059567
