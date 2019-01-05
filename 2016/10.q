/--- Day 10: Balance Bots ---

i:" "vs'read0 `:input/10.txt
chk:17 61

/ bots
b:{ til[x]!x#enlist () } max "J"$raze (i where 12=count each i)[;1 6 11]
/ assign chips
{ b[x],:(),y }.'"J"$(i where 6=count each i)[;5 1];
/ create outputs
o:(til count b)!(count b)#enlist ()
/ rules
r:raze { (enlist"J"$first x)!enlist 2 cut 1_x } each (i where 12=count each i)[;1 5 6 10 11]

while[sum t:2=count each b;
  / chips
  c:asc b w:first where t;
  / remove from bot
  b[w]:enlist ();
  / check part 1
  if[c~chk;
    -1@string w
    / 157
    ];
  / reassign chips
  { $["bot"~r[x;y;0];
      b["J"$r[x;y;1]],:c y;
      o["J"$r[x;y;1]],:c y]
  }[w;] each 0 1
 ];

first prd o 0 1 2
/ 1085
