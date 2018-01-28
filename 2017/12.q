/--- Day 12: Digital Plumber ---

p:{ (`$x[;0])!`$", "vs/:x[;1] }" <-> "vs/:read0 `:input/12.txt;
r:{ distinct x,raze p x }

count r over `0
/134
-1+count { x except r over first x } scan key p
/193
