// --- Day 12: Subterranean Sustainability ---

i:read0 `:input/12.txt
padding:240
state:(padding#0),@[(count is)#0;where "#"=is:(" "vs i 0) 2;:;1],(padding#0)
rules:raze { $["#"=first (x:" "vs x) 2;enlist -2+where "#"=x 0;()] }each 2_ i

gen:0
states:();

while[gen < 180;
  states,:enlist state;
  state:0,"j"${[pot]
    rp:rules where $[state pot;0 in/:rules;not 0 in/:rules];
    re:(-2+til 5)except/:rp;
    r:(min each -2<=pot+re)&(not max each state pot+re)&min each state each pot+rp;
    any r
  } each 1 + til count state;
  gen+:1
  ];

sum neg[padding]+where states 20
/ 3051
sum (50000000000-gen)+neg[padding]+where state
/1300000000669
