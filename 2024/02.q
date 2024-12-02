// --- Day 2: Red-Nosed Reports ---

safe:{
    :$[(x~desc x) | (x~asc x);
        all within[; 1 3] 1 _ abs deltas x;
        0b
        ];
    };

sum safe each i:"J"$" "vs/:read0 `:input/02.txt
/ 510

sum { any safe each x _/: til count x } each i
/ 553


