/--- Day 2: Corruption Checksum ---

sum { last[x]-first x:asc x } each r:"J"$ "\t" vs'read0 `:input/02.txt

sum raze { { (x|y)%x&y }[x where 2=sum flip a;]x where 2=sum a:0='x mod/:x } each r