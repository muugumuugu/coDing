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

import org.jbox2d.collision.shapes.EdgeShape;
import org.jbox2d.collision.shapes.PolygonShape;
import org.jbox2d.common.Vec2;
import org.jbox2d.dynamics.Body;
import org.jbox2d.dynamics.BodyDef;
import org.jbox2d.dynamics.BodyType;
import org.jbox2d.dynamics.FixtureDef;
import org.jbox2d.dynamics.joints.Joint;
import org.jbox2d.dynamics.joints.RevoluteJointDef;
import org.jbox2d.dynamics.joints.RopeJointDef;

import processing.core.*;
import processing.opengl.PGraphics2D;


  //
  // This examples shows how to use RopeJoints.
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
  // 'j'         ... toggle joint
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
    
    world = new DwWorld(this, 30);

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
    
  
    if(key == 'j'){
      if (m_rope != null) {
        world.destroyJoint(m_rope);
        m_rope = null;
      } else {
        m_rope = world.createJoint(m_ropeDef);
        world.bodies.add(m_rope, false, color(0), true, color(255,128,0), 2f);
      }
    }
  }
  

  
  //////////////////////////////////////////////////////////////////////////////
  // Scene Setup
  //////////////////////////////////////////////////////////////////////////////
 
  RopeJointDef m_ropeDef;
  Joint m_rope;
  
  // https://github.com/jbox2d/jbox2d/blob/master/jbox2d-testbed/src/main/java/org/jbox2d/testbed/tests/RopeTest.java
  public void initScene() {
    
    Body ground = null;
    {
      BodyDef bd = new BodyDef();
      ground = world.createBody(bd);

      EdgeShape shape = new EdgeShape();
      shape.set(new Vec2(-40.0f, 0.0f), new Vec2(40.0f, 0.0f));
      ground.createFixture(shape, 0.0f);
    }

    {
      PolygonShape shape = new PolygonShape();
      shape.setAsBox(0.5f, 0.125f);

      FixtureDef fd = new FixtureDef();
      fd.shape = shape;
      fd.density = 20.0f;
      fd.friction = 0.2f;
      fd.filter.categoryBits = 0x0001;
      fd.filter.maskBits = 0xFFFF & ~0x0002;

      RevoluteJointDef jd = new RevoluteJointDef();
      jd.collideConnected = false;


      final int N = 10;
      final float y = 15.0f;
      m_ropeDef = new RopeJointDef();
      m_ropeDef.localAnchorA.set(0.0f, y);

      Body prevBody = ground;
      for (int i = 0; i < N; ++i) {
        BodyDef bd = new BodyDef();
        bd.type = BodyType.DYNAMIC;
        bd.position.set(0.5f + 1.0f * i, y);
        if (i == N - 1) {
          shape.setAsBox(1.5f, 1.5f);
          fd.density = 100.0f;
          fd.filter.categoryBits = 0x0002;
          bd.position.set(1.0f * i, y);
          bd.angularDamping = 0.4f;
        }

        Body body = world.createBody(bd);
        body.createFixture(fd);
        
        world.bodies.add(body, true, color(255 * i/(float)N), true, color(0), 1f);

        Vec2 anchor = new Vec2(i, y);
        jd.initialize(prevBody, body, anchor);
        Joint joint =  world.createJoint(jd);

        world.bodies.add(joint, false, color(0), true, color(0,128,255), 2f);
        
        prevBody = body;
      }

      m_ropeDef.localAnchorB.setZero();

      float extraLength = 0.01f;
      m_ropeDef.maxLength = N - 1.0f + extraLength;
      m_ropeDef.bodyB = prevBody;
    }

    {
      m_ropeDef.bodyA = ground;
      m_rope = world.createJoint(m_ropeDef);
      world.bodies.add(m_rope, false, color(0), true, color(255,128,0), 2f);
    }
  
    
    world.bodies.addAll();
  }
  