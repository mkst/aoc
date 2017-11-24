/--- Day 19: Medicine for Rudolph ---

r:(0,where ""~/:r)cut r:read0 `:data/19.txt;
s:string ("s s";" ")0:first r;

count distinct raze first[s]{ {[x;y;z;l] x:@[string x;y;:;z];raze x _/c#(y+c:count[l]-1) }[x;;z;y] each ss[x;y] }[last last r;]'last[s]
/518