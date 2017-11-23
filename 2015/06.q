/--- Day 6: Probably a Fire Hazard ---

grid:1000 1000#0b

sanitize:{ "J"$flip ","vs'(" "vs x)$["u"=x 1;2 4;1 3] };
range:{ first[x]+til 1+last[x]-first x };

on:{  grid[range x;range y]:1b };
off:{ grid[range x;range y]:0b };
tog:{ grid[range x;range y]:not grid[range x;range y] };

light:{[i] $["n"=a:i 6;
    on . sanitize i;
    "f"=a;
    off . sanitize i;
    tog . sanitize i]
  };

light each read0 `:input/06.txt;
sum sum grid
/377891

grid:1000 1000#0

on:{  grid[range x;range y]+:1 };
off:{ grid[range x;range y]:0|grid[range x;range y]-1};
tog:{ grid[range x;range y]+:2 };

light each read0 `:input/06.txt;
sum sum grid
/14110788