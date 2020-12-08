//--- Day 8: Handheld Halting ---

f:{[i;ptr;acc]
  op:first l:i ptr;
  arg:last l;
  $[`acc~op;
    (ptr+1;acc+arg);
    `jmp~op;
    (ptr+arg;acc);
    `nop~op;
    (ptr+1;acc);
    (ptr;acc)
  ]
  };

g:{[i;v_pa]
  v:first v_pa;
  pa:last v_pa;
  $[first[res:f[i] . pa] in v;
    (v;pa);
    (v,:first res;res)
    ]
  };

h:{[i] last g[i;]/[(();0 0)] };

last h inst:flip "SJ"$flip" "vs'read0 `:input/08.txt
/1420

jmps:h peach { @[x;y;:;(`jmp;x[y] 1)] }[inst;] each where `nop=inst[;0]
nops:h peach { @[x;y;:;(`nop;x[y] 1)] }[inst;] each where `jmp=inst[;0]
last last asc jmps,nops
/1245
