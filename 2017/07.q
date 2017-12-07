/ --- Day 7: Recursive Circus ---

t:`node xkey flip `node`weight`parent!"sjs"$\:();

{ if[x like "*->*";
    p:`$1_'"," vs last x:"->" vs x;
    n:`$first " " vs x:-1_first x;
    { `t upsert (y;first exec weight from t where node=y;x) }[n;] each p
    ];
  w:"J"$last x:" " vs x except "()";
  n:`$first x;
  `t upsert (n;w;first exec parent from t where node=n)
  } each read0 `:input/07.txt;

exec first node from t where null parent
/`hlqnsbe

weights:`node xkey flip `node`nweight!"sj"$\:();

calcweights:{
  $[count s:select from t where parent = x;
    [`weights insert (x;w:(first exec weight from t where node=x)+sum .z.s each exec node from s);w];
    first exec weight from t where node=x]
  }

calcweights `;

s:delete eq from select from (select node, parent, nweight, eq:{ all 0=1_deltas x } each nweight from select node, nweight by parent from weights lj t) where not eq;
s:select node, nweight from s where not any each node in\:raze exec parent from s;
s:first exec { (first x where d=m;m:max 1 _ d:deltas y) }'[node;nweight] from s;
neg[last s]+first exec weight from t where node=first s
/1993