
function setup()
{
    createCanvas(600, 600, WEBGL)

    //noLoop()
}

function draw()
{
    randomSeed(51)

    background(200, 100, 100)
    rotateX(PI/3)
    rotateZ(PI/4)
    rotateY(.001*millis())
    translate(width/2, width/2, width/2)
    ortho()

    let levels = 3
    push()
        translate(-width/2, -width/2, -width/2)
        translate(-width/4, -width/4, -width/4)
        //translate(-width/2, -height/2, -width/2)
        scale(.2*width)
        noStroke()//stroke(0)
        fill(0, 0, 255, 50)
        //noFill()
        cantor_dust(levels)
    pop()
}

function cantor_dust(level)
{
    for(let i = 0; i < 3; i++)
    for(let j = 0; j < 3; j++)
    for(let k = 0; k < 3; k++)
    if((i%2 == 0) && (j%2 == 0) && k%2==0 || (i == 1 && j == 1 && k == 1))
    {
        let s = 1 + .2*random()
        if(random(0, 1) < .05)
        {
            stroke(0)
            fill(200, 0, 0)
        }
        if(level == 0)
        {
            push()
                translate(i, j, k)
                box(1)
            pop()
        }
        else
        {
            if(random() < .48)
            {
                push()
                    translate(i, j, k)
                    scale(s*1/3)
                    cantor_dust(level-1)
                pop()
            }
            else
            {
                push()
                    translate(i, j, k)
                    box(1)
                pop()
            }
        }
    }
}
