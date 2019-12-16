//--- Day 16: Flawed Frequency Transmission ---

p:{ 1_'(1 + x)#'{ raze x#'0 1 0 -1 } each 1 + til x } count i:"J"$'first read0 `:input/16.txt
f:{ mod[;10] abs sum each x*/:y }[;p]

-1@raze string 8#last f\[100;i];
/59522422
