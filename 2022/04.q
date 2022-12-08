// --- Day 4: Camp Cleanup ---

range:{x + til 1 + y - x};
sum {$[all x in y;1b;all y in x]}.'p:{range .'"J"$"-"vs'","vs x} each read0`:input/04.txt
/567
sum {any x in y}.'p
/907
