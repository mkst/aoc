// --- Day 7: Camel Cards ---

c:{ "*J"$ " " vs x } each read0 `:input/07.txt

score:{[x]
  $[1 = count distinct x;
    6; // 5 of a kind
    4 = max count each group x;
    5; // 4 of a kind
    2 = count distinct x;
    4; // full house
    3 = max count each group x;
    3; // 3 of a kind
    3 = count group x;
    2; // 2 pairs
    2 = max count each group x;
    1; // 1 pair
    0  // high card
  ]
 }

score2:{[x]
  // no jokers
  if[0 = sum "J"=x;
    :score[x]
  ];

  o: x except "J";

  $[5 = sum "J"=x;
    6; // 5 of a kind JJJJJ
    4 = sum "J"=x;
    6; // 5 of a kind JJJJa
    3 = sum "J"=x;
    $[1 = count distinct o;
      6;  // 5 of a kind JJJaa
      5]; // 4 of a kind JJJab
    2 = sum "J"=x;
    $[1 = count distinct o;
      6; // 5 of a kind JJaaa
      2 = count distinct o;
      5; // 4 of a kind JJaab
      3]; // 3 of a kind JJabc
    // else... 1 joker
    $[1 = count distinct o;
      6; // Jaaaa -> 6 (5 of a kind)
      3 = max count each group o;
      5; // Jaaab -> 5 (4 of a kind)
      2 = count distinct o;
      4; // Jaabb -> 4 (full house)
      3 = count distinct o;
      3; // Jaabc -> 3 (3 of a kind)
      1] // Jabcd -> 1 (1 pair)
    ]
 }

rnk: { (100000000000 * score x) + sum 1000000000 10000000 100000 1000 1 * "23456789TJQKA"?x }
sum c[;1] * 1 + rank rnk each c[;0]
/ 248569531

rnk2: { (100000000000 * score2 x) + sum 1000000000 10000000 100000 1000 1 * "J23456789TQKA"?x }
sum c[;1] * 1 + rank rnk2 each c[;0]
/ 250382098
