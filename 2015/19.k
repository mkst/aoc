/--- Day 19: Medicine for Rudolph ---

ssC:*"../src/aoc.so"2:`ss!2
ss:{[x;y] (),ssC[x,0x0;y,0x0]}

sw:{[x;y] (y-1)_(-y)#',\x}
/ss:{[x;y] $[1=#(),y;&x=*y;*{[x;y] $[0=#q:*|x;x;0=#p:*x;(1#q;1_q);(y+*|p)>*q;(p;1_q);(p,*q;1_q)]}[;#y]/:(();&y~/sw[x;#y])]}
ssr:{[x;y;z] ,/@[x;i;:;(#i:1+2*!_.5*#x:(,/0,(0,#y,"")+/ss[x;y])^x)#,z]}


r:{[x] (" "\x)0 2}'-2_i:0:"input/19.txt"
s:{[x] `$(&"ABCDEFGHIJKLMNOPQRSTUVWXYZ"'x)^x}@m:*|i

#?,/'$,/{[x;y;z] @[x;;:;z]'&x=y}[s].'`$/r

r:|'r@>#'r[;1] / arrange largest transformations first

f:{[x] / (molecule;transformations)
  m:*p:*x
  t:*|p
  $[m~1#"e" / reached the end!
    ,p
    (+(ssr[m;;].'r@w;t+c w:&0<c:#'ss[m;]'*'r)),1_x]}

*|*f/:(,(m;0))

\
f2:{[x;y;z] $[D[`FOUND]|x~1#"e";(D[`FOUND]:1b;z);,/f2[;y;]'[ssr[x;;].'y@w;z+c w:&0<c:#'ss[x;]'*'y]]}
D:{FOUND:0b}; *1_f2[m;r;0]
