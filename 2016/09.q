/--- Day 9: Explosives in Cyberspace ---

f:{[x;r]
  i:0;
  l:0;
  while[i < count x;
    $["("=x i;
      [
        ml:first ss[i _ x;")"];
        m:"J"$"x" vs x i + 1 + til ml - 1;
        s:first m;
        l+:m[1]*$[r;.z.s[x i + ml + 1 + til m[0];r];m[0]];
        i+:ml + s + 1
      ]
      ;
      [
        l+:1;
        i+:1
      ]
      ];
   ];
  l
  };

f[;0b] i:first read0 `:input/09.txt
/ 98135
f[;1b] i
/ 10964557606
