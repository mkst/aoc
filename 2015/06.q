/--- Day 6: Probably a Fire Hazard ---

sanitize:{ "J"$flip ","vs'(" "vs x)$["u"=x 1;2 4;1 3] };
range:{ first[x]+til 1+last[x]-first x };

on:{  x[range y;range z]:1b;x };
off:{ x[range y;range z]:0b;x };
tog:{ x[range y;range z]:not x[range y;range z];x };

light:{[g;i]
  $["n"=a:i 6;
    on[g;];
    "f"=a;
    off[g;];
    tog[g;]] . sanitize i
  };

sum sum light/[1000 1000#0b;r:read0 `:input/06.txt]
/377891

on:{  x[range y;range z]+:1;x };
off:{ x[range y;range z]:0|x[range y;range z]-1;x };
tog:{ x[range y;range z]+:2;x };

sum sum light/[1000 1000#0;r]
/14110788
