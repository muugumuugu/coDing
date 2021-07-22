/*
This sketch builds on a prior work, "kill the wizard", created by Ben Brandt
http://studio.sketchpad.cc/sp/pad/view/ro.96MuFGoygphSP/rev.16
This sketch was mostly inspiration.
 
I created the background image in another sketch:
http://studio.sketchpad.cc/sp/pad/view/ro.9lk7hnxhmvU6k/latest
and pasted it here.
*/
//work in progress
//things to do:
//fix bug where two orbs next to each other will kill you if you touch them
 
int count, winner, players, living;
int controls[];
color[] robes[];
PImage bg;
int wall;
PVector center;
boolean christmas;
 
 
boolean w, a, s, d;
String[][] titles;
 
Ball[] balls;
 
Hat titleHat;
 
color darken(color c, float x){
    /*
    this method returns a version of the color provided darkened by the value x
    x should be less than 1. If you darken by .5 it should be about half as light
    have to mod 256 twice to be sure I get a number between 0 and 255 for each component
    */
    int alpha = (int) ((c >> 24) % 256 + 256) % 256;
    int red = (int) ((c >> 16) % 256 + 256) % 256;
    int green = (int) ((c >> 8) % 256 + 256) % 256;
    int blue = (c % 256 + 256) % 256;
    return color (red * x, green * x, blue * x, alpha);
}
 
color randomSkin(){
    /*
    returns a random color that works for human skin
    formulas based somewhat on this blog post: http://johnthemathguy.blogspot.com/2013/08/what-color-is-human-skin.html
    */
    float temp = random(23);
    if (temp < 13){
        return color (map(temp, 0, 13, 56, 198), map(temp, 0, 13, 26, 147), map(temp, 0, 13, 18, 118));
    } else {
        return color (map(temp, 13, 23, 198, 253), map(temp, 13, 23, 147, 244), map(temp, 13, 23, 118, 240));
    }
}
 
color randomWood(){
    float temp = random(10);
 
    return color (map(temp, 0, 10, 49, 224), map(temp, 0, 10, 35, 215), map(temp, 0, 10, 24, 208));
}
 
class Ball{
    /*
    This class is the superclass for most of the parts of the game.
    It defines the simple ball physics used by the wizard, hat, and orbs.
    */
    
    /*
    These PVectors are pretty self explanatory.
    each frame, acceleration is added to velocity and velocity is added to position
    */
    PVector position, velocity, acceleration;
    
    /*
    The radius not only determines the collision area for the ball, it is also used as the mass for the physics
    the angle is used to rotate the sprite. It has no effect on physics.
    the spin affects the angle and also has to effect on physics
    size is just a scale. I put it in so I could scale up my sprites if I wanted to
    */
    float radius, angle, spin, size;
    
    /*
    These booleans define properties of the ball that are either on or off.
    if spins is true, this ball will spin when it collides with another ball
    if flip is true, the sprite will be flipped horizontally
    if friction is true, the velocity and spin will slow down. Bigger radius, more friction
    if perspective is true, the draw angle is based on where on the map the sprite is
        The perspective is not great. I put it in because I thought the wizards looked weird with the background
    */
    boolean spins, flip, friction, perspective;
    
    /*
    kind tells you what kind of ball this is. When different kinds of balls collide, they react in different ways
    0: No Orb Wizard (Binary 000)
    1: Blue Orb Wizard (Binary 001)
    2: Green Orb Wizard (Binary 010)
    3: Blue/Green Orb Wizard (Binary 011)
    4: Red Orb Wizard (Binary 100)
    5: Blue/Red Orb Wizard (Binary 101)
    6: Green/Red Orb Wizard (Binary 110)
    7: Blue/Green/Red Orb Wizard (Binary 111)
    Note how the digits in the binary forms correspond to the different orbs
    8: Blue Orb
    9: Green Orb
    10: Worn Hat
    11: Red Orb
    12: Blue Fireball
    13: Green Fireball
    14: Free Hat
    15: Red Fireball
    The Orbs are spaced this way so that you can subtract a number
    and use bitwise comparison to match to an orb on the wizard's staff
    16: Dead Wizard
    */
    int kind;
    
    /*
    maxSpeed and maxAccel are limits on the magnitude of those vectors
    */
    float maxSpeed = 5;
    float maxAccel = .5;
    
    /*
    a few different constructors. They all call the main constructor so that if I need to change anything I only need to change it in one place.
    */
    public Ball(){
        this (new PVector (random(300),random(300)), new PVector (random(1), random(1)), radius = random(20)+5, -1, 1);
    }
    public Ball (float x, float y, float xSpeed, float ySpeed, float radiusi){
        this (new PVector (x, y), new PVector (xSpeed, ySpeed), radiusi, -1, 1);
    }
    public Ball (float x, float y, float radiusi){
        this (new PVector (x, y), new PVector (0, 0), radiusi, -1, 1);
    }
    public Ball (float x, float y, float xSpeed, float ySpeed, float radiusi, int kindi){
        this (new PVector (x, y), new PVector (xSpeed, ySpeed), radiusi, kindi, 1);
    }
    public Ball (float x, float y, float xSpeed, float ySpeed, float radiusi, int kindi, float sizei){
        this (new PVector (x, y), new PVector (xSpeed, ySpeed), radiusi, kindi, sizei);
    }
    public Ball (PVector positioni, PVector velocityi, float radiusi, int kindi){
        this (positioni, velocityi, radiusi, kindi, 1);
    }
    public Ball (PVector positioni, PVector velocityi, float radiusi, int kindi, float sizei){
        position = positioni;
        velocity = velocityi;
        acceleration = new PVector (0,0);
        radius = radiusi * sizei;
        kind = kindi;
        angle = 0;
        spin = 0;
        size = sizei;
        friction = false;
        perspective = false;
    }
    
    /*
    A bunch of methods to return variables from this ball.
    I was taught this is the proper way to get variables from a class
    */
    boolean getFlip(){
        return flip;
    }
    float getAngle(){
        return angle;
    }
    boolean getPerspective(){
        return perspective;
    }
    float getSize(){
        return size;
    }
    int getKind(){
        return kind;
    }
    PVector getPosition(){
        /*
        getPosition and getVelocity both multiply by 1 to return a clone of the original. I couldn't get the clone method to work. I do it this way because I don't want to accidentally modify the position or velocity from outside the ball
        */
        return PVector.mult(position,1);
    }
    PVector getVelocity(){
        return PVector.mult(velocity,1);
    }
    float getRadius(){
        return radius;
    }
    
    boolean collides (int otherKind){
        /*
        this method was meant to be overwritten by subclasses. It returns true if this ball bounces off something else.
        I made this method so that certain kinds of objects can pass through each other and also so that the ball can react in different ways, e.g. change its own type, depending on what kind of other ball it hit
        */
        return true;
    }
    
    void collision (PVector otherPosition, PVector otherVelocity, float otherRadius, float distance, int otherKind){
        /*
        This method defines the simple physics of ball collisions.
        It only does something if the collides method returns true
        */
        if (collides(otherKind)){
            PVector relativePosition = PVector.sub(position, otherPosition);
            
            if(spins){
                /*
                This bit makes the ball spin if it's a ball that's supposed to spin
                The speed of the spin only depends on its own radius. Not realistic, but it's good enough.
                The direction of spin does depend on how the other ball hit it
                */
                if ((relativePosition.heading() - otherVelocity.heading() + TAU)%TAU < PI){
                    spin = -1/radius;
                } else {
                    spin = 1/radius;
                }
                
            }
            
            /*
            This bit determines the relationship between the balls and their velocities
            */
            
            float t1 = 2 * otherRadius / (radius + otherRadius);
            float t2 = PVector.dot(PVector.sub(velocity, otherVelocity), relativePosition);
            float t3 = relativePosition.magSq();
            float scalar = t1 * t2 / t3;
            
            float offset = (radius + otherRadius - distance)/2+.5;
            
            //This lines makes sure that the balls are not inside eachother anymore
            position.add (PVector.mult(relativePosition, offset/distance));
            
            //This line changes the velocity to reflect the collision
            velocity.sub(PVector.mult(relativePosition, scalar));
        }
    }
    
    void update(){
        /*
        This update method is called every frame to change the velocity and position
        It also calls the function that draws the sprite
        */
        acceleration.limit(maxAccel);
        velocity.add(acceleration);
        velocity.limit(maxSpeed);
        
        //This bit reflects the ball off of the walls
        if (position.x < radius + wall/2){
            velocity.x = abs(velocity.x);
        }
        if (position.x > width - radius - wall/2){
            velocity.x = -abs(velocity.x);
        }
        if (position.y < radius + wall/2){
            velocity.y = abs(velocity.y);
        }
        if (position.y > height - radius - wall/2){
            velocity.y = -abs(velocity.y);
        }
        position.add(velocity);
        if (spins){
            angle = (angle + spin)%TAU;
        } else if (perspective){
            angle = PVector.sub(position, center).heading() + HALF_PI;
        }
        
        //This is where friction comes in. The number 'f' is based purely on aesthetic and not physics based
        if (friction){
            float f = 1 / (radius/132 + 2) + .5;
            spin *= (abs(spin) < .01) ? 0 : f;
            velocity.mult (velocity.magSq() < .05 ? new PVector(0,0) : new PVector(f, f));
        }
                
        pushMatrix();
        pushStyle();
        
        //Calls a function in case the ball needs to do something before it's drawn
        predraw();
        
        //Centers the draw area on where the sprite should be located
        translate (position.x, position.y);
        scale(size, size);
        rotate(angle);
        scale(flip?-1:1,1);
        //Draws the sprite
        draw();
        
        popStyle();
        popMatrix();
    }
    
    /*
    predraw is a method meant to be overwritten by the subclasses.
    generic balls don't need anything special
    */
    void predraw();
    
    /*
    draw is meant to be overwritten by the subclasses.
    generic balls just draw a circle
    */
    void draw(){
        ellipse(0,0,radius*2,radius*2);
    }
}
 
class Orb extends Ball{
    /*
    The orbs are both the shields and weapons in the game
    They're generally scattered randomly in the level
    */
    public Orb(){
        super(0, 0, 0, 0, 5, 8);
        reset();
    }
    public Orb(float xi, float yi, float xSpeedi, float ySpeedi){
        super(xi, yi, xSpeedi, ySpeedi, 5, Math.pow(2,(int)random(3)) + ((xSpeedi == 0 && ySpeedi == 0)?7:11));
    }
    
    void reset(){
        /*
        the reset method puts the orb randomly on the map, but makes sure it's not too close to one of the players
        */
        boolean good = true;
        //this lop makes sure it's not too close to the players
        do {
            good = true;
            position = new PVector (random(width-radius*4-wall)+radius*2+wall/2, random(height-radius*4-wall)+radius*2+wall/2);
            for (int i = 0; i < players*2; i++){
                good = good && (position.dist(balls[i].getPosition()) > balls[i].getRadius()*1.5);
                if (!good){
                    test = position;
                    test2 = i;
                }
            }
        } while (!good);
        
        //When an orb is reset it is stationary
        velocity = new PVector (0, 0);
        //When an orb is reset its color is determined randomly
        kind = Math.pow(2,(int)random(3)) + 7;
    }
    
    boolean collides (int otherKind){
        //orbs do not collide with worn hats
        if (otherKind == 10){
            return false;
        //orbs collide with other orbs
        //orbs also move if they're hit by a wizard with that color already on their staff
        } else if (otherKind > 7 || (kind < 12 && (((kind - 7) & otherKind) > 0))){
            //kind = kind % 4 + 12;
            return true;
        //if an orb hits a wizard, it is "destroyed"
        //really it's just reset to a different location in the level
        } else {
            reset ();
            return false;
        }
    }
    
    void predraw(){
        if (velocity.magSq() > 0.5){
            kind = kind % 4 + 12;
        } else {
            
            kind = kind % 4 + 8;
        }
        if (kind > 11){
            //fireballs slowly accelerate
            acceleration = PVector.mult(velocity, velocity.mag()*.001);
            
            //the angle of the fireball sprite depends on its direction
            angle = velocity.heading();
        }
    }
    
    void draw(){
        //draw the main body of the orb. color depends on kind
        noStroke();
        if(kind % 4 == 0){
            fill(0,0,255);
        } else if (kind % 4 == 1){
            fill(0,255,0);
        } else {
            fill(255,0,0);
        }
        ellipse(0,0, radius*2, radius*2);
        
        //draw a little light reflection on the top right part of the orb
        pushMatrix();
        fill(255,100);
        rotate (.2);
        translate (0, -radius + 2);
        ellipse (0,0, radius*2/3, 2);
        popMatrix();
        
        //if christmas mode is on, make the orb look like an ornament
        if (christmas){
            pushStyle();
            fill(240);
            rect(-radius/3, -radius-1, radius/3*2, 2);
            stroke(240);
            noFill();
            ellipse (0, -radius-2, 2, 2); 
            popStyle();
        }
        
        //if it's a fireball, draw a comet trail behind it
        if (kind == 12 || kind == 13 || kind == 15){
            if(kind % 4 == 0){
                fill(180,180,255,200);
            } else if (kind % 4 == 1){
                fill(150,255,150,180);
            } else {
                fill(255,150,150,180);
            }
            
            beginShape();
            curveVertex(-20,0);
            curveVertex(-20,0);
            curveVertex(0,radius*1.5);
            curveVertex(radius*1.5, 0);
            curveVertex(0,-radius*1.5);
            curveVertex(-20,0);
            curveVertex(-20,0);
            endShape();
        }
    }
}
 
 
class Hat extends Ball{
    /*
    Removable hats are a feature I knew I wanted early in the process
    */
    
    //these offset variables are used to position the hat on the wizard's head if it's a worn hat.
    float offsetX, offsetY;
    
    //what color to draw the hat
    color hatColor;
    
    //what wizard the hat is on
    Wizard myWizard;
    
    public Hat(Wizard myWizardi){
        //This constructor attaches a hat to a pre-existing wizard
        myWizard = myWizardi;
        super (PVector.add(myWizard.getPosition(),new PVector (offsetX, offsetY)), PVector.mult(myWizard.getVelocity(),1), 11, 10);
        angle = -.2;
        size = myWizard.getSize();
        hatColor = myWizard.getRobeColor();
        offsetX = -4*size;
        offsetY = -54*size;
    }
    
    public Hat (float xi, float yi, float anglei, float sizei, boolean flipi){
        //this constructor makes a free floating hat in the environment.
        super (xi, yi, 0, 0, 11, 14, sizei);
        angle = anglei;
        flip = flipi;
        myWizard = null;
        hatColor = color(255,0,0);
        spins = true;
        friction = true;
        offsetX = 0;
        offsetY = 0;
    }
    public Hat(){
        this (random(width), random(height), 0, 1, false);
    }
    
    boolean collides (int otherKind){
        //worn hats only react to fireballs
        if (kind == 10 && otherKind != 12 && otherKind != 13 && otherKind != 15){
            return false;
        //if the hat is already free or it hits a fireball
        } else {
            //make sure hat knows its "free"
            kind = 14;
            //remove from any wizard it's on
            myWizard = null;
            //make the hat spin and have friction
            spins = true;
            friction = true;
            return true;
        }
    }
    
    void predraw(){
        //Only needs to do this stuff if it's attached to a wizard
        if (myWizard != null){
            //if the wizard is dead, fall off
            if (myWizard.getKind() == 16){
                kind = 14;
                myWizard = null;
                spins = true;
                spin = .1;
                friction = true;
            //If the wizard is alive, stay on its head
            } else {
                flip = myWizard.getFlip();
                size = myWizard.getSize();
                PVector offset = new PVector(flip?-offsetX:offsetX, offsetY);
                offset.rotate(myWizard.getAngle());
                position = PVector.add(myWizard.getPosition(), offset);
                velocity = myWizard.getVelocity();
                angle = myWizard.getAngle()+(flip?.2:-.2);
            }
        }
 
    }
    
    void draw(){
        
        noStroke();
        fill(hatColor);
        
        //round out the bottom of the hat
        ellipse(0+1,0+9,18,5);
        
        //draw the general hat shape
        beginShape();
        vertex(-9+1,0+9);
        vertex(-6+1,-10+9);
        vertex(-15+1,-10+9);
        vertex(-16+1,-12+9);
        vertex(3+1,-20+9);
        vertex(9+1,0+9);
        endShape(CLOSE);
        
        //if christmas mode is on, add a fur lining and ball
        if (christmas){
            fill(255);
            ellipse(-15, -3, 7, 7);
            
            ellipse(-7, 9, 7, 7);
            ellipse(9, 9, 7, 7);
            
            ellipse(-3, 10.5, 7, 7);
            ellipse(5, 10.5, 7, 7);
            
            ellipse(1, 11, 7, 7);
        }
        
    }
}
 
class Wizard extends Ball {
    /*
    The opponents in the game
    */
    //These colors are fairly self explanatory
    color robeColor, fleshColor, woodColor;
    
    /*
    control: 0 = CPU, 1 = mouse, 2 = keyboardr
    red, blue, green are there so that I can smoothly change the color when orbs are gained or lost
    alpha is there so I can smoothly fade out the forcefield when you die
    */
    int control, red, blue, green, alpha;
    
    /*
    a bunch of constructors, they reference each other so I only need to change things in one place
    */
    public Wizard(float xi, float yi, float xSpeedi, float ySpeedi, color robeColori, int controli, float sizei){
        super (xi, yi, xSpeedi, ySpeedi, 50, 0, sizei);
        flip = false;
        
        robeColor = robeColori;
        fleshColor = randomSkin();
        woodColor = randomWood();//color(120,75,60);
        control = controli;
        red = 0;
        blue = 0;
        green = 0;
        alpha = 100;
        
        perspective = true;
        maxSpeed = 3;
    }
    public Wizard (float xi, float yi, color robeColori){
        this (xi, yi, 0, 0, robeColori, false, 1);
    }
    public Wizard (float xi, float yi, color robeColori, int controli){
        this (xi, yi, 0, 0, robeColori, controli, 1);
    }
    public Wizard (float xi, float yi, color robeColori, int controli, float sizei){
        this (xi, yi, 0, 0, robeColori, controli, sizei);
    }
    
    color getRobeColor(){
        return robeColor;
    }
    void setControl(int controli){
        control = controli;
    }
    
    boolean collides (int otherKind){
        if (kind == 16){
            //dead wizards collide with anything but worn hats
            if (otherKind == 10){
                return false;
            } else {
                return true;
            }
        } else if ((otherKind == 8 || otherKind == 9 || otherKind == 11)  && ((((otherKind % 4)+1) & kind) == 0)){
            //add an orb if you that you don't have if you touch one
            kind += (otherKind % 4) + 1;
        } else if (otherKind == 12 || otherKind == 13 || otherKind == 15){
            if ((((otherKind % 4)+1) & kind) != 0){
                //lose an orb if you're hit by a fireball of that type
                kind -= (otherKind % 4) + 1;
            } else {
                //if you don't have that type, die
                living -= 1;
                flip = false;
                friction = true;
                acceleration = new PVector (0,0);
                kind = 16;
            }
        }
        if (otherKind == 10){
            //living wizards also collide with anything but worn hats
            return false;
        } else {
            return true;
        }
    }
    
    void predraw(){
        if (kind != 16){
            //if the wizard isn't dead, move it according to its control variable
            if (control == 0){
                //the AI
                float fireballDistance = 1000;
                float orbDistance = 1000;
                PVector closeFireball = null;
                PVector closeFireballNormal = null;
                PVector closeOrb = null;
                
                //find out where the closest orb is and where the closest fireball is and what way it's going
                for (int i=0; i < balls.length; i++){
                    if (balls[i].getKind() == 8 || balls[i].getKind() == 9 || balls[i].getKind() == 11) {
                        if (closeOrb == null){
                            closeOrb = balls[i].getPosition();
                            orbDistance = position.dist(closeOrb);
                        } else {
                            float temp = position.dist(balls[i].getPosition());
                            if (temp < orbDistance){
                                closeOrb = balls[i].getPosition();
                                orbDistance = temp;
                            }
                        }
                    } else if (balls[i].getKind() == 12 || balls[i].getKind() == 13 || balls[i].getKind() == 15) {
                        if (closeFireball == null){
                            closeFireball = balls[i].getPosition();
                            closeFireballNormal = balls[i].getVelocity();
                            fireballDistance = position.dist(balls[i].getPosition());
                        } else {
                            float temp = position.dist(balls[i].getPosition());
                            if (temp < fireballDistance){
                                closeFireball = balls[i].getPosition();
                                closeFireballNormal = balls[i].getVelocity();
                                fireballDistance = temp;
                            }
                        }
                    }
                }
                
                if (closeFireball == null){
                    //If there are not fireballs, move to the closest orb
                    acceleration = PVector.sub(PVector.sub(closeOrb, position), velocity);
                } else {
                    //Check and see if the closest fireball will come close to colliding with you
                    float x1 = position.x;
                    float y1 = position.y;
                    float x0 = closeFireball.x;
                    float y0 = closeFireball.y;
                    float u = closeFireballNormal.x;
                    float v = closeFireballNormal.y;
                    float m = (x1 * v - x0 * v - y1 * u + y0 * u) / (v * v + u * u);
                    float n = (x1 * u - x0 * u + y1 * v - y0 * v) / (v * v + u * u);
                    float xIntercept = x0 + n * u;//(x1 * u * u + v * (-y1 * u + y0 * u + x0 * v)) / (v * v + u * u);
                    float yIntercept = y0 + n * v;//(y0 * u * u + v * (-x1 * u +y1 * u + x0 * v)) / (v * v + u * u);
                    PVector futureFireball = PVector.add(closeFireball, PVector.mult(closeFireballNormal, n));//new PVector (xIntercept, yIntercept);
                    
                    acceleration = PVector.mult(velocity, -1);
                    
                    if (n > 0 && futureFireball.dist(position) < radius * 1.5){
                        PVector direction = new PVector (0, 0);
                        //move orthogonally to the velocity of the closest fireball if it will collide with you
                        //sign of m tells you which orthogonal to use
                        if (m < 0){
                            direction = new PVector (-v, u);
                        } else {
                            direction = new PVector (v, -u);
                        }
                        acceleration = PVector.sub(direction, velocity);
                    } else {
                        if (closeOrb == null){
                            //if the fireball won't hit you and there are no orbs left, just keep going
                            acceleration = PVector.mult(velocity, 1);
                        } else {
                            //if the fireball won't hit you and there are orbs left, move towards the orb
                            acceleration = PVector.sub(PVector.sub(closeOrb, position), velocity);
                        }
                    }
                    
                }
                //this should make it so they're always accelerating as much as possible.
                acceleration.normalize();
            } else if (control == 1){
                //if mouse control accelerate towards the mouse position
                acceleration = PVector.mult(PVector.sub(new PVector(mouseX, mouseY), position), .01);
            } else if (control == 2){
                //if wasd control, accelerate based on the pressed keys
                acceleration = new PVector ((d?.5:0)-(a?.5:0),(s?.5:0)-(w?.5:0));
            }
            //Make sure wizard is facing the way he's moving
            float velocityVsAngle = ((velocity.heading() - angle) % TAU + TAU) % TAU;
            flip = velocityVsAngle > HALF_PI && velocityVsAngle < 3 * HALF_PI;
        }
        
        
    }
    
    void draw(){
        if (kind == 16){
            //draw a dead wizard
            noStroke();
            
            //draw the remnants of a forcefield
            if (alpha > 0){
                //fade out the forcefield
                red = red < 0 ? 0 : red - 10;
                green = green < 0 ? 0 : green - 10;
                blue = blue < 0 ? 0 : blue - 10;
                alpha = alpha - 5;
                fill(red, green, blue, alpha);
                ellipse (0,0,100,100);
            } else {
                //if the forcefield is faded out, make the hit area smaller
                radius = 25;
            }
            
            //if christmas mode is on, bottom of chin is white for beard, otherwise it's flesh color
            if (christmas){
                fill(255);
            } else {
                fill(fleshColor);
            }
            ellipse (0,-14,19,19);
            
            //draw hands
            fill(fleshColor);
            ellipse (34,-4,9,9);
            ellipse (-34,-4,9,9);
            
            //draw the upper body darker
            fill(darken(robeColor, .8));
            beginShape();
            curveVertex(0, -4);
            curveVertex(0, -4);
            curveVertex(12, -2);
            curveVertex(22, 8);
            curveVertex(32, 10);
            curveVertex(32, -9);
            curveVertex(22, -11);
            curveVertex(12, -17);
            
            curveVertex(6, -17);
            curveVertex(0, -18);
            curveVertex(-6, -17);
            
            curveVertex(-12,-17);
            curveVertex(-22, -11);
            curveVertex(-32, -9);
            curveVertex(-32, 10);
            curveVertex(-22, 8);
            curveVertex(-12, -2);
            curveVertex(0, -4);
            curveVertex(0, -4);
            endShape();
            
            //staff
            pushStyle();
            fill(woodColor);
            beginShape();
            vertex(-40,-18);
            vertex(-40,-20);
            vertex(40,2);
            vertex(40,8);
            endShape(CLOSE);
            ellipse(-40,-19,2,2);
            ellipse (40,5,12,12);
            
            //draw the lower body
            fill (robeColor);
            beginShape();
            curveVertex(-10, -4);
            curveVertex(0, -4);
            curveVertex(17, -5);
            curveVertex(20, 16);
            
            curveVertex(-20, 16);
            curveVertex(-17, -5);
            curveVertex(0, -4);
            curveVertex(10, -4);
            endShape();
            
            //draw the shoes
            fill(0);
            beginShape();
            curveVertex(12,15);
            curveVertex(8,18);
            curveVertex(16,24);
            curveVertex(23, 20);
            curveVertex(19, 15);
            curveVertex(12, 15);
            curveVertex(8,18);
            endShape();
            
            beginShape();
            curveVertex(-12,15);
            curveVertex(-8,18);
            curveVertex(-16,24);
            curveVertex(-23, 20);
            curveVertex(-19, 15);
            curveVertex(-12, 15);
            curveVertex(-8,18);
            endShape();
        } else {
            //Draw a living wizard
            noStroke();
            
            //draw the forcefield
            fill (red, green, blue, alpha);
            ellipse (0,0,100,100);
            fill(robeColor);
 
            //robe basic shape
            beginShape();
            vertex(-20,40);
            vertex(-10,-6);
            vertex(-15,3);
            vertex(-30,7);
            vertex(-30,-17);
            vertex(-18,-17);
            vertex(-5,-26);
            vertex(5,-26);
            vertex(8,-22);
            vertex(24,0);
            vertex(15,18);
            vertex(20,40);
            endShape(CLOSE);
 
            //round the sleeves and bottom
            ellipse(0,40,40,20);
            ellipse(-30,-5,9,24);
            ellipse(20,10,14,24);
    
            //shade the sleeves
            fill(0,150);
            ellipse(-30,-5,7,23);
            ellipse(20,10,12,23);
    
            //staff
            pushStyle();
            fill(woodColor);
            beginShape();
            vertex(-40,-18);
            vertex(-40,-20);
            vertex(40,2);
            vertex(40,8);
            endShape(CLOSE);
            ellipse(-40,-19,2,2);
            ellipse (40,5,12,12);
            
            if (kind % 2 >= 1){
                //draw the blue orb and shift color of forcefield towards blue
                fill(0,0,255);
                ellipse (43,0,8,8);
                blue += 10;
                blue = (blue > 255 ? 255 : blue);
            } else {
                //shift color of forcefield away from blue
                blue -= 10;
                blue = (blue < 0 ? 0 : blue);
            }
            
            if (kind % 4 >= 2){
                //draw the green orb and shift color of forcefield towards green
                fill(0,255,0);
                ellipse (44,8,8,8);
                green += 10;
                green = (green > 255 ? 255 : green);
            } else {
                //shift color of forcefield away from green
                green -= 10;
                green = (green < 0 ? 0 : green);
            }
            
            if (kind % 8 >= 4){
                //draw red orb and shift color of forcefield towards red
                fill(255,0,0);
                ellipse (38,5,8,8);
                red += 10;
                red = (red > 255 ? 255 : red);
            } else {
                //shift color of forcefield away from red
                red -= 10;
                red = (red < 0 ? 0 : red);
            }
 
            popStyle();
            
            //hands
            fill(fleshColor);
            ellipse (-30,-14,11,11);
            ellipse (20,1,13,13);
    
            //head    
            ellipse (0,-37,21,26);
            
            //if christmas mode is on, draw a beard
            if (christmas){
                fill(255);
                beginShape();
                curveVertex(-11, -38);
                curveVertex(-11, -38);
                curveVertex(-8, -27);
                curveVertex(0, -24);
                
                curveVertex(9, -26);
                curveVertex(10, -34);
                curveVertex(9, -32);
                curveVertex(3, -33);
                curveVertex(-5, -32);
                curveVertex(-11, -38);
 
                
                
                endShape(CLOSE);
            }
            
            //facial features
            fill(0);
            
            //eye 1
            pushMatrix();
            translate(7,-37);
            rotate(-.3);
            ellipse (0,0,3.5,2.5);
            popMatrix();
            
            //eye 2
            pushMatrix();
            translate(-1,-37);
            rotate(.3);
            ellipse (0,0,4,3);
            popMatrix();
            
            //brows and mouth
            pushStyle();
            stroke(0);
            strokeWeight(.5);
            line (3,-37,3,-39);
            line (-5,-39,-4,-41);
            line (10,-39,9,-41);
            line (5,-29,-1,-29);
            popStyle();
        }
    }
}
 
PImage makeBackground(int wall, int brickrows){
    /*
    draws the background - four walls and the floor then stores it in a PImage that it returns
    */
    pushStyle();
    pushMatrix();
    strokeWeight(1);
    
    fill(120);
    rect(0,0,width,height);
    float brickHeight = wall/brickrows;
    
    translate(width/2, height/2);
    for (int i = 0; i < 4; i++){
        //this loop draws the four walls
        stroke(125);
        for (float y = 0; y < wall; y += brickHeight){
            //this loop draws the rows of bricks
            float x = 0;
            while (x < width - 30){
                //this loop draws the individual bricks in the row
                fill(random(50)+125);
                float oldX = x;
                x += random(15) + 15;
                beginShape();
                vertex(map(oldX, 0, width, y-width/2, width/2-y), y-height/2);
                vertex(map(x, 0, width, y-width/2, width/2-y), y-height/2);
                vertex(map(x, 0, width, y+brickHeight-width/2, width/2-y-brickHeight), y+brickHeight-height/2);
                vertex(map(oldX, 0, width, y+brickHeight-width/2, width/2-y-brickHeight), y+brickHeight-height/2);
                endShape(CLOSE);
            }
            fill(random(50)+125);
            beginShape();
            vertex(map(width, 0, width, y-width/2, width/2-y), y-height/2);
            vertex(map(x, 0, width, y-width/2, width/2-y), y-height/2);
            vertex(map(x, 0, width, y+brickHeight-width/2, width/2-y-brickHeight), y+brickHeight-height/2);
            vertex(map(width, 0, width, y+brickHeight-width/2, width/2-y-brickHeight), y+brickHeight-height/2);
            endShape(CLOSE);
    
        }
        //this bit adds shadow to the walls
        fill(0, 0, 0, 35*abs(2-i));
        noStroke();
        beginShape();
        vertex(-width/2, -height/2);
        vertex(width/2, -height/2);
        vertex(width/2-wall, -height/2+wall);
        vertex(-width/2+wall, -height/2+wall);
        endShape(CLOSE);
        rotate(HALF_PI);
        
    }
    popMatrix();
    stroke(120);
    
    //draw a mosaic for the floor
    splitRect(50, 50, width-(wall*2), height-(wall*2));
    popStyle();
    
    //load the current screen into a PImage
    PImage temp = createImage (width, height, RGB);
    loadPixels();
    temp.pixels = pixels;
    temp.updatePixels;
    return temp;
}
 
int minStone = 12;
    
void splitRect (float x, float y, float w, float h){
    //this recursive method fills in a rectangle with smaller rectangles
    rectMode(CORNER);
    
    fill(random(50)+125);
 
    if (w <= minStone*2){
        if (h <= minStone*2){
            //This is the base case, draw a rectangle if the current rectangle is smaller than half the minimum
            rect (x, y, w, h);
            
            saturation = saturation >= 6 ? 2 : (saturation + 1);
            brightness = brightness >= 6 ? 2 : (brightness + 1);
        } else {
            //vertical strip divide
            int stone = (int)random(minStone, h - minStone);
            splitRect(x, y, w, stone);
            splitRect(x, y + stone, w, h - stone);
        }
    } else {
        if (h <= minStone*2){
            //horizontal strip divide
            int stone = (int)random(minStone, w - minStone);
            boolean left = (random()<.5);
            splitRect(x, y, stone, h);
            splitRect(x + stone, y, w - stone, h);
        } else {
            //big rectangle divide
            //generate a legal side height and width 
            //decide which corner to cut into
            //cut off the rectangle with that height and width and send it to splitRect
            //give the remaining L to splitL
            
            //generate random number with two random number to give more weight to the middle numbers
            int stoneY = (int) (random(minStone/2, (h-minStone)/2)+random(minStone/2, (h-minStone)/2));
            int stoneX = (int) (random(minStone/2, (w-minStone)/2)+random(minStone/2, (w-minStone)/2));
            boolean top = (random()<.5);
            boolean left = (random()<.5);
            if (top){
                if (left){
                    //bite out top left
                    splitRect(x, y, stoneX, stoneY);
                    splitL(x, y, w, h, stoneX, stoneY);
 
                } else {
                    //bite out top right
                    splitRect(x + w - stoneX, y, stoneX, stoneY);
                    splitL(x, y, w, h, -stoneX, stoneY);
                }
            } else {
                if (left){
                    //bite out bottom left
                    splitRect(x, y + h - stoneY, stoneX, stoneY);
                    splitL(x, y, w, h, stoneX, -stoneY);
                } else {
                    //bite out bottom right
                    splitRect(x + w - stoneX, y + h - stoneY, stoneX, stoneY);
                    splitL(x, y, w, h, -stoneX, -stoneY);
                }
            }
            
        }
    }
}
 
void splitL (float x, float y, float w, float h, float stoneX, float stoneY){
    //topleft corner, width, height
    //stoneX: if stoneX is positive, corner bitten from left, negative from right
    //stoneY: if stoneY is positive, corner bitten from top, negative from bottom
    //generate a rectangle with the same width or height as the cut-out area
    //give this rectangle to splitRect
    //check if remaining area is rectangle or L
    //if rectangle, give to splitRect
    //if L, give to splitL
    
    boolean horizontal = (random()<.5);
    
    hue = (hue + .4) % 6;
    fill (hue, saturation, brightness, alpha);
    if (horizontal){
        int newStoneX = w - abs(stoneX) < minStone * 2 ? w - abs(stoneX) : (int) random(minStone, w - abs(stoneX) - minStone + 1);
        if (newStoneX >= w - abs(stoneX) - minStone){
            //two rectangles
            //little rectangle
            splitRect((stoneX>0 ? x + stoneX : x), (stoneY>0 ? y : y + h + stoneY), w - abs (stoneX), abs(stoneY));
            //big rectangle
            splitRect(x, (stoneY>0 ? y + stoneY : y), w, h - abs(stoneY));
        } else {
            splitRect ((stoneX>0 ? (x + stoneX) : (x + w + stoneX - newStoneX)), (stoneY>0 ? y : (y + h + stoneY)), newStoneX, abs(stoneY));
            splitL(x, y, w, h, stoneX + (stoneX>0 ? newStoneX : -newStoneX), stoneY);
        }
    } else {//vertical
        int newStoneY = h - abs(stoneY) < minStone * 2 ? h - abs(stoneY) : (int) random(minStone, h - abs(stoneY) - minStone + 1);
        if (newStoneY >= h - abs(stoneY) - minStone){
            //two rectangles
            //little rectangle
            splitRect((stoneX>0 ? x : x + w + stoneX), (stoneY>0 ? y + stoneY : y), abs(stoneX), h - abs (stoneY));
            //big rectangle
            splitRect((stoneX>0 ? x + stoneX : x), y, w - abs(stoneX), h);
            
        } else {
            splitRect((stoneX>0 ? x : x +  w + stoneX), (stoneY>0 ? y + stoneY : y + h + stoneY - newStoneY),  abs(stoneX), newStoneY);
            splitL(x, y, w, h, stoneX, stoneY + (stoneY>0 ? newStoneY : -newStoneY));
        }
    }
    
    
}
 
void start(){
    //this method restarts the game
    
    //set the number of living players to the total number of players
    living = players;
    
    //This array contains all the pieces: wizards, hats, and orbs
    balls = new Ball[players*2 + 9 + (players == 1 ? 10 : 0)];
    
    //instantiate the wizards and their hats
    for (int i = 0; i < players; i++){
        balls[i*2] = new Wizard(cos(TAU*i/players-2.5*QUARTER_PI)*(width/2-100)+width/2, sin(TAU*i/players-2.5*QUARTER_PI)*(height/2-100)+height/2, robes[i], controls[i]);
        balls[i*2+1] = new Hat(balls[i*2]);
    }
 
    //instantiate the orbs    
    for (int i = players*2; i < balls.length; i++){
        balls[i] = new Orb();
    }
    
    //These variables store whether the w, a, s, or d keys are currently being pressed
    w = false;
    a = false;
    s = false;
    d = false;
    
    //height of the wall
    wall = 50;
    //make a background
    bg = makeBackground (wall, 8);
    
    //the current winner. -2 if game just started, -1 if draw, 0+ is player number
    winner = -2;
    
    //count since the second to last wizard died
    count = 0;
}
 
void setup() {
    //default settings on startup
    size(550, 550);
    frameRate(50);
    strokeWeight(1);
    
    players = 2;
    christmas = false;
    
    center = new PVector (width/2, height/2);
    
    //set controls and colors for up to 8 players
    controls = new int[8];
    robes = new color[8];
    for (int i = 0; i < controls.length; i++){
        controls[i] = 0;
    }
    controls[0] = 2;
    robes[0] = color (200, 0, 0);
    robes[1] = color (10, 10, 180);
    robes[2] = color (64, 150, 64);
    robes[3] = color (50, 50, 50);
    robes[4] = color (220, 220, 230);
    robes[5] = color (200, 200, 25);
    robes[6] = color (150, 50, 180);
    robes[7] = color (20, 210, 180);
    
    //this hat is the one from the title screen
    titleHat = new Hat (width/2-112, height/2-26, .8, .7, true);
    strokeWeight(1);
    start();
    //count set to 100 so that 
    count = 100;
    
    //These are the titles you get when you win.
    //The title you get depends on the orbs on your staff at the end of the game
    titles = new String[8][2];
    titles[0][0] = "Novice";
    titles[1][0] = "Magician";
    titles[2][0] = "Prestidigitator";
    titles[3][0] = "Wizard";
    titles[4][0] = "Adept";
    titles[5][0] = "Warlock";
    titles[6][0] = "Sorcerer";
    titles[7][0] = "ARCHMAGE";
    
    //alternate titles for christmas mode
    titles[0][1] = "Elf";
    titles[1][1] = "Magician";
    titles[2][1] = "Prestidigitator";
    titles[3][1] = "Wizard";
    titles[4][1] = "Adept";
    titles[5][1] = "Warlock";
    titles[6][1] = "Sorcerer";
    titles[7][1] = "SANTA";
    
}
 
 
 
 
void draw() {
    
    if (count < 100){
        //main game loop.
        //count doesn't count up til game is over
        
        if (living <= 1 && living < players){
            //if the number of living players is 1 or less (unless players is 1, in which case it must be 0)
            count++;
        }
        //draw the background
        image (bg, 0, 0);
        
        for (int i = 0; i < balls.length; i++){
            //update all of the balls
            balls[i].update();
        }
        
        //reset winner so if they all die, it's a draw
        winner = -1;
        for (int i=0; i < balls.length-1; i++){
            for (int j=i+1; j < balls.length; j++){
                //iterate through the balls and see if any collide
                PVector position1 = balls[i].getPosition();
                PVector position2 = balls[j].getPosition();
                float radius1 = balls[i].getRadius();
                float radius2 = balls[j].getRadius();
                PVector relativePos = PVector.sub(position1, position2);
                float radii = radius1 + radius2;
                text(""+position1+"\n"+position2);
                int kind1 = balls[i].getKind();
                int kind2 = balls[j].getKind();
                if (kind1 < 8) {
                    winner = i;
                }
                if (kind2 < 8) {
                    winner = j;
                }
                
                //first check if circumscribed boxes collide
                if (abs(relativePos.x) <= radii && abs(relativePos.y) <= radii)
                {
                    float distance = relativePos.mag();
                    //now check if circles collide
                    if (distance <= radii){
                        PVector velocity1 = balls[i].getVelocity();
                        PVector velocity2 = balls[j].getVelocity();
                        
                        //call each ball's collision method with data from the other
                        balls[i].collision(position2, velocity2, radius2, distance, kind2);
                        balls[j].collision(position1, velocity1, radius1, distance, kind1);
                        
                        
                    }
                }
            }
        }
    } else {
        //game not currently running
        pushStyle();
        background(0);
        textAlign(CENTER, CENTER);
        
        fill(255);
        pushMatrix();
        for (int i = 0; i < players; i++){
            //draw boxes to change player controls
            pushStyle();
            pushMatrix();
            strokeWeight(1);
            translate (50*i+25, 25);
            
            fill(0);
            stroke(robes[i]);
            rect (-20, -20, 40, 40);
            
            noStroke();
            fill(robes[i]);
            if (controls[i] == 0){
                text("CPU", 0, 0);
            } else if (controls[i] == 1){
                beginShape();
                vertex(-6, 7);
                vertex(-6, -13);
                vertex(8, 1);
                vertex(2, 1);
                vertex(7, 11);
                vertex(4, 12);
                vertex(-1, 2);
                endShape(CLOSE);
            } else if (controls[i] == 2){
                textSize(14);
                text("W\nA S D", 0, 0);
            }
            popMatrix();
            popStyle();
        }
        
        //draw box for add new player
        pushMatrix();
        pushStyle();
        
        translate (50*players+25, 25);
        fill(0);
        
        stroke(255);
        strokeWeight(1);
        rect (-20, -20, 40, 40);
        line (0, 10, 0, -10);
        line (10, 0, -10, 0);
        popStyle();
        
        //draw box to toggle christmas mode
        pushStyle();
        translate (width-25, 25);
        
        fill(196,0,0);
        strokeWeight(1);
        stroke(255);
        rect (-20, -20, 40, 40);
        
        fill(0,128,0);
        noStroke();
        beginShape();
        vertex(12, 18);
        vertex(6, 6);
        vertex(9, 6);
        vertex(3, -6);
        vertex(6, -6);
        vertex(0, -18);
        vertex(-6, -6);
        vertex(-3, -6);
        vertex(-9, 6);
        vertex(-6, 6);
        vertex(-12, 18);
        endShape(CLOSE);
        if (!christmas){
            stroke(255);
            line(-20,-20,20,20);
            line(-20,20,20,-20);
        }
        
        popStyle();
        popMatrix();
        if (winner == -2){
            //if you just started the sketch, show title screen
            pushStyle();
            if (christmas){
                fill(196,0,0);
                textSize(40);
                text("Christmas", width/2, height/2-50);
                fill(0,128,0);
            }
            textSize(70);
            text("Wizard Duel", width/2, height/2);
            textSize(15);
            fill(255);
            text("Press 'r' to begin", width/2, height-50);
            titleHat.update();
            popStyle();
        }
        else {
            //if game over
            textSize(50);
            if (winner == -1){
                text("DRAW", width/2, height/2);
            } else {
                //draw the winner 
                text("WINNER!", width/2, height/2-20);
                textSize(25);
                text(titles[balls[winner].getKind()][christmas ? 1 : 0], width/2, height/2+10);
                pushMatrix();
                pushStyle();
                translate (width/2, height/2 + 70);
                balls[winner].draw();
                popStyle();
                popMatrix();
            }
            
            textSize(15);
            text("Press 'r' for rematch", width/2, height-50);
        
        }
        popStyle();
    }
}
 
void keyPressed() {
    if (key == 'r') {
        //restart the match
        start();
    }
 
    //keep track of if movement keys are being pressed
    if (key == 'w'){
        w = true;
    }
    if (key == 'a'){
        a = true;
    }
    if (key == 's'){
        s = true;
    }
    if (key == 'd'){
        d = true;
    }
}
 
void keyReleased(){
    //release movement key
    if (key == 'w'){
        w = false;
    }
    if (key == 'a'){
        a = false;
    }
    if (key == 's'){
        s = false;
    }
    if (key == 'd'){
        d = false;
    }
}
 
void mouseReleased(){
    //if you're between matches, allow mouse to change options
    if (count >= 100){
        for (int i = 0; i < players; i++){
            //check if mouse clicked in one of the player control boxes
            if  (mouseX > 50*i+5 && mouseX <  50*i+45 && mouseY > 5 && mouseY < 45) {
                controls[i] = (controls[i] + 1) % 3;
            }
        }
        //check if mouse clicked on add new player box
        if  (mouseX > 50*players+5 && mouseX <  50*players+45 && mouseY > 5 && mouseY < 45) {
            players = (players) % 8 + 1;
        }
        //check if mouse clicked on christmas mode toggle
        if  (mouseX > width-45 && mouseX <  width-5 && mouseY > 5 && mouseY < 45) {
            christmas = !christmas;
        }
    }
}
 
