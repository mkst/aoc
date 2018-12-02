// --- Day 1: Chronal Calibration ---

sum r:"J"$read0 `:input/01.txt
/ 536
first where d=min d:{x[;0]+x[;1]-x[;0]} group 0,sums 200000#r
/ 75108

\
k)(+/r),*&d=&/d:{x[;0]+x[;1]-x[;0]}@=0,+\200000#r:"J"$0:`:input/01.txt
