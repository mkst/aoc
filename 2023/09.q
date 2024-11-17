// --- Day 9: Mirage Maintenance ---

i:{ "J"$" " vs x } each  read0 `:input/09.txt

sum { sum last each x } each r:{ 1 _ deltas x }\[{ 1 < count distinct x };] each i
/ 1980437560

sum { last { first[y] - x }\[0; reverse x] } each r
/977
