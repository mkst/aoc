/ --- Day 15: Timing is Everything ---

i:" "vs'read0 `:input/15.txt

d:(0;1+til count i)+flip "j"$"F"$i[;3 11]
f:{ sum { (x+z) mod y }[x;;]. d }

(1+)/[f;0]
/121834

/ add disc #7 with 11 positions
d:d,'11 7
(1+)/[f;0]
/3208099
