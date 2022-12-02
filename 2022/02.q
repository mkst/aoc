// --- Day 2: Rock Paper Scissors ---

S:`r`p`s!1 2 3    // choice score
G:`l`d`w!0 3 6    // game score

O:`A`B`C!`r`p`s   // opponent
E:`X`Y`Z!`r`p`s   // elf strategy
D:`X`Y`Z!`l`d`w   // desired outcome

B:`r`p`s!`s`r`p   // beats
L:value[B]!key[B] // loses to


rps:{[x;y;z]
  o:O[x];
  d:D[y];
  e:$[z;
    $[d~`d;
      o;  // force draw
        d~`l;
        B o; // force elf loss
        L o  // force elf win
    ];
    E[y]  // part 1
    ];

  r:$[e~o;
    `d;   // draw
    e~B o;
      `l; // elf loss
      `w  // elf win
    ];
  :G[r] + S e;
  };


sum rps[;;0b].'i:`$" "vs'read0 `:input/02.txt
/14264
sum rps[;;1b].'i
/12382
