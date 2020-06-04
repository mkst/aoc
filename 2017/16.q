/--- Day 16: Permutation Promenade ---

i:{
  $["s"=x 0;
    rotate[neg["J"$1_x];];
    "x"=x 0;
    {@[x;y;:;reverse x y]}[;"J"$"/"vs 1_x];
    {@[x;x?y;:;reverse y]}[;"/"vs 1_x]
    ]
 } peach "," vs first read0 `:input/16.txt

{y x}/[16#.Q.a;i]
/ceijbfoamgkdnlph

r 1000000000 mod count r:{ {y x}/[y;x] }[i]\[16#.Q.a]
/pnhajoekigcbflmd
