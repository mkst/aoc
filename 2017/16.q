/--- Day 16: Permutation Promenade ---

dance:{[d;x]
  $["s"=x 0;
    neg["J"$1_x] rotate d;
    "x"=x 0;
    @[d;p;:;reverse d p:"J"$"/"vs 1_x];
    @[d;d?p;:;d reverse d?p:"/"vs 1_x]
    ]
  };

dance over (enlist 16#.Q.a),i:"," vs first read0 `:input/16.txt
/ceijbfoamgkdnlph

res:{ dance over (enlist x),i }\[16#.Q.a]
res 1000000000 mod count res
/pnhajoekigcbflmd