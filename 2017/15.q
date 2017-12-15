/--- Day 15: Dueling Generators ---

f:16807 48271
m:2147483647
c:0;
{
  c+:1*(~/) -16#'0b vs'x:(f*x) mod m;
  x
 }/[40000000;f*i:first ("    i";" ") 0: `:input/15.txt];

c
/650

A:B:()

{ A,:$[0=mod[x:(first[f]*x) mod m;4];x;()];x }/[{ 5000000>count A };first i];
{ B,:$[0=mod[x:(last[f]*x) mod m;8];x;()];x }/[{ 5000000>count B };last i];

sum {x~y}'[(-16#'0b vs 'B);(-16#'0b vs'A)]
/336