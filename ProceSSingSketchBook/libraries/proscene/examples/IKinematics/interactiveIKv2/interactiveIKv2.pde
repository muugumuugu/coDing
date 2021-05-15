import processing.core.PApplet;
import processing.core.PGraphics;
import processing.core.PShape;
import remixlab.bias.event.DOF1Event;
import remixlab.bias.event.DOF2Event;
import remixlab.bias.event.MotionEvent;
import remixlab.dandelion.constraint.AxisPlaneConstraint;
import remixlab.dandelion.constraint.LocalConstraint;
import remixlab.dandelion.constraint.SphericalPolygon;
import remixlab.dandelion.core.Camera;
import remixlab.dandelion.core.GenericFrame;
import remixlab.dandelion.geom.Frame;
import remixlab.dandelion.geom.Quat;
import remixlab.dandelion.geom.Vec;
import remixlab.dandelion.ik.Solver;
import remixlab.proscene.InteractiveFrame;
import remixlab.proscene.Scene;

import java.util.ArrayList;

import static remixlab.proscene.MouseAgent.*;

/**
 * Created by sebchaparr on 20/10/17.
 */
Scene scene, auxScene;
PGraphics canvas, auxCanvas;
InteractiveShape interactiveShape;


//Kinematics and Inverse Kinematics Settings
InteractiveFrame target;
int num_joints = 8;
float boneLength = 15;
int TimesPerFrame = 1;
//------------------------------------------

//Visualization settings--------------------
int w = 1110;
int h = 510;
int oW = w/4;
int oH = h/3;
int oX = w - oW;
int oY = h - oH;
boolean showMiniMap  = true;
//------------------------------------------

public void settings() {
    size(w, h, P3D);
}

public void setup() {
    canvas = createGraphics(w, h, P3D);
    scene = new Scene(this,canvas);
    scene.setCameraType(Camera.Type.ORTHOGRAPHIC);
    scene.setAxesVisualHint(true);

    target = new InteractiveFrame(scene, "targetGraphics");
    target.translate(0, 0,0 );

    auxCanvas = createGraphics(oW, oH, P3D);
    auxScene = new Scene(this, auxCanvas, oX, oY);
    auxScene.setVisualHints(0);
    auxScene.setRadius(20);
    auxScene.showAll();

    ArrayList<GenericFrame> branchSphericalConstraints = generateChain(num_joints, boneLength, new Vec(scene.radius(), -scene.radius(), 0));
    //Sinus cone planar Polygon constraints

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
        //assign 1 Click Event
        ((InteractiveFrame)branchSphericalConstraints.get(i)).setClickBinding(LEFT, 1, "setCurrentFrame");
    }

    Solver solverSphericalConstraints = scene.setIKStructure(branchSphericalConstraints.get(0));
    scene.addIKTarget(branchSphericalConstraints.get(branchSphericalConstraints.size()-1), target);
    solverSphericalConstraints.setTIMESPERFRAME(TimesPerFrame);

    interactiveShape = new InteractiveShape(auxScene);
}

public void draw() {
    interactiveShape.updateShape();
    //Draw Constraints
    scene.beginDraw();
    canvas.background(0);
    canvas.lights();
    scene.drawFrames();
    for(InteractiveFrame frame : scene.frames()){
        if(frame.constraint() != null){
            canvas.pushMatrix();
            canvas.pushStyle();
            Frame reference = new Frame(frame.position(), Quat.compose(frame.orientation(), frame.rotation().inverse()));
            if(frame.constraint() instanceof SphericalPolygon){
                boolean current = interactiveShape.getIFrame() == frame;
                reference.rotate(((SphericalPolygon)frame.constraint()).getRestRotation());
                scene.applyWorldTransformation(reference);
                drawCone(canvas,((SphericalPolygon)frame.constraint()).getVertices(),boneLength,current);
            }
            canvas.popStyle();
            canvas.popMatrix();
        }
    }

    scene.endDraw();
    scene.display();
    if (showMiniMap) {
        auxScene.beginDraw();
        auxCanvas.background(125);
        auxScene.drawFrames();
        auxScene.endDraw();
        auxScene.display();
    }
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

public void setCurrentFrame(InteractiveFrame frame){
    if(frame.constraint() != null) {
        if (frame.constraint() instanceof SphericalPolygon) {
            interactiveShape.setIFrame(frame);
            interactiveShape.setVertices(((SphericalPolygon)frame.constraint()).getVertices());
        }
    }else{
        interactiveShape.setIFrame(null);
    }
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

public void drawCone(PGraphics pg, ArrayList<Vec> vertices, float scale, boolean current){
    pg.pushStyle();
    pg.noStroke();
    if(current) pg.fill(255,0,0,80);
    else pg.fill(246,117,19,80);
    fill(246,117,19,80);
    pg.beginShape(PApplet.TRIANGLE_FAN);
    pg.vertex(0, 0, 0);
    for (Vec v : vertices) {
        pg.vertex( scale*v.x(), scale*v.y(), scale*v.z());
    }
    if(!vertices.isEmpty()) pg.vertex( scale*vertices.get(0).x(), scale*vertices.get(0).y(), scale*vertices.get(0).z());
    pg.endShape();
    pg.popStyle();
}


//Required Auxiliar Classes
public static class InteractivePoint extends InteractiveFrame{
    InteractiveShape interactiveShape;
    float radius = 0.8f;


    public InteractivePoint(Scene scn) {
        super(scn);
    }

    public InteractivePoint(Scene scn, GenericFrame referenceFrame) {
        super(scn, referenceFrame);
    }

    public InteractivePoint(Scene scn, InteractiveShape interactiveShape) {
        super(scn, (GenericFrame) interactiveShape);
        this.interactiveShape = interactiveShape;
        this.setMotionBinding(RIGHT_ID, "customTranslate");
        PShape shape = scene().pApplet().createShape(SPHERE, radius);
        //shape.setStroke(scene().pApplet().color(255,0,0));
        //shape.setFill(scene().pApplet().color(255,0,0,100));
        setShape(shape);

    }

    public InteractivePoint(Scene scn, PShape ps) {
        super(scn, ps);
    }

    public InteractivePoint(Scene scn, GenericFrame referenceFrame, PShape ps) {
        super(scn, referenceFrame, ps);
    }

    public void customTranslate(MotionEvent event){
        DOF2Event dof2Event = MotionEvent.dof2Event(event, true);
        Vec vec = screenToVec(Vec.multiply(new Vec(isEyeFrame() ? -dof2Event.dx() : dof2Event.dx(),
                (gScene.isRightHanded() ^ isEyeFrame()) ? -dof2Event.dy() : dof2Event.dy(), 0.0f), this.translationSensitivity()));
        //Translation is allowed only on sphere
        vec.add(translation());
        vec.normalize();
        vec.multiply(interactiveShape.getRadius());
        setTranslation(vec);
        interactiveShape.setUpdate(true);
    }
}

public static class InteractiveShape extends InteractiveFrame{
    private ArrayList<InteractivePoint> vertices = new ArrayList<InteractivePoint>();
    private InteractiveFrame iFrame; //Current

    private float radius = 10.f;
    private boolean update = false;


    public InteractiveShape(Scene scn) {
        super(scn);
        setMotionBinding(WHEEL_ID, "changePolygon");
        this.setHighlightingMode(HighlightingMode.NONE);
        LocalConstraint constraint = new LocalConstraint();
        constraint.setTranslationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new Vec());
        this.setConstraint(constraint);
        PShape shape = scene().pApplet().createShape(SPHERE, radius);
        //shape.setStroke(false);
        //shape.setFill(scene().pApplet().color(0,255,50));
        this.setShape(shape);
        vertices = buildShape(10);
    }

    public InteractiveShape(Scene scn, GenericFrame referenceFrame) {
        super(scn, referenceFrame);
        this.setHighlightingMode(HighlightingMode.NONE);
        LocalConstraint constraint = new LocalConstraint();
        constraint.setTranslationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new Vec());
        this.setConstraint(constraint);
        vertices = buildShape(10);
    }

    public InteractiveShape(Scene scn, PShape ps) {
        super(scn, ps);
        this.setHighlightingMode(HighlightingMode.NONE);
        LocalConstraint constraint = new LocalConstraint();
        constraint.setTranslationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new Vec());
        this.setConstraint(constraint);
        vertices = buildShape(10);
    }

    public InteractiveShape(Scene scn, GenericFrame referenceFrame, PShape ps) {
        super(scn, referenceFrame, ps);
        this.setHighlightingMode(HighlightingMode.NONE);
        LocalConstraint constraint = new LocalConstraint();
        constraint.setTranslationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new Vec());
        this.setConstraint(constraint);
        vertices = buildShape(10);
    }

    public float getRadius() {
        return radius;
    }

    public void setRadius(float radius) {
        this.radius = radius;
    }

    public int getK(){
        return vertices.size();
    }

    public void setIFrame(InteractiveFrame iFrame){
        this.iFrame = iFrame;
    }

    public InteractiveFrame getIFrame(){
        return iFrame;
    }

    //Create a Regular Polygon with K vertices
    public ArrayList<InteractivePoint> buildShape(int k){
        ArrayList<InteractivePoint> vertices = new ArrayList<InteractivePoint>();
        float step = radians(360.f/k);
        for(int i = 0; i < k; i++){
            float theta = step*i;
            InteractivePoint vertex = new InteractivePoint(scene(),this);
            Vec vec = new Vec(radius*cos(theta),radius*sin(theta),2*radius);
            vec.normalize();
            vec.multiply(radius);
            vertex.setTranslation(vec);
            vertices.add(vertex);
        }
        update = true;
        return vertices;
    }

    public void removeVertices(){
        for(InteractiveFrame vertex : vertices){
            scene().mouseAgent().removeGrabber(vertex);
            scene().pruneBranch(vertex);
        }
    }

    //Must be called each time the Shape is Modified
    public void updateShape(){
        if(!update) return;
        updateIFrame();
        update = false;
    }

    public boolean requireUpdate(){
        return update;
    }

    public void setUpdate(boolean update){
        this.update = update;
    }

    public void addPoint(int times){
        removeVertices();
        vertices = buildShape(getK() + times);
        updateShape();
    }

    public void removePoint(int times){
        if(getK() <= 3) return;
        removeVertices();
        vertices = buildShape(getK() - times);
        updateShape();
    }

    public void changePolygon(DOF1Event dof1Event ){
        if(dof1Event.dx() > 0) addPoint((int) dof1Event.dx());
        else{
            removePoint((int) -dof1Event.dx());
        }
    }

    public void updateIFrame(){
        if(iFrame != null)
            ((SphericalPolygon) iFrame.constraint()).setVertices(getVertices());
    }

    public ArrayList<Vec> getVertices(){
        ArrayList<Vec> vertices = new ArrayList<Vec>();
        for(InteractivePoint point : this.vertices){
            vertices.add(point.translation().get());
        }
        return vertices;
    }

    public void setVertices(ArrayList<Vec> vertices){
        if(vertices.size() < 3) return;
        removeVertices();
        this.vertices = new ArrayList<InteractivePoint>();
        for(Vec vec : vertices){
            InteractivePoint vertex = new InteractivePoint(scene(),this);
            vertex.setPosition(Vec.multiply(vec, radius));
            scene().mouseAgent().addGrabber(vertex);
            this.vertices.add(vertex);
        }
        update = true;
    }
}
