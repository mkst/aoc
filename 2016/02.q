/--- Day 2: Bathroom Security ---

move:{ $[null x . n:y + (-1 0;1 0;0 -1;0 1)"UDLR"?z;y;n] }

k:("     ";
   " 123 ";
   " 456 ";
   " 789 ";
   "     ")

k2:("       ";
    "   1   ";
    "  234  ";
    " 56789 ";
    "  ABC  ";
    "   D   ";
    "       ")

k ./:{ move[x]/[y;z] }[k]\[2 2;] i:read0 `:input/02.txt
/35749
k2 ./:{ move[x]/[y;z] }[k2]\[3 3;i]
/9365C
