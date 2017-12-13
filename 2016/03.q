/--- Day 3: Squares With Three Sides ---

sum { (sum x 0 1)>last x:asc x } each r:{"J"$ (where 1<deltas where not x=" ") cut x except " "} each read0 `:input/03.txt
/982
sum { (sum x 0 1)>last x:asc x } each 3 cut raze flip r
/1826