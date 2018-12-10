/ --- Day 9: Marble Mania ---

r:"J"$@[;0 6]" "vs first read0 `:input/09.txt

players:r 0
lastmarble:r 1 // 100*
marbles:enlist 0
marble:1
marble_idx:0

scores:players#0

now:.z.p;
while[marble < lastmarble;
  / process marble
  $[0=marble mod 23;
    [
     / 7 marbles counter-clockwise
     marble_idx-:7;
     / handle negative case
     if[marble_idx < 0;
       marble_idx+:count marbles
       ];
     / add (23) marble and (-7) marble to score
     scores[marble mod players]+:marble+marbles marble_idx;
     / drop marble
     marbles:marbles _ marble_idx
    ];
    [
     / place marble
     marble_idx:$[(marble_idx+1)=c:count marbles;
         1;
         2+marble_idx];
     /.log.Inf ("Placing at";i);
     $[marble_idx=c;
       marbles:marbles,marble;
         0=c;
         marbles:marble,marbles;
         marbles:(marble_idx#marbles),marble,marble_idx _ marbles
       ]
    ]
  ];
  marble+:1
  ];

max scores
/ 386018
.z.p - now
/3085518618
