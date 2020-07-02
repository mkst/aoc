/ --- Day 22: Wizard Simulator 20XX ---

Spells:+`Name`Cost`Turns`Damage`Heal`Mana!(`MagicMissile`Drain`Shield`Poison`Recharge
    53 73 113 173 229 / Cost
    1 1 6 6 5         / Turns
    4 2 0 3 0         / Damage
    0 2 0 0 0         / Heal
    0 0 0 0 101)      / Mana Boost

D:()!() // hack

turn:{[P;E;A;S;H]
  / hard mode
  $[H;P[`hp]-:1;()]
  d:1>P[`hp]

  / === PLAYER TURN ===
  / cast new spell
  D[`spell]:S
  A,:s:select from Spells where Name=D`spell
  P[`mana]-:first first select Cost from s
  / apply active spells
  a:select from A where Turns > 0
  E[`hp]-:first select sum Damage from a
  P[`hp]+:first select sum Heal from a
  P[`mana]+:first select sum Mana from a
  / reduce turns
  A:select Name, Cost, Turns-1, Damage, Heal, Mana from A

  / === ENEMY TURN ===
  / apply active spells
  a:select from A where Turns > 0
  E[`hp]-:first select sum Damage from a
  P[`mana]+:first select sum Mana from a
  / active shield?
  P[`hp]-:1|E[`damage] - $[#select from a where Name=`Shield;7;0]
  / reduce turns
  A:select Name, Cost, Turns-1, Damage, Heal, Mana from A
  / active spells
  D[`active]:*+`Name#select from A where Turns > 0
  D[`mana]:P[`mana]
  / available spells
  as:select from Spells where ~Name in D`active
  as:*+`Name#select from as where ~Cost > D`mana

  / return; 1=victory, 0=loss, -1=continue
  $[(~d)&1>E`hp
      (1;*+select sum Cost from A)
    d|1>P`hp
      (0;0)
      (-1;(P;E;A),/as)]}

f:{[x;y]
  b:first x  / best cost
  q:last x   / remaining queue
  i:first q  / pop
  a:i 2      / active spells

  $[0=#q
      (b;q)
    b<*+select sum Cost from a
      (b;1 _ q)
    1=first res:turn . i,y
      (b&res 1;1 _ q)
    0=first res
      (b;1 _ q)
      (b;res[1],1 _ q)]}

e:`hp`damage!"i"$last'" "\'0:"input/22.txt"

first f[;0b]/:(0w;s:({hp:50;mana:500};e;0#Spells),/*+`Name#Spells)
first f[;1b]/:(0w;s)
