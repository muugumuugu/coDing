import processing.sound.*;
import processing.pdf.*;


String sound_file_name="/home/muku/Desktop/muSe/music/dream.mp3";


// coloring
int beat_color= #108053;
int background_color = #FFFFFF;

// *******************************

// Starting Position
Dot line_pointer =new Dot(0, 50);

// pen Position
Dot pen=new Dot(line_pointer.getX(), line_pointer.getY());

// size config
float line_width; // set acording to screen size
float line_height = 40;
float step_x = 1;

SoundFile file;
Amplitude amp;
float zoom = 40;
float current_amplitude = 0;

CurveDef wave = new CurveDef(line_pointer);

boolean record;
int i;
int durationtime;

void setup() {
  //Dim A 3 - 300dpi: 3508 x 4961 pxl
  size(500, 900);
  line_width = width;
  stroke(beat_color);
  background(background_color);
  file = new SoundFile(this, sound_file_name);
  println("File name: " + sound_file_name);
  println("File duration: " + file.duration());
  durationtime = millis() + (int) file.duration() * 1000 - 1000;
  file.play();
  amp=new Amplitude(this);
  amp.input(file);
  delay(500);
  beginRecord(PDF, "file"+month()+day()+hour()+minute()+second()+"_"+sound_file_name.substring(sound_file_name.lastIndexOf('\\')+1, sound_file_name.lastIndexOf('.'))+".pdf");
  record=true;
  i=0;
}

void draw() {
  // skip every second measurement
  i=(i+1)%2;  
  // start at a new line since old one is full
  if ((pen.getX()+step_x)%line_width==0) {
    // set linepointer up to next line
    line_pointer.setY(line_pointer.getY()+line_height);
    // set pen to beginning of next line
    pen.setX(0);
    pen.setY(line_pointer.getY());
    // interpolation to next line
    wave.moveAll(line_width, line_height);
    i+=10;
    //step_x = step_x + step_x*0.1;
  } else {
    // set x forward
    pen.setX(pen.getX()+step_x);
  }

  // set amplitude
  current_amplitude=zoom*amp.analyze()*-1;
  pen.setY(line_pointer.getY()+current_amplitude);
  
  // draw next stroke
  stroke(beat_color);
  strokeWeight(1);

  if (i==0)wave.addDot(pen);
  if (i==0)wave.drawCurve();
  
  // stop recording, one screen is clicked
  if (!record||millis()>durationtime) {
    endRecord();
    delay(50000);
  }
}

void mousePressed() {
  record=false;
}

void newLine() {
}

public class CurveDef {
  // draw and interpolate curves
  // uses a ring buffer
  Dot[] dots = new Dot[4];
  int pos = 0;

  public CurveDef(float start_x, float start_y) {
    dots[0] = new Dot(start_x, start_y);
    dots[1] = new Dot(start_x, start_y);
    dots[2] = new Dot(start_x, start_y);
    dots[3] = new Dot(start_x, start_y);
  }

  public CurveDef(Dot d) {
    dots[0] = new Dot(d.getX(), d.getY());
    dots[1] = new Dot(d.getX(), d.getY());
    dots[2] = new Dot(d.getX(), d.getY());
    dots[3] = new Dot(d.getX(), d.getY());
  }

  public void addDot(Dot d) {
    dots[(pos + 0) % 4].setX(d.getX());
    dots[(pos + 0) % 4].setY(d.getY());
    pos = (pos + 1) % 4;
  }

  public void drawCurve() {
    curve(dots[(pos + 0) % 4].getX(), dots[(pos + 0) % 4].getY(), dots[(pos + 1) % 4].getX(), dots[(pos + 1) % 4].getY(), dots[(pos + 2) % 4].getX(), dots[(pos + 2) % 4].getY(), dots[(pos + 3) % 4].getX(), dots[(pos + 3) % 4].getY());
  }

  public void reset(float start_x, float start_y) {
    for (Dot d : dots) {
      d.setX(0);
      d.setY(0);
    }
    pos = 0;
    dots[3].setX(start_x);
    dots[3].setY(start_y);
  }

  public void moveAll(float back_x, float forward_y) {
    for (Dot d : dots) {
      d.setX(d.getX() - back_x);
      d.setY(d.getY() + forward_y);
    }
  }
}

public class Dot {
  float x;
  float y;

  public Dot(float xn, float yn) {
    x = xn;
    y = yn;
  }

  public Dot() {
    x = 0;
    y = 0;
  }

  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }

  public void setX(float xn) {
    x = xn;
  }

  public void setY(float yn) {
    y = yn;
  }

  public void drawIt() {
    point(x, y);
  }
}
