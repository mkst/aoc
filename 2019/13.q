//--- Day 13: Care Package ---

\l 09.q

g[(I:"J"$"," vs first read0 `:input/13.txt),1000#0;1#`a] 1#0;

i:3 cut STDINS`b

sum 2=i[;2]
/301

draw:{ flip { $[0>y 0;[.log.Inf y;x];.[x;y 0 1;:;" $=#_o" y 2]] }/[38 21#" ";x] }

-1@draw  3 cut STDINS`b;

\
STDINS[`b]:()

g[@[I;0;:;2],1000#0;1#`a] 100# -1;

/ draw board
flip { .[x;y 0 1;:;" $=#_O" y 2] }/[38 21#" ";i]

/ play
{ -1@draw x ; } each 3 798 3# STDINS`b
// 602 is too low
