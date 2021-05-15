import wellen.*; 


BeatEvent mBeatA;

BeatEvent mBeatB;

BeatEvent mBeatC;

Loop mLoopA;

Loop mLoopB;

Loop mLoopC;

void settings() {
    size(640, 480);
}

void setup() {
    noStroke();
    Tone.start();
    mBeatA = BeatEvent.create(120);
    mBeatB = BeatEvent.create(140);
    mBeatC = BeatEvent.create(160);
    mLoopA = new Loop(0, Note.NOTE_C4);
    mBeatA.add(mLoopA);
    mLoopB = new Loop(1, Note.NOTE_C4 + 4);
    mBeatB.add(mLoopB);
    mLoopC = new Loop(2, Note.NOTE_C4 + 7);
    mBeatC.add(mLoopC);
}

void draw() {
    background(255);
    fill(0);
    if (mLoopA.playing) {
        ellipse(width * 0.25f, height * 0.5f, width * 0.15f, width * 0.15f);
    }
    if (mLoopB.playing) {
        ellipse(width * 0.5f, height * 0.5f, width * 0.15f, width * 0.15f);
    }
    if (mLoopC.playing) {
        ellipse(width * 0.75f, height * 0.5f, width * 0.15f, width * 0.15f);
    }
}

static class Loop implements BeatListener {
    final int note;
    final int instrument;
    boolean playing;
    Loop(int pInstrument, int pNote) {
        note = pNote;
        instrument = pInstrument;
        playing = false;
    }
    
void beat(int pBeatCount) {
        Tone.instrument(instrument);
        if (pBeatCount % 2 == 0) {
            Tone.note_on(note, 50);
            playing = true;
        } else if (pBeatCount % 2 == 1) {
            Tone.note_off(note);
            playing = false;
        }
    }
}
