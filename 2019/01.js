// --- Day 1: The Tyranny of the Rocket Equation ---

const fs = require('fs')

function fuel (x) {
  return Math.max(0, Math.floor(x / 3) - 2)
}

function sum (x, y) {
  return x + y
}

fs.readFile('input/01.txt', { encoding: 'utf-8' }, (err, data) => {
  if (!err) {
    const lines = data
      .split('\n')
      .filter(x => x.length)
      .map(Number)

    const p1 = lines.map(fuel).reduce(sum)
    const p2 = lines.map(x => {
      let f = 0
      while ((x = fuel(x)) > 0) {
        f += x
      }
      return f
    }).reduce(sum)

    console.log(p1)
    console.log(p2)
  }
})
