package remixlab.dandelion.constraint;

import remixlab.dandelion.geom.Frame;
import remixlab.dandelion.geom.Quat;
import remixlab.dandelion.geom.Rotation;
import remixlab.dandelion.geom.Vec;

import java.util.ArrayList;

/**
 * Created by sebchaparr on 30/08/17.
 */
public class SphericalPolygon extends Constraint{
    /*
    TODO: Enable Setting different Axis Direction
    * With this Kind of Constraint no Translation is allowed
    * and the rotation depends on a Cone which base is a Spherical Polygon. This kind of constraint always
    * look for the reference frame (local constraint), if no initial position is
    * set a Quat() is assumed as rest position
    * */

    private ArrayList<Vec> vertices = new ArrayList<Vec>();
    private Vec visiblePoint = new Vec();
    private Quat restRotation = new Quat();
    private Vec min, max;

    //Some pre-computations
    private ArrayList<Vec> B= new ArrayList<Vec>();
    private ArrayList<Vec> S = new ArrayList<Vec>();



    public Quat getRestRotation() {
        return restRotation;
    }
    public void setRestRotation(Quat restRotation) {
        this.restRotation = restRotation.get();
    }

    public ArrayList<Vec> getVertices() {
        return vertices;
    }

    public void setVertices(ArrayList<Vec> vertices) {
        this.vertices = projectToUnitSphere(vertices);
        this.visiblePoint = computeVisiblePoint();
        computeBoundingBox();
        doPrecomputations();
    }


    public SphericalPolygon(){
        vertices = new ArrayList<Vec>();
        restRotation = new Quat();
        visiblePoint = new Vec(0,0,1);
    }

    public SphericalPolygon(ArrayList<Vec> vertices, Quat restRotation, Vec visiblePoint) {
        this.vertices = projectToUnitSphere(vertices);
        this.restRotation = restRotation.get();
        this.visiblePoint = visiblePoint;
        visiblePoint.normalize();
        computeBoundingBox();
        doPrecomputations();
    }

    public SphericalPolygon(ArrayList<Vec> vertices, Quat restRotation) {
        this.vertices = projectToUnitSphere(vertices);
        this.restRotation = restRotation.get();
        this.visiblePoint = computeVisiblePoint();
        computeBoundingBox();
        doPrecomputations();
    }

    public SphericalPolygon(ArrayList<Vec> vertices) {
        this.vertices = projectToUnitSphere(vertices);
        this.visiblePoint = computeVisiblePoint();
        computeBoundingBox();
        doPrecomputations();
    }

    @Override
    public Rotation constrainRotation(Rotation rotation, Frame frame) {
        if(frame.is2D())
            throw new RuntimeException("This constrained not supports 2D Frames");
        Quat desired = (Quat) Quat.compose(frame.rotation(),rotation);
        Vec new_pos = Quat.multiply(desired, new Vec(0,0,1));
        Vec constrained = getConstraint(new_pos, restRotation);
        //Get Quaternion
        return new Quat(new Vec(0,0,1), Quat.multiply((Quat)frame.rotation().inverse(),constrained));
    }


    @Override
    public Vec constrainTranslation(Vec translation, Frame frame) {
        return new Vec(0,0,0);
    }


    public Vec getConstraint(Vec target){
        return getConstraint(target, restRotation);
    }

    public Vec getConstraint(Vec target, Quat restRotation){
        Vec point   = restRotation.inverse().multiply(target);
        if(!isInside(point)){
            Vec constrained = closestPoint(point);
            return restRotation.rotate(constrained);
        }
        return target;
    }

    public void computeBoundingBox(){
        min = new Vec(); max = new Vec();
        for(Vec v : vertices){
            if(v.x() < min.x()) min.setX(v.x());
            if(v.y() < min.y()) min.setY(v.y());
            if(v.z() < min.z()) min.setZ(v.z());
            if(v.x() > max.x()) max.setX(v.x());
            if(v.y() > max.y()) max.setY(v.y());
            if(v.z() > max.z()) max.setZ(v.z());
        }
    }


    //Compute centroid
    //TO DO: Choose a Visible point which works well for non convex Polygons
    public Vec computeVisiblePoint(){
        if(vertices.isEmpty()) return null;
        Vec centroid = new Vec();
        //Assume that every vertex lie in the sphere boundary
        for(Vec vertex : vertices){
            centroid.add(vertex);
        }
        centroid.normalize();
        return centroid;
    }

    public ArrayList<Vec> projectToUnitSphere(ArrayList<Vec> vertices){
        ArrayList<Vec> newVertices = new ArrayList<Vec>();
        for(Vec vertex : vertices){
            newVertices.add(vertex.normalize(new Vec()));
        }
        return newVertices;
    }

    public void doPrecomputations(){
        B = new ArrayList<Vec>();
        S = new ArrayList<Vec>();
        for(int i = 0; i < vertices.size(); i++){
            Vec p_i =  vertices.get(i);
            Vec p_j =  i + 1 == vertices.size() ? vertices.get(0) : vertices.get(i + 1);
            S.add(Vec.cross(visiblePoint, p_i, null));
            B.add(Vec.cross(p_i, p_j, null));
        }
    }

    public boolean isInside(Vec L){
        //1. Find i s.t p_i = S_i . L >= 0 and p_j = S_j . L < 0 with j = i + 1
        int index = 0;
        for(int i = 0; i < vertices.size(); i++){
            if(Vec.dot(S.get(i), L) >= 0 && Vec.dot(S.get((i + 1) % vertices.size()), L) < 0){
                index = i;
                break;
            }
        }
        return Vec.dot(B.get(index),L) >= 0;
    }

    public Vec closestPoint(Vec point){
        float minDist = 999999;
        Vec target = new Vec();
        for(int i = 0, j = vertices.size()-1; i < vertices.size(); j = i++){
            Vec projection;
            float dist;
            Vec v_i = vertices.get(i);
            Vec v_j = vertices.get(j);
            Vec edge = Vec.subtract(v_i, v_j);
            //Get distance to line
            float t = Vec.dot(edge, Vec.subtract(point, v_j));
            t /= edge.magnitude()*edge.magnitude();

            if(t < 0){
                dist = Vec.distance(v_j,point);
                projection = v_j.get();
            }else if(t > 1){
                dist = Vec.distance(v_i,point);
                projection = v_i.get();
            }else{
                projection = Vec.add(v_j, Vec.multiply(edge,t));
                dist = Vec.subtract(point, projection).magnitude();
            }
            if(dist < minDist){
                minDist = dist;
                target = projection;
            }
        }
        return target;
    }
}
