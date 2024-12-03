// --- Day 3: Mull It Over ---

i: raze read0 `:input/03.txt

mul:(
    ("mul([0-9],[0-9])";8);
    ("mul([0-9],[0-9][0-9])";9);
    ("mul([0-9],[0-9][0-9][0-9])";10);
    ("mul([0-9][0-9],[0-9])";9);
    ("mul([0-9][0-9],[0-9][0-9])";10);
    ("mul([0-9][0-9],[0-9][0-9][0-9])";11);
    ("mul([0-9][0-9][0-9],[0-9])";10);
    ("mul([0-9][0-9][0-9],[0-9][0-9])";11);
    ("mul([0-9][0-9][0-9],[0-9][0-9][0-9])";12)
    );

f:{ $[count s:ss[x;first y];(s,\:last y);()] }

muls:raze f[i;] each mul

g:{prd "J"$"," vs inter[;.Q.n,","] x y + til z}

sum g[i;].'muls
/161289189

dos:ss[i;"do()"],\:1b
donts:ss[i;"don't()"],\:0b

first {
    $[-1h~type last z;
        (first[y]                     ;last z);
        (first[y] + last[y] * g[x;]. z;last y)
        ]
    }[i;;]/[(0;1b);] { x iasc x[;0] } muls,dos,donts
/ 83595109
