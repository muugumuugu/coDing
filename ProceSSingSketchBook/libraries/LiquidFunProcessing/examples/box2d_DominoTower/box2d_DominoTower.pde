/**
 * 
 * LiquidFunProcessing | Copyright 2017 Thomas Diewald - www.thomasdiewald.com
 * 
 * https://github.com/diwi/LiquidFunProcessing.git
 * 
 * Box2d / LiquidFun Library for Processing.
 * MIT License: https://opensource.org/licenses/MIT
 * 
 */


import com.thomasdiewald.liquidfun.java.DwWorld;

import org.jbox2d.collision.shapes.PolygonShape;
import org.jbox2d.common.Vec2;
import org.jbox2d.dynamics.Body;
import org.jbox2d.dynamics.BodyDef;
import org.jbox2d.dynamics.BodyType;
import org.jbox2d.dynamics.FixtureDef;

import processing.core.*;
import processing.opengl.PGraphics2D;


  //
  // Domino stacking example.
  //
  // Controls:
  //
  // LMB         ... drag bodies
  // LMB + SHIFT ... shoot bullet
  // MMB         ... add particles
  // RMB         ... remove particles
  // 'r'         ... reset
  // 't'         ... update/pause physics
  // 'f'         ... toggle debug draw
  //
  
  
  int viewport_w = 1280;
  int viewport_h = 720;
  int viewport_x = 230;
  int viewport_y = 0;
  
  boolean UPDATE_PHYSICS = true;
  boolean USE_DEBUG_DRAW = false;

  DwWorld world;

  
  public void settings(){
    size(viewport_w, viewport_h, P2D);
    smooth(8);
  }
  
  public void setup(){ 
    surface.setLocation(viewport_x, viewport_y);
    reset();
    frameRate(120);
  }
  
  
  public void release(){
    if(world != null) world.release(); world = null;  
  }
  
  public void reset(){
    // release old resources
    release();
    
    world = new DwWorld(this, 20);


    // create scene: rigid bodies, particles, etc ...
    initScene();
  }
  
  
  
  public void draw(){
    
    if(UPDATE_PHYSICS){
      world.update();
    }
 
    
    PGraphics2D canvas = (PGraphics2D) this.g;
    canvas.background(32);
    canvas.pushMatrix();
    world.applyTransform(canvas);
    world.drawBulletSpawnTrack(canvas);
    if(USE_DEBUG_DRAW){
      world.displayDebugDraw(canvas);
      // DwDebugDraw.display(canvas, world);
    } else {
      world.display(canvas);
    }
    canvas.popMatrix();
    
    // info
    int num_bodies    = world.getBodyCount();
    int num_particles = world.getParticleCount();
    String txt_fps = String.format(getClass().getName()+ " [bodies: %d]  [particles: %d]  [fps %6.2f]", num_bodies, num_particles, frameRate);
    surface.setTitle(txt_fps);
  }
  

  
  
  
  //////////////////////////////////////////////////////////////////////////////
  // User Interaction
  //////////////////////////////////////////////////////////////////////////////

  public void keyReleased(){
    if(key == 'r') reset();
    if(key == 't') UPDATE_PHYSICS = !UPDATE_PHYSICS;
    if(key == 'f') USE_DEBUG_DRAW = !USE_DEBUG_DRAW;
  }
  

  
  //////////////////////////////////////////////////////////////////////////////
  // Scene Setup
  //////////////////////////////////////////////////////////////////////////////

  final float dwidth = .20f;
  final float dheight = 1.0f;
  float ddensity;// = 10f;
  final float dfriction = 0.1f;
  int baseCount = 25;
  
  // https://github.com/jbox2d/jbox2d/blob/master/jbox2d-testbed/src/main/java/org/jbox2d/testbed/tests/DominoTower.java
  public void initScene() {
    
    float screen_scale = world.transform.screen_scale;
    float dimx = world.transform.box2d_dimx;
    float dimy = world.transform.box2d_dimy;
    float thick = 20 / screen_scale;
    
    { // Floor

      BodyDef bd = new BodyDef();
      Body ground = world.createBody(bd);
      
      PolygonShape sd = new PolygonShape();
      
      sd.setAsBox(dimx/2, thick);
      ground.createFixture(sd, 0);
      
      sd.setAsBox(thick, dimy/2, new Vec2(-dimx/2, dimy/2), 0);
      ground.createFixture(sd, 0);
      
      sd.setAsBox(thick, dimy/2, new Vec2(+dimx/2, dimy/2), 0);
      ground.createFixture(sd, 0);
      
      world.bodies.add(ground, true, color(0), false, color(0), 1f);
    }

    { // Bullets
      
      Body bullet1;
      Body bullet2;
      
      ddensity = 10f;
   
      PolygonShape sd = new PolygonShape();
      sd.setAsBox(.7f, .7f);

      BodyDef bd = new BodyDef();
      bd.type = BodyType.DYNAMIC;
      bd.bullet = true;

      FixtureDef fd = new FixtureDef();
      fd.shape = sd;
      fd.friction = 0f;
      fd.restitution = 0.85f;
      
      fd.density = 25f;
      bd.position = new Vec2(30f, 50f);
      bullet1 = world.createBody(bd);
      bullet1.createFixture(fd);
      bullet1.setLinearVelocity(new Vec2(-25f, -25f));
      bullet1.setAngularVelocity(6.7f);

      fd.density = 25f;
      bd.position = new Vec2(-30, 25f);
      bullet2 = world.createBody(bd);
      bullet2.createFixture(fd);
      bullet2.setLinearVelocity(new Vec2(35f, -10f));
      bullet2.setAngularVelocity(-8.3f);
      
      world.bodies.add(bullet1, true, color(255), false, color(0), 1f);
      world.bodies.add(bullet2, true, color(255), false, color(0), 1f);
    }

    {
      float currX;
      // Make base
      for (int i = 0; i < baseCount; ++i) {
        currX = i * 1.5f * dheight - (1.5f * dheight * baseCount / 2f);
        makeDomino(currX, dheight / 2.0f, false);
        makeDomino(currX, dheight + dwidth / 2.0f, true);
      }
      currX = baseCount * 1.5f * dheight - (1.5f * dheight * baseCount / 2f);
      // Make 'I's
      for (int j = 1; j < baseCount; ++j) {
        if (j > 3)  ddensity *= .8f;
        float currY = dheight * .5f + (dheight + 2f * dwidth) * .99f * j; // y at center of 'I'structure

        for (int i = 0; i < baseCount - j; ++i) {
          currX = i * 1.5f * dheight - (1.5f * dheight * (baseCount - j) / 2f);// +parent.random(-.05f,.05f);
          ddensity *= 2.5f;
          if (i == 0) {
            makeDomino(currX - (1.25f * dheight) + .5f * dwidth, currY - dwidth, false);
          }
          if (i == baseCount - j - 1) {
            // if (j != 1) //djm: why is this here? it makes it off balance
            makeDomino(currX + (1.25f * dheight) - .5f * dwidth, currY - dwidth, false);
          }
          ddensity /= 2.5f;
          makeDomino(currX, currY, false);
          makeDomino(currX, currY + .5f * (dwidth + dheight), true);
          makeDomino(currX, currY - .5f * (dwidth + dheight), true);
        }
      }
    }
   
  }
  
  
  int count = 0;
  public void makeDomino(float x, float y, boolean horizontal) {
    
    float thick = 20 / world.transform.screen_scale;
    y += thick;
    
    PolygonShape sd = new PolygonShape();
    sd.setAsBox(.5f * dwidth, .5f * dheight);
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = ddensity;
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    fd.friction = dfriction;
    fd.restitution = 0.65f;
    bd.position = new Vec2(x, y);
    bd.angle = horizontal ? (float) (Math.PI / 2.0) : 0f;
    Body myBody = world.createBody(bd);
    myBody.createFixture(fd);
    
    
    colorMode(HSB, 360, 100, 100);
    int ch = (count/5) % 360;
    int cs = 100;
    int cb = 100;
    if(horizontal) cb = 50;
    int fcol = color(ch, cs, cb);
    int scol = color(ch, cs*0.5f, cb*0.5f, 128);
    world.bodies.add(myBody, true, fcol, true, scol, 1f);
    colorMode(RGB, 255);
    
    count++;
  }
  