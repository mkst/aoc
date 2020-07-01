/--- Day 9: All in a Single Night ---

k:{[x](,/@\)/,\(,<<)'x=/x:!x} / from: https://groups.google.com/d/msg/shaktidb/OTsNFbAa7dI/sRmpNwYPAwAJ
sw:{[x;y] (y-1)_(-y)#',\x}    / sliding window

r:,/{[x] (`$,/'2#''x(0 2;2 0))!2#`i$x 4}'" "\'0:"input/09.txt" / routes
c:{[x] x@k@#x}@`$?2^,/$!r                                      / combos

&/t:{[x] +/r`$,/'$sw[x;2]}'c
|/t
