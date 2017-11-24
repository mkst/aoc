/--- Day 15: Science for Hungry People ---

/crunch all combinations that add up to 100 (using base 98)
combos:4 cut raze{ $[100=sum x:98 98 98 98 vs x;x;()] } peach til -912380+98*98*98*98;

ingredients:`ing xkey flip `ing`cap`dur`fla`tex`cal!("s i i i i i";" ")0: except[;":,"] each read0 `:input/15.txt;
recipes:flip (0!ingredients)[`ing]!flip combos;

max { (a~abs a)*prd 4#a:sum { ingredients[x]*y }'[key x;value x]} each recipes
/222870
max { (a[`cal]=500)*(a~abs a)*prd 4#a:sum { ingredients[x]*y }'[key x;value x]} each recipes
/117936