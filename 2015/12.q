/--- Day 12: JSAbacusFramework.io ---

flatten:{[x]
  $[0h=t:type[x];
    @[x;where any 0 98 99=\:type each x;.z.s];
    99=t;
      .z.s @[value x;where "red"~/:value x;{ssr[x;"red";"ignore"]}];
      98=t;
        .z.s flip x;
        x]
  }

strip:{[x]
  if[0h=t:type x;
    if[any s:10h=type each x;
      if["ignore" in x where s;
        :0f;
        ];
      ];
    ];
  $[0h=t;
    .z.s each x;
    x]
  };

sumup:{[x]
  sum x where -9=type each x:raze over x
  }

sumup f:flatten j:.j.k first read0 `:input/12.txt
/191164

sumup strip f
/answer is not 88340