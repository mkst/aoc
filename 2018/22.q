// --- Day 22: Mode Maze ---

depth:"J"$last first i:" "vs'read0 `:input/22.txt
target:"J"$","vs last last i
gridsize:5+max target
g:(`u#enlist 0 0)!enlist 0

{
  g[x,y]:mod[;20183] depth + $[x=0;
             y*48271;
             y=0;
             x*16807;
             target~x,y;
             0;
             prd g (-1 0;0 -1)+\:x,y]
 } .' til[gridsize] cross til gridsize;

G:flip ./[(2#gridsize)#0;key g;:;mod[value g;3]]
sum raze .[G;reverse til each 1 + target]
/11462
