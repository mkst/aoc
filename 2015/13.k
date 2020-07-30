/--- Day 13: Knights of the Dinner Table ---

sw:{[x;y] x@(-y-1)_(!#x)+\!y} / sliding window

c:{[x] (,/'(-1+#x;{[x;y] y,/'(y:,/(),y)_\x }[x;])/:first x),'first x} / combos
f:{[x;y] +/y`$s,|'s:,/'$sw[x;2]} / solve

max f[;h]'c p:`$,'?,/$!h:,/{[x] (`$,/1#'x 0 10)!$["l"=*x 2;-;:] `i$x 3}'" "\'0:"input/13.txt"
max f[;h]'c p,`m
