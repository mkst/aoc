// --- Day 12: Subterranean Sustainability ---

i:read0 `:input/12.txt
padding:4;generations:200
state:(padding#0b),("#"=is:(" "vs i 0) 2),generations#0b
rules:raze { $["#"=first (x:" "vs x) 2;enlist "#"=x 0;()] } each 2_ i
states:();

while[generations > count states,:enlist state:(state (-2+til 5)+/:til count state) in rules];

sum neg[padding]+where states 19
/ 3051
sum (50000000000-count states)+neg[padding]+where state
/ 1300000000669
