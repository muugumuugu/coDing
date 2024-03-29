import beads.*;
import java.util.Arrays; 

AudioContext ac;

void setup() {
  size(300,300);

  /*
   * As we are using the defaultcontext, there is no longer
   * a need to create an AudioContext object. For simplicity's sake,
   * we'll just give the defaultcontext a local name, and access it
   * it using 'ac'.
   */
  ac = AudioContext.getDefaultContext();
  /*
   * This is an Envelope. It can be used to modify
   * the behaviour of other UGen object. We need to
   * do this to get precise control of certain parameters
   * at an audio rate.
   *
   * When using defaultcontexts, we no longer need to pass 
   * in an explicit AudioContext when constructing new UGens. 
   * Note that if you use a custom AudioContext, you will need
   * pass it into the constructor of each UGen.
   */
  Envelope freqEnv = new Envelope(500);
  /*
   * This is a WavePlayer. Here we've set it up using 
   * the above Envelope, and a SineBuffer. We'll use
   * the Envelope to modify the freqency below.
   */
  WavePlayer wp = new WavePlayer(freqEnv, Buffer.SINE);
  /*
   * So now that the WavePlayer is set up with the 
   * frequency Envelope, do stuff with the frequency
   * envelope. This command tells the Envelope to change
   * to 1000 in 1 second. Note that when we made the Envelope
   * it was set to 500, so the transition goes from 500 to
   * 1000. These control the frequency of the WavePlayer
   * in Hz.
   */
  freqEnv.addSegment(1000, 1000);
  /*
   * Connect it all together as before.
   */
  Gain g = new Gain(1, 0.1);
  g.addInput(wp);

  /*
   * We will still need to attach all the UGens to the output
   * of the defaultcontext and make it start running in order
   * for audio to play. We can do this the same way as before.
   */
  ac.out.addInput(g);
  ac.start();
}

/*
 * Here's the code to draw a scatterplot waveform.
 * The code draws the current buffer of audio across the
 * width of the window. To find out what a buffer of audio
 * is, read on.
 * 
 * Start with some spunky colors.
 */
color fore = color(255, 102, 204);
color back = color(0,0,0);

/*
 * Just do the work straight into Processing's draw() method.
 */
void draw() {
  loadPixels();
  //set the background
  Arrays.fill(pixels, back);
  //scan across the pixels
  for(int i = 0; i < width; i++) {
    //for each pixel work out where in the current audio buffer we are
    int buffIndex = i * ac.getBufferSize() / width;
    //then work out the pixel height of the audio data at that point
    int vOffset = (int)((1 + ac.out.getValue(0, buffIndex)) * height / 2);
    //draw into Processing's convenient 1-D array of pixels
    vOffset = min(vOffset, height);
    pixels[vOffset * width + i] = fore;
  }
  updatePixels();
}
