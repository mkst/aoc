// --- Day 5: Hydrothermal Venture ---

i:(2 cut) each raze each "J"$","vs''" -> "vs/:read0 `:input/05.txt

rng:{ $[0<d:y - x; x + til 1 + d; 0>d; reverse y + til 1 + neg d; x] }

f:{[x;y;diag]
    $[((x 0) = y 0) or (x 1) = y 1;
        (,\:/:). rng ./:flip (x;y);
        diag;
        (,'). rng ./:flip (x;y);
        ()]
    }

sum 1<count each group raze f[;;0b] .'i
/6113

sum 1<count each group raze f[;;1b] .'i
/20373
