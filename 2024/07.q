// --- Day 7: Bridge Repair ---

i:{("J"$" "vs y;"J"$x) }.' ": "vs/:read0 `:input/07.txt

c:{x@/:neg[y]#'(16#0),/:(count x) vs/:til "j"$count[x] xexp y }

C:{t!c[x;] each t:til y}

/ build combo dicts
c2:C[(+;*);] m:max count each i[;0]
c3:C[(+;*;{"J"$string[x],string[y]}); m]


f:{z in {{(last y). (x;first y)}/[x]} peach {(1#x),(1_ x),'enlist each y}[y;] peach x -1+count y}

sum raze i[;1] where p1:f[c2;] .'i
/ 12839601725877

sum raze i[;1] (where p1),w where p2:f[c3;] .'i w:where not p1
/ 149956401519484
