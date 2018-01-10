/ --- Day 7: Recursive Circus ---

t:`n xkey flip `n`w`p!"sjs"$\:(); / node, weight, total, parent

{
  x:" " vs x except ",()";
  n:`$x 0;   / node
  w:"J"$x 1; / weight
  `t upsert (n;w;t[n;`p]); / add node
  `t upsert {[p;n] (n;t[n;`w];p) }[n;] each `$3_x / update parent
  } each read0 `:input/07.txt;

/ find node without a parent
exec first n from t where null p
/`hlqnsbe

/ add column for total weight
update t:0 from `t;

/ calculate total weights
{
  $[count c:exec n from t where p=x;
    t[x;`t]:t[x;`w]+sum .z.s each c;
    t[x;`w]
    ]
  }`;

/delete null node added by recursion
s:delete from t where null n
/ delete leaves
s:delete from s where t = 0
/ add ws column, number of distinct weights
s:select n, w, t, ws:count distinct t by p from s
/ remove entries with correct weights
s:delete from s where ws = 1
/ remove parents of the bad node
s:select from s where not any each n in\:exec p from s
/ locate (badnode;weight_difference)
res:exec {(first x where y=z;(first y where y<>z)-z)}[n;t;first where 1=count each group t] from ungroup s
/ calculate correct weight
(last res)+exec first w from t where n=first res
/1993
