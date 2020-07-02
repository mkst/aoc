/--- Day 23: Opening the Turing Lock ---

f:{[x;y]
  a:y 0;b:y 1;i:x pc:y 2;
  $["hlf"~i 0
      $["a"=*i 1;.5 1 1;1 .5 1]*(a;b;pc+1)
    "tpl"~i 0
      $["a"=*i 1;3 1 1;1 3 1]*(a;b;pc+1)
    "inc"~i 0
      $["a"=*i 1;1 0 1;0 1 1]+(a;b;pc)
    "jmp"~i 0
      (a;b;pc+`i$i 1)
    "jie"~i 0
      (a;b;pc+$[0=2 mod _y@"ab"?*i 1;`i$i 2;1])
    "jio"~i 0
      (a;b;pc+$[1=y@"ab"?*i 1;`i$i 2;1])
      (a;b;pc)]}

@[;1]@ f[p:{[x] " "\",+"_x}'0:"input/23.txt"]/:0 0 0
@[;1]@ f[p]/:1 0 0
