/--- Day 3: Perfectly Spherical Houses in a Vacuum ---

x:y:0
deliver:{[d]
  x+::1 -1 0"><"?d;
  y+::1 -1 0"^v"?d;
  enlist (x;y)
  }

count distinct deliver each i:first read0 `:input/03.txt
/2572
x:y:0
s:deliver each i where o:(count i div 2)#10b
x:y:0
r:deliver each i where not o
count distinct r,s
/2631