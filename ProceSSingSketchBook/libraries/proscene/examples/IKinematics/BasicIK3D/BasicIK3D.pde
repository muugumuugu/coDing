import processing.core.*;
import remixlab.dandelion.constraint.*;
import remixlab.dandelion.core.*;
import remixlab.dandelion.geom.*;
import remixlab.dandelion.ik.Solver;
import remixlab.proscene.*;

import java.util.ArrayList;

/*
* Tree different chains (With different kind of constraints) are pursuing the same Target
* */

Scene scene;
InteractiveFrame target;

int num_joints = 8;

//Ball and Socket
float constraint_factor_x = 50;
float constraint_factor_y = 50;

float boneLength = 15;

int TimesPerFrame = 1;


public void settings() {
    size(700, 700, P3D);
}

public void setup() {
    scene = new Scene(this);
    scene.setCameraType(Camera.Type.ORTHOGRAPHIC);
    scene.setAxesVisualHint(true);

    target = new InteractiveFrame(scene, "targetGraphics");
    target.translate(0, 0,0 );

    //Four identical chains that will have different constraints
    ArrayList<GenericFrame> branchUnconstrained = generateChain(num_joints, boneLength, new Vec(-scene.radius(), -scene.radius(), 0));
    ArrayList<GenericFrame> branchEllipseConstraint = generateChain(num_joints, boneLength, new Vec(-scene.radius(), scene.radius(), 0));
    ArrayList<GenericFrame> branchPlanarConstraints = generateChain(num_joints, boneLength, new Vec(scene.radius(), -scene.radius(), 0));
    ArrayList<GenericFrame> branchSphericalConstraints = generateChain(num_joints, boneLength, new Vec(scene.radius(), scene.radius(), 0));

    //Apply Constraints

    //Spherical Ellipse Constraints
    for (int i = 1; i < branchEllipseConstraint.size()-1; i++) {
        BallAndSocket constraint = new BallAndSocket(radians(constraint_factor_y), radians(constraint_factor_y), radians(constraint_factor_x), radians(constraint_factor_x));
        constraint.setRestRotation((Quat) branchEllipseConstraint.get(i).rotation().get());
        branchEllipseConstraint.get(i).setConstraint(constraint);
    }

    //Sinus cone planar Polygon constraints

    //Define the Base (Any Polygon in clockwise or Counterclockwise order)
    ArrayList<Vec> vertices = new ArrayList<Vec>();
    vertices.add(new Vec(-10,-10));
    vertices.add(new Vec(10,-10));
    vertices.add(new Vec(10, 10));
    vertices.add(new Vec(-10,10));

    for (int i = 1; i < branchPlanarConstraints.size()-1; i++) {
        PlanarPolygon constraint = new PlanarPolygon(vertices);
        constraint.setHeight(boneLength/2.f);
        constraint.setRestRotation((Quat) branchPlanarConstraints.get(i).rotation().get());
        branchPlanarConstraints.get(i).setConstraint(constraint);
    }

    //Define the Base (Any Polygon in Counterclockwise order)
    ArrayList<Vec> verticesSpherical = new ArrayList<Vec>();
    int numVertices = 12;
    for(int i = 0; i < numVertices; i++){
        float step = i*(2*PI/(float)numVertices);
        verticesSpherical.add(new Vec(cos(step),sin(step), random(0,1)));
    }

    for (int i = 1; i < branchSphericalConstraints.size()-1; i++) {
        SphericalPolygon constraint = new SphericalPolygon(verticesSpherical);
        constraint.setRestRotation((Quat) branchSphericalConstraints.get(i).rotation().get());
        branchSphericalConstraints.get(i).setConstraint(constraint);
    }

    Solver solverUnconstrained = scene.setIKStructure(branchUnconstrained.get(0));
    scene.addIKTarget(branchUnconstrained.get(branchUnconstrained.size()-1), target);
    solverUnconstrained.setTIMESPERFRAME(TimesPerFrame);

    Solver solverEllipseConstraint = scene.setIKStructure(branchEllipseConstraint.get(0));
    scene.addIKTarget(branchEllipseConstraint.get(branchEllipseConstraint.size()-1), target);
    solverEllipseConstraint.setTIMESPERFRAME(TimesPerFrame);

    Solver solverPlanarConstraints = scene.setIKStructure(branchPlanarConstraints.get(0));
    scene.addIKTarget(branchPlanarConstraints.get(branchPlanarConstraints.size()-1), target);
    solverPlanarConstraints.setTIMESPERFRAME(TimesPerFrame);

    Solver solverSphericalConstraints = scene.setIKStructure(branchSphericalConstraints.get(0));
    scene.addIKTarget(branchSphericalConstraints.get(branchSphericalConstraints.size()-1), target);
    solverSphericalConstraints.setTIMESPERFRAME(TimesPerFrame);
}

public ArrayList<GenericFrame> generateChain(int num_joints, float boneLength, Vec translation){
    InteractiveFrame prevFrame = null;
    InteractiveFrame chainRoot = null;
    for (int i = 0; i < num_joints; i++) {
        InteractiveFrame iFrame;
        iFrame = new InteractiveFrame(scene, "frameGraphics");
        if (i == 0)
            chainRoot = iFrame;
        if (prevFrame != null) iFrame.setReferenceFrame(prevFrame);
        Vec translate = new Vec(1, 1, 1);
        translate.normalize();
        translate.multiply(boneLength);
        iFrame.setTranslation(translate);
        iFrame.setPickingPrecision(InteractiveFrame.PickingPrecision.FIXED);
        prevFrame = iFrame;
    }
    //Consider Standard Form: Parent Z Axis is Pointing at its Child
    chainRoot.setTranslation(translation);
    chainRoot.setupHierarchy();
    return scene.branch(chainRoot, false);
}

public void frameGraphics(InteractiveFrame iFrame, PGraphics pg) {
    pg.pushStyle();
    scene.drawAxes(pg, 3);
    pg.fill(0, 255, 0);
    pg.strokeWeight(5);
    pg.stroke(0, 100, 100, 100);
    if (iFrame.referenceFrame() != null) {
        Vec v = iFrame.coordinatesOfFrom(new Vec(), iFrame.referenceFrame());
        if(pg.is2D())
            pg.line(0, 0, v.x(), v.y());
        else
            pg.line(0, 0, 0, v.x(), v.y(), v.z());

    }
    pg.popStyle();
}

public void targetGraphics(PGraphics pg) {
    pg.pushStyle();
    pg.noStroke();
    pg.fill(255, 0, 0, 200);
    if(pg.is2D())
        pg.ellipse(0, 0, 5, 5);
    else
        pg.sphere(5);
    pg.popStyle();
}


public void draw() {
    background(0);
    lights();
    //Draw Constraints
    for(InteractiveFrame frame : scene.frames()){
        frame.draw();
        if(frame.constraint() != null){
            pushMatrix();
            pushStyle();
            Frame reference = new Frame(frame.position(), Quat.compose(frame.orientation(), frame.rotation().inverse()));
            if(frame.constraint() instanceof BallAndSocket){
                reference.rotate(((BallAndSocket)frame.constraint()).getRestRotation());
                scene.applyWorldTransformation(reference);
                drawCone(boneLength/2.f, (boneLength/2.f)*tan(radians(constraint_factor_x)), (boneLength/2.f)*tan(radians(constraint_factor_y)), 20);
            }else if(frame.constraint() instanceof PlanarPolygon){
                reference.rotate(((PlanarPolygon)frame.constraint()).getRestRotation());
                scene.applyWorldTransformation(reference);
                drawCone(((PlanarPolygon)frame.constraint()).getHeight(),((PlanarPolygon)frame.constraint()).getVertices());
            }else if(frame.constraint() instanceof SphericalPolygon){
                reference.rotate(((SphericalPolygon)frame.constraint()).getRestRotation());
                scene.applyWorldTransformation(reference);
                drawCone(((SphericalPolygon)frame.constraint()).getVertices(),boneLength);
            }
            popStyle();
            popMatrix();
        }
    }
}

public void drawCone(float height, float a, float b, int detail){
    float x[] = new float[detail + 1];
    float y[] = new float[detail + 1];

    for (int i = 0; i <= detail; i++) {
        float theta = PApplet.TWO_PI * i / detail;
        float r = a*b/(float)(Math.sqrt(b*b*Math.cos(theta)*Math.cos(theta) + a*a*Math.sin(theta)*Math.sin(theta)));
        x[i] = r * (float) Math.cos(theta);
        y[i] = r * (float) Math.sin(theta);
    }
    pushStyle();
    noStroke();
    fill(246,117,19,80);
    beginShape(PApplet.TRIANGLE_FAN);
    vertex(0, 0, 0);
    for (int i = 0; i <= detail; i++) {
        vertex( x[i], y[i], height);
    }
    endShape(CLOSE);
    popStyle();
}

public void drawCone(float height, ArrayList<Vec> vertices){
    pushStyle();
    noStroke();
    fill(246,117,19,80);
    beginShape(PApplet.TRIANGLE_FAN);
    vertex(0, 0, 0);
    for (Vec v : vertices) {
        vertex( v.x(), v.y(), height);
    }
    if(!vertices.isEmpty()) vertex( vertices.get(0).x(), vertices.get(0).y(), height);
    endShape();
    popStyle();
}

public void drawCone(ArrayList<Vec> vertices, float scale){
    pushStyle();
    noStroke();
    fill(246,117,19,80);
    beginShape(PApplet.TRIANGLE_FAN);
    vertex(0, 0, 0);
    for (Vec v : vertices) {
        vertex( scale*v.x(), scale*v.y(), scale*v.z());
    }
    if(!vertices.isEmpty()) vertex( scale*vertices.get(0).x(), scale*vertices.get(0).y(), scale*vertices.get(0).z());
    endShape();
    popStyle();
}
