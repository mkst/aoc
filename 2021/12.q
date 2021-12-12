// --- Day 12: Passage Pathing ---

i:(!). flip raze (::;reverse each)@\:`$"-"vs'read0 `:input/12.txt

lu:{ value[x] where key[x]=y }
fs:{ x where (not x=`end) and any each string[x] in\:.Q.a };

f:{
    y,:x; // add current cave to visited
    $[x=`end;
        enlist y; // finished
        [
            sc:$[z or ((any 2=count each group sc) or 0=count sc:fs y); // filter visited to identify small caves
                enlist sc;                                              // either part 1 or already visited 2 small caves or no small caves
                sc except/:sc                                           // generate small cave combos
                ];
            pc:lu[i;x];                     // possible next caves
            pc:pc where not pc=`start;      // never return to start
            pc:raze pc except/:sc;          // possible caves except visited small caves
            raze .z.s[;y;z] each distinct pc  // recurse...
        ]
        ]
  }

count raze f[;();1b] peach s:lu[i;`start]
/4707
count raze f[;();0b] peach s
/130493
