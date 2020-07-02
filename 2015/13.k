/--- Day 13: Knights of the Dinner Table ---

k:{[x](,/@\)/,\(,<<)'x=/x:!x} / from: https://groups.google.com/d/msg/shaktidb/OTsNFbAa7dI/sRmpNwYPAwAJ
sw:{[x;y] x@(-y-1)_(!#x)+\!y} / sliding window

h:,/{[x] (`$,/1#'x 0 10)!$["l"=*x 2;-;:] `i$x 3}'" "\'0:"input/13.txt"
c:{[x] x@k@#x}                         / combos
f:{[x] +/h`$s,|'s:,/'$sw[;2] (1+#x)#x} / solve

|/f'c@p:`$,'?,/$!h
|/f'c@p,`m
