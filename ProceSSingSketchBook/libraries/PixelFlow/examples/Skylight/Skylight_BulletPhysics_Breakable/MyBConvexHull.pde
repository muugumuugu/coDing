


import javax.vecmath.Vector3f;

import com.bulletphysics.collision.shapes.CollisionShape;
import com.bulletphysics.util.ObjectArrayList;

import bRigid.BConvexHull;
import processing.core.PApplet;
import processing.core.PShape;




/**
 * 
 * I use this if i create my custom PShape object
 * 
 * @author Thomas
 *
 */
static public class MyBConvexHull extends BConvexHull{
  public MyBConvexHull(PApplet p, float mass,  ObjectArrayList<Vector3f> vertices, Vector3f position,  boolean inertia) {
    super(p, mass, vertices, position, inertia);
  }
  @Override
  public PShape drawToPShape(CollisionShape shape) {
    return displayShape;
  }
}