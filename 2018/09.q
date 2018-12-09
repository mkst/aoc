/ --- Day 9: Marble Mania ---

r:"J"$@[;0 6]" "vs first read0 `:input/09.txt

players:r 0
lastmarble:r 1
marbles:enlist 0
currentmableindex:0
remainingmarbles:1 + til lastmarble

scores:(til players)!players#0
step:0

while[count remainingmarbles;
  / marble to play
  m:first remainingmarbles;
  / remove from remaining marbles
  remainingmarbles: 1 _ remainingmarbles;
  / process marble
  $[0 = m mod 23;
    [
     / add (23) marble to score
     scores[step mod players]+:m;
     / 7 marbles counter-clockwise
     ci:currentmableindex - 7;
     / handle negative case
     if[ci < 0;ci:(count marbles) + ci];
     / locate marble
     m2:marbles ci;
     / add (new) marble to score
     scores[step mod players]+:m2;
     / drop marble
     marbles:marbles _ ci;
     / set current marble
     currentmableindex:ci
    ];
    [
     / place marble
     i:1 + (currentmableindex + 1) mod c:count marbles;
     /.log.Inf ("Placing at";i);
     $[0=i;
       marbles:m,marbles;
       i=c;
         marbles,:m;
         marbles:(i#marbles),m,i _ marbles
       ];
      currentmableindex:i
    ]
  ];

  step+:1
  ];

max scores
/ 386018
step
