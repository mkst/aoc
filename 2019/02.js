// --- Day 2: 1202 Program Alarm ---

const fs = require('fs')

function op (i, n, v) {
  i[1] = n
  i[2] = v
  let idx = 0
  while (idx < i.length) {
    if (i[idx] === 1) {
      i[i[idx + 3]] = i[i[idx + 1]] + i[i[idx + 2]]
    } else if (i[idx] === 2) {
      i[i[idx + 3]] = i[i[idx + 1]] * i[i[idx + 2]]
    }
    idx += 4
  }
  return i[0]
}

fs.readFile('input/02a.txt', { encoding: 'utf-8' }, (err, data) => {
  if (!err) {
    const code = data.split(',').map(Number)

    console.log(op([...code], 12, 2))

    const target = 19690720
    let noun = 0
    let verb = 0

    let res
    while ((res = op([...code], ++noun, 0)) < target) {}
    noun--
    while ((res = op([...code], noun, ++verb)) !== target) {}

    console.log(100 * noun + verb)
  }
})
