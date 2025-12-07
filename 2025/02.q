// --- Day 2: Gift Shop ---

p1:{ (~)/[2 0N#string x] }
p2:{ (x > 9) and any { 1=count distinct x cut y }[;s] each 1 + til ceiling 0.5 * count s:string x }

sum raze { a where p1 each a:{ x + til 1 + y - x}. "J"$ "-" vs x} each i:"," vs first read0 `:input/02.txt
/40398804950

sum raze { a where p2 each a:{ x + til 1 + y - x}. "J"$ "-" vs x} each i
/65794984339
