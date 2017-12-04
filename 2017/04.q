/--- Day 4: High-Entropy Passphrases ---

sum { (count distinct x)=count x } each r:" "vs'read0 `:input/04.txt
/386

sum { count[x]=sum sum x{x~y}/:\:x:asc each x} each r
/208