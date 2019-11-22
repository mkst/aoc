/--- Day 23: Opening the Turing Lock ---

f.hlf:{
  r[`$x]:r[`$x] % 2;
  1
  };
f.tpl:{
  r[`$x]*:3;
  1
  };
f.inc:{
  r[`$x]+:1;
  1
  };
f.jmp:{
  -7h$x
  };
f.jie:{
  $[floor[r[`$x]] mod 2;1;-7h$y]
  };
f.jio:{
  $[r[`$x]=1;-7h$y;1]
  };

run:{[a]
  r.a:a;
  r.b:0;
  pc:0;
  while[count[i]>pc+:f . i pc];
  r.b
  };

i:.[" "vs'except[;","]@'read0 `:input/23.txt;(::;0);`$]

run 0
/170
run 1
/247
