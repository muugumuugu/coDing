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
  // Domino example.
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
    
    world = new DwWorld(this, 25);

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
    if(key == 't') UPDATE_PHYSICS = !UPDATE_PHYSICS;
    if(key == 'r') reset();
    if(key == 'f') USE_DEBUG_DRAW = !USE_DEBUG_DRAW;
  }
  

  
  //////////////////////////////////////////////////////////////////////////////
  // Scene Setup
  //////////////////////////////////////////////////////////////////////////////
 
  // https://github.com/jbox2d/jbox2d/blob/master/jbox2d-testbed/src/main/java/org/jbox2d/testbed/tests/DominoTest.java
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

    { // Platforms
      for (int i = 0; i < 4; i++) {
        FixtureDef fd = new FixtureDef();
        PolygonShape sd = new PolygonShape();
        sd.setAsBox(15.0f, 0.125f);
        fd.shape = sd;

        BodyDef bd = new BodyDef();
        bd.position = new Vec2(0.0f, 5f + 5f * i);
        Body body = world.createBody(bd);
        body.createFixture(fd);
        
        world.bodies.add(body, true, color(0), false, color(0), 1f);
      }
    }

    { // Dominos
      FixtureDef fd = new FixtureDef();
      PolygonShape sd = new PolygonShape();
      sd.setAsBox(0.125f, 2f);
      fd.shape = sd;
      fd.density = 25.0f;

      BodyDef bd = new BodyDef();
      bd.type = BodyType.DYNAMIC;
      float friction = .5f;
      int num_col = 4;
      int num_row = 25;

      colorMode(HSB, 360, 100, 100);
      
      for (int i = 0; i < num_col; ++i) {
        for (int j = 0; j < num_row; j++) {
          fd.friction = friction;
          bd.position = new Vec2(-14.75f + j * (29.5f / (num_row - 1)), 7.3f + 5f * i);
          if (i == 2 && j == 0) {
            bd.angle = -0.1f;
            bd.position.x += .1f;
          } else if (i == 3 && j == num_row - 1) {
            bd.angle = .1f;
            bd.position.x -= .1f;
          } else
            bd.angle = 0f;
          Body bdomino = world.createBody(bd);
          bdomino.createFixture(fd);
        
          // create shape, and define individual fill
          int hue = (int) ((i * num_row + j) / (float)(num_col * num_row) * 360);
          int fcol = color(hue, 100, 100);
          int scol = color(hue, 50, 50, 128);

          world.bodies.add(bdomino, true, fcol, true, scol, 1f);
        }
      }
      
      colorMode(RGB, 255);
    }

  }
  