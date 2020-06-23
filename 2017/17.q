/--- Day 17: Spinlock ---

first {(x rotate (),y),z}[s:"J"$first read0 `:input/17.txt]/[til 2018]
/596

last where 1={ 1+(x+y) mod z }[s]\[til 50000000]
/39051595
