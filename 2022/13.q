// --- Day 13: Distress Signal ---

ii:.j.k@''{ 1_'(where 0 = count each x) cut x } enlist[""],i:read0 `:input/13.txt

f:{[left;right]
  if[(-9h ~ type left) and (-9h ~ type right);
    if[left=right;
      :0N
      ];
    :0 1 @ left < right
    ];
  if[(type[left] in 0 9h) and (-9h ~ type right);
    :f[left;enlist right];
    ];
  if[(-9h ~ type left) and (type[right] in 0 9h);
    :f[enlist left;right];
    ];
  if[(type[left] in 0 9h) and (type[right] in 0 9h);
    if[(0 = count left) and (0 = count right);
      :0N;
      ];
    if[(0 = count left);
      :1;
      ];
    if[(0 = count right);
      :0;
      ];
    r:f[first left;first right];
    :$[r~0N;
      f[1 _ left;1 _ right];
      r
      ];
    ];

  '"fail";
  };

sum 1 + where f .'ii
/ 6235

pairs:.j.k each {x where not 0 = count each x} i
prd 0 1 + {1 + sum 0 = f[x;] each y}[;pairs] each (enlist enlist 2f;enlist enlist 6f)
/ 22866
