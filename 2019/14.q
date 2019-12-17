//--- Day 14: Space Stoichiometry ---

i:" => " vs/:i:read0 `:input/14.txt

tab:flip `res`qty`ing!flip (reverse each "JS"$/:" "vs'i[;1]),'flip enlist reverse@''"JS"$/:/:" "vs''", "vs/:i[;0]

leftovers:enlist[`]!enlist 0N

f:{
  ore:0;
  queue:enlist (`FUEL;x);

  while[count queue;
    pop:first queue;
    queue:1_queue;

    item:first pop;
    required:last pop;

    creates:first exec qty from tab where res=item;

    if[(0<leftovers[item]) and leftovers[item]>=left:required mod creates;
      required-:left;
      leftovers[item]-:left
      ];
    leftovers[item]+:(creates - required mod creates) mod creates;

    $[`ORE~item;
      ore+:required;
      [
      ing:raze exec ing from tab where res=item;
      queue,:ing[;0],'(ceiling required%creates)*ing[;1]
      ]
      ]
    ];
  ore
  };

f 1
/301997

TARGET:1000000000000
MIN:1
MAX:TARGET
FUEL:1
LAST:0N

while[LAST<>FUEL;
  LAST:FUEL;
  $[TARGET<o:f FUEL:"j"$.5*MIN+MAX;
    MAX:MIN|FUEL-1;
    MIN:MAX&FUEL+1
    ]
  ];

$[o>TARGET;FUEL-1;FUEL]
/6216589
