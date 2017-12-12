/--- Day 11: Corporate Policy ---

increment:{.Q.a 26 vs 1+26 sv -97+"j"$x}
checkpass:{
  $[not any "iol" in x;
    $[1 in 1_deltas where 1=deltas "j"$x;
      $[1<sum{ 1 in 1_deltas where x} each .Q.a=\:x;
        1b;
        0b];
      0b];
    0b]
 }

0N!res:{ increment x }/[{ not checkpass x };] first read0 `:input/11.txt;
/vzbxxyzz
{ increment x }/[{ not checkpass x };increment res]
/vzcaabcc