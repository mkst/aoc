/--- Day 22: Sporifica Virus ---

d:"U"                          / initial direction
l:12 12                        / starting location
i:0                            / infected count
g:(`u#enlist 0N 0N)!enlist " " / initialise grid to null

(til count r){ {g[(x;y)]:z}'[x;til count y;y] }'r:read0 `:input/22.txt;

On:()!();
On["#"]: {
  d::"RLUD""UDLR"?d; / turn right
  g[l]:"."           / clean
  };
On[" ."]:{
  d::"LRDU""UDLR"?d; / turn left
  g[l]:"#";          / infect
  i+:1               / infected++
  };

move:{ l+:(1 0;-1 0;0 -1; 0 1)"DULR"?d };
burst:{ On[g[l]][]; move[] };

do[10000;burst[]];
i
/5433

d:"U"                          / re-initialise direction
l:12 12;                       / re-initialise starting location
i:0                            / re-initialise infected count
g:(`u#enlist 0N 0N)!enlist " " / re-initialise grid to null

(til count r){ {g[(x;y)]:z}'[x;til count y;y] }'r; / re-build grid

On["#"]: {
  g[l]:"F";         / flag
  d::"RLUD""UDLR"?d / turn right
  };
On["F"]: {
  g[l]:" ";         / clean
  d::"DURL""UDLR"?d / turn 180
  };
On["W"]:{
  g[l]:"#";         / infect
  i+:1              / infected++
  };
On[" ."]:{
  g[l]:"W";         / weaken
  d::"LRDU""UDLR"?d / turn left
  };

do[10000000;burst[]];
i
/2512599