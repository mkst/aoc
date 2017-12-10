/ --- Day 10: Knot Hash ---

p:s:0 / position, skip

knot:{
  w:(p + til y) mod count x;
  p+:s + y;
  s+:1;
  @[x;w;:;reverse x w]
 }

xor:{0b sv(<>/)0b vs'(x;y)};

(*). 2#knot over (enlist til 256),"J"$","vs i:first read0 `:input/10.txt
/8536

p:s:0; / reset
-1 raze string "x"${xor over x} each 16 cut knot over enlist[til 256],raze 64# enlist ("j"$i),17 31 73 47 23;
/aff593797989d665349efe11bb4fd99b