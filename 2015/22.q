/ --- Day 22: Wizard Simulator 20XX ---

Spells:flip `Name`Cost`Turns`Damage`Heal`ManaBoost!
  (`MagicMissile`Drain`Shield`Poison`Recharge;
   53 73 113 173 229; / Cost
    1  1   6   6   5; / Turns
    4  2   0   3   0; / Damage
    0  2   0   0   0; / Heal
    0  0   0   0 101  / Mana Boost
    );

Player:`HP`Mana!50 500
Enemy:`HP`Damage!"J"$last each ": "vs/:read0 `:input/22.txt

best:0W; / optimisation

f:{[P;E;S;HARD;SPELL]

  // fast-exit if we have spent more than the best result so far
  if[best<exec sum Cost from S;:0W];

  // HARD mode enabled
  if[HARD;
    P[`HP]-:1;
    if[P[`HP] = 0;
      :0W
      ];
    ];

  // add spell to current spells
  S:S upsert select from Spells where Name = SPELL;
  // deduct cost of spell from mana
  P[`Mana]-:exec first Cost from Spells where Name = SPELL;
  // select currently active spells
  e:select from S where Turns > 0;
  // apply effects of current spells
  E[`HP]-:exec sum Damage from e;
  P[`HP]+:exec sum Heal from e;
  P[`Mana]+:exec sum ManaBoost from e;

  // Enemy is dead
  if[E[`HP] <= 0;
    if[best>s:exec sum Cost from S;best::s];
    :s
    ];

  // reduce turns
  S:update Turns:Turns-1 from S;

  // Enemy Turn

  // recurring effects
  e:select from S where Turns > 0;
  E[`HP]-:exec sum Damage from e;
  P[`Mana]+:exec sum ManaBoost from e;

  // is Shield active?
  Shield:$[count select from e where Name = `Shield;7;0];

  // Reduce Player health
  P[`HP]-:1|Enemy[`Damage]-Shield;

  // reduce turns
  S:update Turns:Turns-1 from S;

  // End of Enemy Turn

  // Enemy is dead, return mana spent
  if[E[`HP] <= 0;
    if[best>s:exec sum Cost from S;best::s];
    :s
    ];

  // We are dead
  if[P[`HP] <= 0;
    :0W
    ];

  // check available spells
  as:exec Name from Spells where not Name in (exec Name from S where Turns > 0), Cost <= P`Mana;

  // We cannot afford any spells
  if[0=count as;
    :0W
    ];

  // recurse for each available spell
  raze .z.s[P;E;S;HARD;] each as
  };

min raze f[Player;Enemy;0#Spells;0b;] each exec Name from Spells
/900

best:0W / reset
min raze f[Player;Enemy;0#Spells;1b;] each exec Name from Spells
/1216
