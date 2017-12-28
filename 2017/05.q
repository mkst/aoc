/ --- Day 5: A Maze of Twisty Trampolines, All Alike ---

ll:l:"J"$read0 `:input/05.txt
p:c:0; / pointer, counter

while[not null j:l[p];l[p]+:1;c+:1;p+:j];c
/343467

l:ll / reset list
p:c:0; / reset pointer, counter

while[not null j:l[p];l[p]+:$[j>2;-1;1];c+:1;p+:j];c
/24774780
