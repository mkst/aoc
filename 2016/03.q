/--- Day 3: Squares With Three Sides ---

f:{ (sum x 0 1)>last x:asc x }

sum f each r:{ "J"$ 0 5 10 _ x } each read0 `:input/03.txt
/982
sum f each 3 cut raze flip r
/1826
