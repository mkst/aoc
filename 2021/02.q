// --- Day 2: Dive! ---

i:flip "SJ"$flip 1#''" "vs'read0 `:input/02a.txt

f:{ $[`f ~ first y; x + (last[y];0); `d ~ first y; x + (0;last[y]); x - (0;last[y])] }
/ (h;d)
prd f/[(0;0);i]
/1484118

/ prd sum f:{ (`f`d`u!((y;0);(0;y);(0;0-y))) x } .'i


f:{$[`f~first y; x + (last y;x[2]*last y;0); `d~first y; x + (0;0;last y); x - (0;0;last y)] }

/ (h;d;a)
prd 2#f/[(0;0;0);i]
/1463827010
