/--- Day 15: Dueling Generators ---

g:{ (first[x]+(~/)mod[r;65536];r:(16807 48271*last x) mod 2147483647) }/[40000000;]
first g (0;) i:first ("    j";" ") 0: `:input/15.txt
/650

A:B:()

{ if[0=mod[x:mod[x*16807;2147483647];4];A,:x];x }/[{ 5000000>count A };first i];
{ if[0=mod[x:mod[x*48271;2147483647];8];B,:x];x }/[{ 5000000>count B };last i];

sum mod[A;65536]=mod[B;65536]
/336
