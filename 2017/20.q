/--- Day 20: Particle Swarm ---

t:{ `p`v`a!3 cut "J"$","vs x except "pva<>= " } each read0 `:input/20.txt;

exec first id from `a xasc update id:i, sum each abs each a from t
/376

count {select from (update p:p+'v from update v:v+'a from x) where 1=(count;i) fby p}/[50;t]
/ 574
