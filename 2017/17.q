/--- Day 17: Spinlock ---

s:"J"$first read0 `:input/17.txt

spinlock:{ last {
    (p;) $[y=p:1+mod[s+first x;y];
            last[x],y;               / append
            (p#last x),y,p _ last x] / insert
    }/[0;x]
  }

res:spinlock 1 + til 2017
res 1+res?2017
/596

last where 1={ 1+(x+y) mod z }[s]\[til 50000000]
/39051595
