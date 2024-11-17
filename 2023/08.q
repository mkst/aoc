// --- Day 8: Haunted Wasteland ---

/ helpers from 2019.12
gcd_helper:{$[0=m:mod[x;y];y;.z.s[y;m]]};
gcd:{$[any 0=(x;y);x|y;gcd_helper[x|y;x&y]]};
lcm:{div[x*y;gcd[x;y]]};

i: "R"=first r:read0 `:input/04.txt
network: { x!flip (y;z) } . ("s ss"; " ") 0:{ x inter .Q.A," " } each 2 _ r

f:{[x]
    :$["Z" = last string r:network[x[1]] first x[2];
        :x;
        :(x[0] + 1 ; r ; 1 _ x[2]);
        ];
    };
g:{ first f/[(1; x; 25000#i)] }

g `AAA
/ 14257

res:g peach k where "Z"=(string k:key network)[;2]
lcm/[res]
/ 16187743689077
