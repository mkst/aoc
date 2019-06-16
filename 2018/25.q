// --- Day 25: Four-Dimensional Adventure ---

C:enlist first w:where each 4>sum@''abs c-\:/:c:"J"$","vs'read0 `:input/25.txt;

{
  $[s:sum a:any each in[;x] each C;
    // known constellation
    $[1=s;
      // add to single constellation
      C[first where a]:distinct C[first where a],x;
      [
        // merge into first found
        C[first where a]:raze C[where a];
        //{ C::C _ x } each reverse 1 _ where a
        C::C _ last where a // only need to merge max of 2 constellations
      ]
    ];
    // else unknown constellation
    C,:x
    ]
 } each w;

count C
// 381
