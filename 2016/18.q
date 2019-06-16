/--- Day 18: Like a Rogue ---

sw3:{2_-3#'reverse prev\[1+count x;x,0b]}
traps:`u#(110b;011b;100b;001b)
f:{ sw3[x] in traps }

sum not raze f\[40-1;] i:"^"=first read0 `:input/18.txt
/1913
sum not raze f\[400000-1;i]
/19993564
