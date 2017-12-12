/--- Day 13: Knights of the Dinner Table ---

a:`g`n`h xcols flip `g`h`n!("s  i      s";" ") 0: { -1_ssr[x;"lose ";"lose -"]} each read0`:input/13.txt

combos:{ (1+count x)#'{raze y,/:'x except/:y}[x;]/[count[x]-1;x] }
arrange:{ {[x;y] sum exec h from a where g in (x;y), n in (x;y) }.'-2#'prev\[count[x]-2;x] }

max sum flip arrange each combos distinct (raze/)exec (g;n) from a
/618

/ add myself and re-run
max sum flip arrange each combos `me,distinct (raze/)exec (g;n) from a
/601i