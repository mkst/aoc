// --- Day 6: Wait For It ---

f:{ "j"$sum y < { y * x - y }[x;til 1 + x] }

prd f .' flip "J"$ i:{ " " vs trim ssr[;"  ";" "]/[x] } each i:9 _'read0 `:input/06.txt
/ 2269432

f . "J"$raze each i
/ 35865985
