/--- Day 25: The Halting Problem ---

s:`A
p:0
t:(`u#enlist 0N)!(enlist 0N)
On:(`u#enlist`)!enlist[(::)]

On.A:{ $[null t p;[t[p]:1;p+:1;s::`B];[t[p]:0N;p-:1;s::`D]] };
On.B:{ $[null t p;[t[p]:1;p+:1;s::`C];[t[p]:0N;p+:1;s::`F]] };
On.C:{ $[null t p;[t[p]:1;p-:1];              [p-:1;s::`A]] };
On.D:{ $[null t p;       [p-:1;s::`E];        [p+:1;s::`A]] };
On.E:{ $[null t p;[t[p]:1;p-:1;s::`A];[t[p]:0N;p+:1;s::`B]] };
On.F:{ $[null t p;[p+:1;       s::`C];[t[p]:0N;p+:1;s::`E]] };

do[12302209;On[s][]];
sum t
/633