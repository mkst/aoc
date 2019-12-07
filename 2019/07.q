/--- Day 7: Amplification Circuit ---

\l 05.q

I:"J"$"," vs first read0 `:input/07.txt

g:{[i;p]
  a:f[i;p[0],0];
  b:f[i;p[1],a];
  c:f[i;p[2],b];
  d:f[i;p[3],c];
  e:f[i;p[4],d];
  e
  };

max r:g[I;] each d where (all each 5>d) and 5=count each d:distinct each "J"$string "0"^-5$string til 43211
/65464
