// --- Day 23: Experimental Emergency Teleportation ---

/ read input
i:{"J"$","vs x inter .Q.n,",-" } each read0 `:input/23.txt
/ index of strongest nanobot
si:i[;3]?max i[;3]

sum i[si;3]>=sum each abs i[si;0 1 2]-/:i[;0 1 2]
/ 294
