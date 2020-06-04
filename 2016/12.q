/--- Day 12: Leonardo's Monorail ---

cpy:{
  r[first y]:$[any x in "abcd";r[first x];"J"$x];
  1
 }
inc:{
  r[first x]+:1;
  1
 }
dec:{
  r[first x]-:1;
  1
 }
jnz:{
  $[r first x;"J"$y;1]
 }

inst:" "vs'read0 `:input/12.txt

ip:0;r:"abcd"!0 0 0 0
while[count[inst]>ip+:(`$i 0). 1 _ i:inst ip];
r"a"
/318077

/ first 40 fibonacci numbers
fib40:{ x,sum -2#x }/[38;1 1]
fib40[27] + 14*19
/318077
fib40[27+7] + 14*19
/9227731
