let n = 8 //Iterations
let r = 180 //Roughness (Higher = rougher terrain, recommended = 120 - 200)

let o = 0
let p = []

function sum(a) {
  let s = 0
  for(let i = 0; i < a.length; i++) {
    s += a[i]
  }
  return s
}

function setup() {
  createCanvas(800, 800)
  
  let l = []
  for(let i = 0; i < pow(2, n) + 1; i++) {
    l.push(null)
  }
  for(let i = 0; i < pow(2, n) + 1; i++) {
    p.push(JSON.parse(JSON.stringify(l)))
  }
  
  var xm = 900
  var ym = 900
  
  p[0][0] = [-100, -100]
  p[0][p.length - 1] = [-100, ym]
  p[p.length - 1][0] = [xm, -100]
  p[p.length - 1][p.length - 1] = [xm, ym]
  
  //p[0][0] = [-100, -100]
  //p[0][p.length - 1] = [-100, 900]
  //p[p.length - 1][0] = [900, -100]
  //p[p.length - 1][p.length - 1] = [900, 900]
  
  //Diamond square algorithm
  for(let x = 0; x < n; x++) {
    //Iterations
    let step = pow(2, n - x)
    //Diamond step
    for(let i = 0; i < p.length - 1; i += step) {
      //Rows
      for(let j = 0; j < p[i].length - 1; j += step) {
        //Columns
        
        //Each square produces diamonds
        //p[i][j] represents the top left point of the square
        let pts = []
        
        //Gather points around new point in an array
        pts.push(p[i][j])
        pts.push(p[i + step][j])
        pts.push(p[i][j + step])
        pts.push(p[i + step][j + step])
        
        //Add new point in the middle of square
        p[int(i + step / 2)][int(j + step / 2)] = [sum(pts.map(x => x[0])) / 4 + r * random(pow(2, -x - o), -pow(2, -x - o)), sum(pts.map(x => x[1])) / 4 + r * random(pow(2, -x - o), -pow(2, -x - o))]
      }
    }
    //Square step
    for(let i = 0; i < p.length; i += int(step / 2)) {
      //Rows
      for(let j = -int(step / 2); j < p[i].length - 1; j += int(step / 2)) {
        //Columns
        
        //Each diamond produces new squares
        //p[i][j] represents the left corner of the diamond
        if((j + i) % step == 0) {
          let pts = []

          //Gather points around new point in an array
          if(j < 0) {
            pts.push(p[int(i - step / 2)][int(j + step / 2)])
            pts.push(p[int(i + step / 2)][int(j + step / 2)])
            pts.push(p[i][j + step])
            pts.push([p[i][j + step][0], p[i][j + step][1] * -1])
          } else {
            if(i < p.length - step / 2 && j < p[i].length - step) {
              if(i > 0) {
                pts.push(p[i][j])
                pts.push(p[int(i - step / 2)][int(j + step / 2)])
                pts.push(p[int(i + step / 2)][int(j + step / 2)])
                pts.push(p[i][j + step])
              } else {
                pts.push(p[i][j])
                pts.push(p[int(i + step / 2)][int(j + step / 2)])
                pts.push(p[i][j + step])
                pts.push([p[int(i + step / 2)][int(j + step / 2)][0] * -1, p[int(i + step / 2)][int(j + step / 2)][1]])
              }
            } else {
              if(i < p.length - step / 2) {
                pts.push(p[i][j])
                pts.push(p[abs(int(i - step / 2))][int(j + step / 2)])
                pts.push(p[int(i + step / 2)][int(j + step / 2)])
                pts.push([p[i][j][0], (p[i][j][1] - xm) * -1 + xm])
              } else if(j < p[i].length - step) {
                pts.push(p[i][j])
                pts.push(p[abs(int(i - step / 2))][int(j + step / 2)])
                pts.push(p[i][j + step])
                pts.push([(p[abs(int(i - step / 2))][int(j + step / 2)][0] - ym) * -1 + ym, p[abs(int(i - step / 2))][int(j + step / 2)][1]])
              } else {
                throw "This should never occur, something is obvously wrong"
              }
            }
          }
          //Add new point in the middle of diamond
          //print(pts)
          p[i][int(j + step / 2)] = [sum(pts.map(x => x[0])) / pts.length + r * random(pow(2, -x - o), -pow(2, -x - o)), sum(pts.map(x => x[1])) / pts.length + r * random(pow(2, -x - o), -pow(2, -x - o))]
        }
      }
    }
  }
  //print(p)
}

function draw() {
  background(255)
  for(let i = 0; i < p.length - 1; i++) {
    for(let j = 0; j < p[i].length - 1; j++) {
      quad(p[i][j][0], p[i][j][1], p[i + 1][j][0], p[i + 1][j][1], p[i + 1][j + 1][0], p[i + 1][j + 1][1], p[i][j + 1][0], p[i][j + 1][1])
    }
  }
}
