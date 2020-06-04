/--- Day 21: Fractal Art ---

b:010001111b / book
r:()!()      / rules
{ { r[enlist raze x]:enlist raze y }[;"#"="/"vs y] each (reverse reverse each f;reverse each f;reverse f;f:flip x;
                                                         reverse reverse each x;reverse each x;reverse x;x:"#"="/"vs x)
  } .' " => " vs/:read0 `:input/21.txt;

f:{ $[9=count x;r[x] 0 2 8 10+\:0 1 4 5;r x] };
g:{ raze f each (raze (raze f each f x) 0 3 6 18 21 24+\:0 1 2 9 10 11) 0 12 24+\:0 2 4+\:0 1 6 7 };

sum { raze f each x }/[2;g b]
/117

sum raze { raze g each x }/[5;] g b
/2026963i
