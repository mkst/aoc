/--- Day 17: Two Steps Forward ---

g:("#########";
   "#S| | | #";
   "#-#-#-#-#";
   "# | | | #";
   "#-#-#-#-#";
   "# | | | #";
   "#-#-#-#-#";
   "# | | |  ";
   "####### V")

s:(first where any flip w;first where any w:"S"=g)
e:-1+(first where any flip w;first where any w:"V"=g)

c:"UDLR"
d:(-1 0;1 0;0 -1;0 1)

h:(any "bcdef"=\:raze string 2#md5@)

p:first read0 `:input/17.txt

r:{[x;y]
  D:c where any "|-"=\:.[g;] each d+\:x;
  L:c where h y;
  C:D inter L;

  $[x~e;
    enlist y;
    raze .z.s'[x+/:2*d c?C;y,/:C]
    ]
  }[s;p]

(count p)_first r:r iasc count each r
/DDRRUDLRRD
count (count p)_last r
/488
