//--- Day 16: Flawed Frequency Transmission ---

p:{ 1_'(1 + x)#'{ raze x#'0 1 0 -1 } each 1 + til x }

m:p count i:"J"$'first read0 `:input/16.txt

f:{ mod[;10] abs sum each x*/:y }[;m]
g:{ mod[;10] sums x }

10 sv 8#f/[100;i]
/59522422
10 sv 8#reverse g/[100;reverse (10 sv 7#i) _ raze 10000#enlist i]
/18650834
