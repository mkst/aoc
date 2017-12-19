/--- Day 19: A Series of Tubes ---

g:read0 `:input/19.txt / input
d:"D"                  / initial direction
x:first where "|"=g 0  / starting x
y:0                    / starting y
v:()                   / visited chars
s:0                    / steps taken

cont:{[] y+:("DULR"!1 -1  0 0)d;x+:("DULR"! 0 0 -1 1)d };
cros:{[] d::"UDLR" first where (not d="DURL") and not " "=(g[y-1;x];g[y+1;x];g[y;x-1];g[y;x+1]) };
move:{[]
  $[null c:g[y;x];:();              / finished
    c="+";[cros[];cont[]];          / crossroad
    [v,:$[c in .Q.A;c;()];cont[]]]; / continue
  :c;                               / return current pos
  };

while[count move[];s+:1];
-1 v;
/NDWHOYRUEA
s
/17540