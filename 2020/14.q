//--- Day 14: Docking Data ---

cf:{ distinct asc sum each x where each neg[c]#'0b vs'til "j"$2 xexp c:count x }

// yuck
m:{[x]
  on::"1"=mask:last " = " vs x;
  off::not "0"=mask;
  flt::not "X"=mask;
  float::cf "j"$2 xexp where reverse "X"=mask;
  };

p:{ { "J"$(x inter .Q.n;y) } . " = " vs x }

f:{ mem[first x]:2 sv on|off&-36#0b vs last x }
g:{ $["mask"~4#x;m x;f p x] }

mem:()!()
g each i:read0 `:input/14.txt;
sum mem
/17934269678453

mem:()!()
f:{ mem[(2 sv flt&on|-36#0b vs first x)+/:float]:last x }

g each i;
sum mem
/3440662844064
