
import com.bulletphysics.collision.shapes.CollisionShape;
import bRigid.BBox;
import processing.core.PApplet;
import processing.core.PShape;


/**
 * 
 * I use this if i create my custom PShape object
 * 
 * @author Thomas
 *
 */
static public class MyBBox extends BBox{
  public MyBBox(PApplet p, float mass, float dimX, float dimY, float dimZ) {
    super(p, mass, dimX, dimY, dimZ);
  }

  @Override
  public PShape drawToPShape(CollisionShape shape) {
    return displayShape;
  }
}