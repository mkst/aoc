// --- Day 18: Settlers of The North Pole ---

g:count r:read0 `:input/18.txt
s:{x+/:(-1 0;-1 1;0 1;1 1;1 0;1 -1;0 -1;-1 -1)} each c:til[g] cross til g

f:{
  ca:.[x;y];
  sa:raze .[x;] each z;
  $[ca=".";
    ".|"2<sum"|"=sa;
    ca="|";
    "|#"2<sum"#"=sa;
    ".#"(0<sum"|"=sa)&0<sum"#"=sa
    ]
  }

res:enlist 0; / fudge for 1-index
{ res,:(sum"#"=rr)*sum"|"=rr:f[x;;]'[c;s];(g;g)#rr}/[600;r];

res 10
/531417
dr (1000000000-cdr) mod count distinct dr:(cdr:count distinct res) _ res
/205296
