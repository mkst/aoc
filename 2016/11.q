/--- Day 11: Radioisotope Thermoelectric Generators ---

move:{[STATE;FROM;TO;ITEM]
  / sort keeps states sane
  STATE[FROM]:asc STATE[FROM] except ITEM;
  STATE[TO]:asc STATE[TO],ITEM;
  / return and include new level
  (STATE;TO)
 };

combos:{ distinct asc each {raze y,/:'x except/:y}[x;]/[1;] x}
validate:{ all { $[count A:x inter .Q.A; all (x inter .Q.a) in lower A;1b] } each x }

opt:{[STATE;LEVEL;STEPS]
  / potential moves
  opts:();
  / items on current floor
  s:STATE LEVEL;
  / not at the top floor, so go up
  if[LEVEL<3;
    / singles:
    opts,:move[STATE;LEVEL;LEVEL+1;] each s;
    / doubles:
    if[1<count s;
      opts,:move[STATE;LEVEL;LEVEL+1;] each combos s
    ];
  ];
  / not at the bottom floor, so go down
  if[LEVEL>0;
    / singles:
    opts,:move[STATE;LEVEL;LEVEL-1;] each s;
    / doubles:
    if[1<count s;
      opts,:move[STATE;LEVEL;LEVEL-1;] each combos s
    ];
  ];
  / clear invalid
  opts:opts where validate each opts[;0];
  / clear already visited
  opts:opts except states;
  / return
  opts,'STEPS+1
  };

/
The first floor contains a thulium generator, a thulium-compatible microchip, a plutonium generator, and a strontium generator.
The second floor contains a plutonium-compatible microchip and a strontium-compatible microchip.
The third floor contains a promethium generator, a promethium-compatible microchip, a ruthenium generator, and a ruthenium-compatible microchip.
The fourth floor contains nothing relevant.
===
An elerium generator.
An elerium-compatible microchip.
A dilithium generator.
A dilithium-compatible microchip.
\

/ generator is uppercase, microchip is lowercase
state:asc each ("dDeETtPS";"ps";"OoRr";"")
target:count raze state;

level:steps:0

states:`u#()
states,:enlist (state;level)

queue:()
queue,:enlist (state;level;steps)

while[count queue;
  / clear dupes
  queue:distinct queue;
  / re-order by target state (more items towards the top floor)
  queue:queue idesc { count last x } each queue[;0];
  / pop first
  item:first queue;
  queue::1 _ queue;
  / determine next possible steps
  o:opt . item;

  $[any r:target = {count last first x} each o;
    [
      // we are done
      res::last o where r;
      queue::()
    ];
    [
    / add options to queue
    queue,:o;
    / treat as done
    states,:2#item;
    ]
    ];
  ];

last res
/ 31
/ 55
