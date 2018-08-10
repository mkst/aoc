/--- Day 12: JSAbacusFramework.io ---

f:{
  // check type of what we have
  t:type x;
  if[t=0h; // mixed list
    :raze .z.s[;y] each x
    ];
  if[t=98h; // table
    :raze .z.s[;y] each flip x
    ];
  if[t=99h; // dictionary
    :$[y and any "red"~/:v:value x;
      0;
      raze .z.s[;y] each v
      ]
    ];
  if[t in -9 9h; // float
    :x
    ];
  // else
  0f
 }

sum f[;0b] j:.j.k first read0 `:input/12.txt
/191164f

sum f[;1b] j
/87842f
