/--- Day 12: Digital Plumber ---

p:{ (`$x[;0])!`$", "vs/:x[;1] }" <-> "vs/:read0 `:input/12.txt;

count { distinct x,raze p x }/[`0]
/134
-1+count { x except { distinct x,raze p x }/[first x] }\[key p]
/193