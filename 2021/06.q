// --- Day 6: Lanternfish ---

i:value (til[9]!9#0) + count each group "J"$","vs first read0 `:input/06.txt
f:{ (1 _ @[x;7;+;x 0]),x 0 }

sum f/[80;i]
/373378

sum f/[256;i]
/1682576647495

\

0 -> 6 and add 1 to 8s column
1 -> 0
2 -> 1
3 -> 2
4 -> 3
5 -> 4
6 -> 5
7 -> 6
8 -> 7

f:{ @[x;where x < 7;mod;7],(sum -1=x:-1+x)#8 }
