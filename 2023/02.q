// --- Day 2: Cube Conundrum ---

sum 1 + where { all { all 12 13 14 >= 0 ^ `red`green`blue#(!). flip x } each { { raze "SJ"$reverse " " vs x } each trim "," vs x } each ";" vs last ":"vs x } each read0 `:input/02.txt
/ 2810

sum { prd value exec max red, max green, max blue from { 0 ^ `red`green`blue#(!). flip x } each { { raze "SJ"$reverse " " vs x } each trim "," vs x } each ";" vs last ":"vs x } each read0 `:input/02.txt
/ 69110
