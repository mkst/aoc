/--- Day 12: Digital Plumber ---

.p:{ (`$x[;0])!`$", "vs/:x[;1] }" <-> "vs/:read0 `:input/12.txt;

count { asc distinct raze x,.p x }/[`0]
/134
-1+count { x except distinct { asc distinct raze x,.p x }/[first x] }\[key .p]
/193