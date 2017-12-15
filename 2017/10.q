/ --- Day 10: Knot Hash ---

knot:{
  w:(p + til y) mod count x;
  p+:s + y;
  s+:1;
  @[x;w;:;reverse x w]
  };

xor:{0b sv(<>/)0b vs'(x;y)};

hash:{
  p::s::0; / reset position, skip
  raze 0b vs'"x"${xor over x} each 16 cut knot over enlist[til 256],raze 64# enlist ("j"$x),17 31 73 47 23
  };

if[`10.q ~ .z.f;
  p:s:0; / position, skip
  show (*). 2#knot over (enlist til 256),"J"$","vs i:first read0 `:input/10.txt;
  /8536
  show raze string "x"$0b sv'8 cut hash i
  /aff593797989d665349efe11bb4fd99b
  ];