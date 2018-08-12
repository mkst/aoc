/ --- Day 21: RPG Simulator 20XX ---

/
Weapons:    Cost  Damage  Armor
Dagger        8     4       0
Shortsword   10     5       0
Warhammer    25     6       0
Longsword    40     7       0
Greataxe     74     8       0

Armor:      Cost  Damage  Armor
Leather      13     0       1
Chainmail    31     0       2
Splintmail   53     0       3
Bandedmail   75     0       4
Platemail   102     0       5

Rings:      Cost  Damage  Armor
Damage +1    25     1       0
Damage +2    50     2       0
Damage +3   100     3       0
Defense +1   20     0       1
Defense +2   40     0       2
Defense +3   80     0       3
\

W:`Dagger`Shortsword`Warhammer`Longsword`Greataxe
A:`Leather`Chainmail`Splintmail`Bandedmail`Platemail`NoArmour
R:`Damage1`Damage2`Damage3`Defence1`Defence2`Defence3`NoRing`NoRing2

I:flip `Name`Cost`Attack`Defence!
  (W,A,R;
   8 10 25 40 74,13 31 53 75 102 0,25 50 100 20 40 80 0 0;
   4  5  6  7  8, 0  0  0  0   0 0, 1  2   3  0  0  0 0 0;
   0  0  0  0  0, 1  2  3  4   5 0, 0  0   0  1  2  3 0 0);

/ ring combos
Rc:distinct asc each raze { { y,/:x except y }[x;] each x } R

/ item combinations
combos:W cross A cross Rc

/ item costs
combosTable:`Cost xasc { exec sum Cost, sum Defence, sum Attack from I where Name in x } each combos

/ generate Enemy from puzzle input:
E:`Defence`Attack`HP!reverse "J"$last each": "vs/:read0 `:input/21.txt
E[`Player]:0

f:{
  a:x 0; / attacker
  d:x 1; / defender
  d[`HP]-:1|a[`Attack]-d`Defence; / attackers cause at least 1 damage
  (a;d) / return updated values
  };

f2:{
  x[`HP`Player]:100 1; // Player has 100 HP
  / play until someone dies
  res:raze { reverse f x }\[{ all 0<x[;`HP] };(x;E)];
  / return victory condition
  0=first exec Player from res where HP < 1
  };

r:f2 each `Defence`Attack#combosTable;

exec first Cost from combosTable where r
/91
exec last Cost from combosTable where not r
/158
