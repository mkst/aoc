/ --- Day 21: RPG Simulator 20XX ---

W:`Dagger`Shortsword`Warhammer`Longsword`Greataxe
A:`Leather`Chainmail`Splintmail`Bandedmail`Platemail`NoArmour
R:`Damage1`Damage2`Damage3`Armor1`Armor2`Armor3`NoRing`NoRing2
I:+`Name`Cost`Damage`Armor!(W,A,R;8 10 25 40 74,13 31 53 75 102 0,25 50 100 20 40 80 0 0;4 5 6 7 8, 0 0 0 0 0 0, 1 2 3 0 0 0 0 0;0 0 0 0 0, 1 2 3 4 5 0, 0 0 0 1 2 3 0 0)

Rc:R@?^'{[x] ,/{[x;y] y,'((),y)_x}[x;]'x}@!#R / unique ring combinations

cross:{[x;y] ,/x,\/y}
c:cross[cross[W;A];Rc] / all item combinations

A:()!()
ct:{[x]
  A[`L]:x / global var hack
  s:select from I where Name in A[`L]
  select sum Cost, sum Armor, sum Damage from s}'c
ct:ct@<*+`Cost#ct / sort by ascending cost

e:"i"$last'" "\'0:"input/21.txt" / enemy (hp;damage;armor)

t:{[x] d:last x;$[|/0>*'x;x;(d-(1|a[1]-d 2;0;0);a:*x)]} / take turn
g:{[x;y] ~2 mod#t\:(x;y)}[;e]'100,'.'`Damage`Armor#ct / player has 100 hp

*`Cost#ct@*&g     / cheapest win
*`Cost#ct@last&~g / priciest loss
