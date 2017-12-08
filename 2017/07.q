/ --- Day 7: Recursive Circus ---

t:`n xkey flip `n`w`t`p!"sjjs"$\:(); / node, weight, total, parent

{
  x:" " vs x except ",()";
  nd:`$x 0;   / node
  wt:"J"$x 1; / weight
  `t upsert (nd;wt;0;t[nd;`p]);
  if[2<count x;
    { `t upsert (y;t[y;`w];0;x) }[nd;] each `$3_x;
  ]
  } each read0 `:input/07.txt;

/ find node without a parent
exec first n from t where null p
/`hlqnsbe

{
  wt:t[x;`w];
  if[count s:select from t where p=x;
    wt+:sum .z.s each exec n from s;
    update t:wt from `t where n=x
    ];
  :wt
  }`;

/ delete leaves
s:delete from t where t=0;
/ add eq column, true if all weights are equal
s:select n, t, eq:{ all 0=1_deltas x }t by p from s;
/ remove entries with equal weights
s:select from s where not eq;
/ remove entries that contain a parent
s:select from s where not any each n in\:raze exec p from s;
/ find the node with the difference and what the difference is
s:first exec { (first x where d=m;m:max 1 _ d:deltas y) }'[n;t] from s;
/ calculate the correct weight
neg[last s]+first exec w from t where n=first s
/1993