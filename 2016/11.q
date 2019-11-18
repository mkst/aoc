/--- Day 11: Radioisotope Thermoelectric Generators ---

elevator:{[STATE;FROM;TO;ITEM]
  / sort keeps visited sane
  STATE[FROM]:asc STATE[FROM] except ITEM;
  STATE[TO]:asc STATE[TO],ITEM;
  / return and include new level
  (STATE;TO)
 };

combos:{ distinct asc each {raze y,/:'x except/:y}[x;]/[1;] x};
validate:{ all { $[count A:x inter .Q.A; all (x inter .Q.a) in lower A;1b] } each x };

opt:{[VISITED;STATE;LEVEL;STEPS]
  / potential moves
  opts:();
  / items on current floor
  s:STATE LEVEL;
  / not at the top floor, so go up
  if[LEVEL<3;
    / singles:
    opts,:elevator[STATE;LEVEL;LEVEL+1;] each s;
    / doubles:
    if[1<count s;
      opts,:elevator[STATE;LEVEL;LEVEL+1;] each combos s
    ];
  ];
  / not at the bottom floor, so go down
  if[LEVEL>0;
    / singles:
    opts,:elevator[STATE;LEVEL;LEVEL-1;] each s;
    / doubles:
    if[1<count s;
      opts,:elevator[STATE;LEVEL;LEVEL-1;] each combos s
    ];
  ];
  / clear invalid
  opts:opts where validate each opts[;0];
  / clear already visited
  opts:opts except VISITED;
  / return
  opts,'STEPS+1
  };

f:{[STATE]
  / number of items to move to top floor
  target:count raze STATE;
  / work to be done, start on ground floor (0) having taken no steps
  queue:enlist (STATE;0;0);
  / work done
  visited:enlist (STATE;0);
  / whilst there is work to be done...
  while[count queue;
    / re-order by target state (more items towards the higher floors)
    queue:queue idesc { reverse count each x } each queue[;0];
    / pop first
    item:first queue;
    queue:1 _ queue;
    / determine new options
    o:opt[visited;] . item;
    / are we done?
    $[any r:target = {count last first x} each o;
      / we are done!
      :last last o where r;
      [
        / add any (new) options to queue
        queue,:o except queue;
        / treat as done
        visited,:2#item;
      ]
      ]
    ]
  };

/ generator is uppercase, microchip is lowercase
f asc each ("TtPS";"ps";"OoRr";"")
/ 31
f asc each ("dDeETtPS";"ps";"OoRr";"")
/ 55
