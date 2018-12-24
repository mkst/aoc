// --- Day 21: Chronal Conversion ---

\l 16.q

ipr:"J"$last" "vs first i:read0 `:input/21.txt
inst:{ "SJJJ"$'4#" "vs x} each 1 _ i
r:6#0
ip:0

while[not ip=28;
  ips,:ip;
  r[ipr]:ip;
  { opcodes[x 0] . x[1 2 3] } inst ip;
  ip:r[ipr];
  ip+:1
 ];
r 3
/7967233
