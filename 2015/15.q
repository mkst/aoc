/--- Day 15: Science for Hungry People ---

/ all y-digit combinations that add up to x
combos:{ { $[z=count x;enlist x,y;raze .z.s[;;z]'[x,/:t;y - t:til 1+y]] }[();x;y-1] }

ingredients:`ing xkey flip `ing`cap`dur`fla`tex`cal!("s i i i i i";" ")0: except[;":,"] each read0 `:input/15.txt
recipes:flip (0!ingredients)[`ing]!flip combos[100;4]

max { (a~abs a)*prd 4#a:sum { y*ingredients x }'[key x;value x] } peach recipes
/222870
max { (a[`cal]=500)*(a~abs a)*prd 4#a:sum { y*ingredients x }'[key x;value x] } peach recipes
/117936
