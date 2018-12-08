// --- Day 7: The Sum of Its Parts ---

t:select raze b by a from flip `a`b!(" c     c";" ")0:`:input/07.txt

r:{ x,first $[count ex:exec a from t where not a in x, not a in\:raze b;ex;exec b from t where not a in (-1_x)] }/[""];r
/"BFGKNRTWXZIHUMPQLVOYJACDSE"

/ offset & workers
offset:60;workers:5
/ create worker queues
W:workers#enlist"";
/ queue of work
q:(offset+1+.Q.A?r)#'r
/ done, in progress
dn:ip:""
/ next job:
nj:{[]
  n:first (exec a from t where not a in dn, not a in\:raze b) except ip;
  / last item in the queue and nothing else in progress
  $[(0=count ip)&(1=count q)&null n;first (first q) except ip;n]
  };
/ counter
i:0
/ process work
while[count[dn]<count r;
  / update in-progress, done
  ip:ip except dn,:raze W where 1=count each W;
  / load new work for free workers
  W:{[x]
    if[(not null n:nj[])&0=count x;
      x:q w:first where n in/:q;
      / update queue
      q::q _ w;
      / update in-progress
      ip,:n
    ];
    x
    } each 1_'W;
  / visualisation
  /-1@ raze "."^(1#'W);
  i+:1
  ];

-1+i
/1163
