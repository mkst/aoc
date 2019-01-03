/--- Day 7: Internet Protocol Version 7 ---

sw4:-4_4#'next\
sw3:-3_3#'next\
f:{ x where (not x[;0]=x[;1])&x~'reverse each x }

sum raze {
  a:f@'sw4@'x;
  (not count raze a[where not e])&count raze a where e:0=mod[;2] til count x
  } each r:{ (0,where any "[]"=\:x) cut x } each read0 `:input/07.txt
/118

sum raze {
  a:f@'sw3@'x;
  sa:raze a where e:0=mod[;2] til count x;
  hb:raze[a where not e][;1 0 1];
  any hb in\:sa
  } each r
/260
