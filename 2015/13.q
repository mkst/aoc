/--- Day 13: Knights of the Dinner Table ---

a:`g`n`h xcols flip `g`h`n!("s  i      s";" ") 0: { -1_ssr[x;"lose ";"lose -"]} each read0`:input/13.txt

sw2:{-2#'-2_prev\[x]}

combos:{ raze each { (raze y),/:'x except/:raze y }[x;]/[-1+count x;first x],\:first x }
arrange:{ sum { exec sum h from a where g in x, n in x } each sw2 x }

max arrange peach combos d:distinct raze exec g, n from a
/618
max arrange peach combos d,`me
/601
