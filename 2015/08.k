/--- Day 8: Matchsticks ---

d:{[x]
    *(0;" ";0){[x;y]           / (count;previous;skip)
    c:x 0
    $[s:x 2
        (c;y;s-1)
      "\\"=x 1                 / previous was an escape char
        (1+x 0;y;$[y="x";3;1])
        (1+x 0;y;0)]}/:x}

+/{[x] (2+#x)-d x}'i:0:"input/08.txt"
+/{[x] 2++/"\"\\"'x}'i
