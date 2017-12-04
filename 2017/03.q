/--- Day 3: Spiral Memory ---

/A016754
dist:{ last {(1+f;last[x],(1+2*f)*(1+2*f:first x))}/[{[x;y]last last y < x}[x;];(1;enlist 1)] }
/distance from bottom right corner
fbrc:{ $[x=last c:dist x;0;x-last -1_c] }

{(2*-1+count dist x)-mod[fbrc x;floor sqrt x]} 368078
/371