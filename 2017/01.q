/--- Day 1: Inverse Captcha ---

sum f where f=1 rotate f:-48+"j"$first read0 `:input/01.txt
/1047

/2*sum f where (=) over 2 0N#f
sum f where f=(count[f] div 2) rotate f
/982