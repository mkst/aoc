/--- Day 16: Aunt Sue ---

/ initialise empty table
sues:`sue xkey flip `sue`children`cats`samoyeds`pomeranians`akitas`vizslas`goldfish`trees`cars`perfumes!"jjjjjjjjjjj"$\:()
/ add sues 1-->500, null for unknowns
{ `sues upsert x,(count[cols sues]-1)#0N } each 1 + til 500;
/ upsert function
upsue:{ ![`sues;enlist(=;`sue;x);0b;enlist[y]!enlist[z]] };
/ upsert information about each sue
{upsue[first s;].' 2 cut 1_s:(" isisisi";" ")0:{x except ":,"} x } each read0 `:input/16.txt;

0N!exec first sue from sues
    where children in 0N 3,
          cats in 0N 7,
          samoyeds in 0N 2,
          pomeranians in 0N 3,
          akitas in 0N 0,
          vizslas in 0N 0,
          goldfish in 0N 5,
          trees in 0N 3,
          cars in 0N 2,
          perfumes in 0N 1;
/103

0N!exec first sue from sues
    where children in 0N 3,
          (cats > 7) or null cats,
          samoyeds in 0N 2,
          (pomeranians < 3) or null pomeranians,
          akitas in 0N 0,
          vizslas in 0N 0,
          (goldfish < 5) or null goldfish,
          (trees > 3) or null trees,
          cars in 0N 2,
          perfumes in 0N 1;
/405
