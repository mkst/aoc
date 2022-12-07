// --- Day 7: No Space Left On Device ---

lines:1 _ read0 `:input/07.txt

dirs:enlist[1#`]!enlist 0
cwd:`
isls:0b

while[count line:first lines;
  if[line like "$ cd *";
    isls:0b;
    dir:`$last " " vs line;
    cwd:$[dir~`$"..";
      -1_ cwd;
      cwd,dir
      ];
    ];

  if[isls;
    if[not "dir"~first split:" " vs line;
      size: "J"$ first split;
      {dirs[enlist[x]]+:y}[;size] each ,\[cwd]  // yuck
      ];
    ];

  if[line like "$ ls";
    isls:1b;
    ];

  lines: 1 _ lines;
  ];


sum (value dirs) where (value dirs) < 100000
/1084134
min dirs where dirs > 30000000 - 70000000 - dirs[enlist `]
/6183184
