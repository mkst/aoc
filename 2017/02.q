/--- Day 2: Corruption Checksum ---

sum { (max x) - min x } each r:"J"$ "\t" vs'read0 `:input/02.txt
/45351
sum { (%) . x (where 2=sum a),where 2=sum flip a:0=x mod/:x } each r
/275