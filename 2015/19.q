/--- Day 19: Medicine for Rudolph ---

r:r _ first where ""~/:r:read0 `:input/19.txt
s:flip string ("s s";" ")0:-1_r

count distinct raze { {[x;y;z;l] x:@[string x;y;:;z];raze x _/c#(y+c:count[l]-1) }[x;;z;y] each ss[x;y] }[last r;].'s
/518

/ generate descending order
s:s idesc count each s[;1]

found:0b;

res:raze {[MOLECULE;TARGET;SOURCE;COUNT]
  if[found;:0W];
  // target molecule reached
  if[MOLECULE~1#"e";
    found::1b;
    :COUNT
    ];
  // went to e too soon
  if["e" in MOLECULE;
    :0W;
    ]
  // no more transformations left!
  if[0=count t:ss[MOLECULE;SOURCE];
    :0W
    ];
  // make all replacements
  m:ssr[MOLECULE;SOURCE;TARGET];
  // recurse with each remaining option
  raze .z.s[m;;;COUNT+count t].'s _ first where s~\:(TARGET;SOURCE)
  }[last r;;;0].'s

first asc res
/200
