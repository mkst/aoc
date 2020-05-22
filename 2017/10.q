/ --- Day 10: Knot Hash ---

knot:{
  first {
    p:x 1;
    s:x 2;
    w:(p+til y) mod count l:x 0;
    (@[l;w;:;reverse l w];p+s+y;s+1)
    }/[(x;0;0);y]
  };

xor:{0b sv(<>/)0b vs'(x;y)};

hash:{"x"$(xor over) each 16 cut knot[til 256;raze 64#enlist ("j"$x),17 31 73 47 23]};

if[`10.q~.z.f;
  0N!prd 2#knot[til 256;"J"$","vs i:first read0 `:input/10.txt];
  /8536
  0N!raze string hash i
  /aff593797989d665349efe11bb4fd99b
  ];
