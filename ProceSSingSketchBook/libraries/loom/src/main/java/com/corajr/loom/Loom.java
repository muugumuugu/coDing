/**
 * Loom
 * Patterns that change over time, flexibly mapped to audiovisual output.
 * http://corajr.github.io/loom
 *
 * Copyright (c) 2014-2016 Cora Johnson-Roberson http://www.corajr.com
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place, Suite 330,
 * Boston, MA  02111-1307  USA
 * 
 * @author      Cora Johnson-Roberson http://www.corajr.com
 * @modified    10/09/2016
 * @version     1.0.0 (1)
 */

package com.corajr.loom;

import java.io.File;
import java.io.IOException;

import javax.sound.midi.MidiMessage;

import org.apache.commons.math3.fraction.BigFraction;

import com.corajr.loom.time.*;
import com.corajr.loom.wrappers.*;

import processing.core.*;

/**
 * A <code>Loom</code> holds all of the {@link Pattern}s associated with the
 * user's sketch, and provides facilities to play or record the output of
 * patterns at the desired rate. By default, it uses a {@link RealTimeScheduler}
 * with a period of 1000 milliseconds.
 * 
 * @example Hello
 * 
 */

public class Loom {
	public PApplet myParent;

	public PatternCollection patterns = new PatternCollection();

	private final Scheduler scheduler;

	public OscP5Wrapper oscP5Wrapper = new OscP5Wrapper();
	public MidiBusWrapper midiBusWrapper = new MidiBusWrapper();

	public final static String VERSION = "1.0.0";

	public final static String WELCOME_MESSAGE = "Loom 1.0.0 by Cora Johnson-Roberson http://www.corajr.com";

	/**
	 * a Constructor, usually called in the setup() method in your sketch to
	 * initialize and start the library.
	 * 
	 * @example Hello
	 * @param theParent
	 */
	public Loom(PApplet theParent) {
		this(theParent, new RealTimeScheduler(), 1000L);
	}

	public Loom(PApplet theParent, Scheduler scheduler) {
		this(theParent, scheduler, 1000L);
	}

	public Loom(PApplet theParent, int bpm) {
		this(theParent, new RealTimeScheduler(), bpmToPeriod(bpm));
	}

	/**
	 * Constructor for a new Loom with a particular type of scheduling
	 * 
	 * @param theParent
	 *            parent Processing sketch
	 * @param theScheduler
	 *            real-time or non-real-time scheduler
	 * @param periodMillis
	 *            the cycle period in milliseconds
	 */
	public Loom(PApplet theParent, Scheduler theScheduler, long periodMillis) {
		myParent = theParent;
		scheduler = theScheduler;
		scheduler.setPatterns(patterns);
		scheduler.setPeriod(periodMillis);
		welcome();
	}

	private void welcome() {
		if (!WELCOME_MESSAGE.startsWith("##")) // don't print while testing
			System.out.println(WELCOME_MESSAGE);
	}

	/**
	 * return the version of the library.
	 * 
	 * @return String
	 */
	public static String version() {
		return VERSION;
	}

	public BigFraction getNow() {
		return scheduler.getNow();
	}

	public Interval getCurrentInterval() {
		return scheduler.getCurrentInterval();
	}

	public void play() {
		scheduler.play();
	}

	public void pause() {
		scheduler.pause();
	}

	public void stop() {
		scheduler.stop();
	}

	/**
	 * Records both OSC and MIDI events, to files in the sketch's data folder
	 * with the prefixes "osc" and "midi" respectively.
	 * 
	 * @throws IOException
	 */
	public void record() throws IOException {
		record("osc", "midi");
	}

	/**
	 * Record OSC events to the specified filename in the data folder of the
	 * sketch.
	 * 
	 * @param oscFilename
	 *            the binary OSC score filename
	 * 
	 */
	public void recordOsc(String oscFilename) {
		record(oscFilename, null);
	}

	public void recordMidi(String midiFilename) {
		record(null, midiFilename);
	}

	public void record(String oscFilename, String midiFilename) {
		String timestamp = Long.toString(System.currentTimeMillis());

		File oscFile = null;
		File midiFile = null;

		if (oscFilename != null) {
			if (oscFilename.endsWith(".osc")) {
				oscFile = myParent.saveFile(oscFilename);
			} else {
				oscFile = myParent.saveFile(oscFilename + timestamp + ".osc");
			}
		}

		if (midiFilename != null) {
			if (midiFilename.endsWith(".mid")) {
				midiFile = myParent.saveFile(midiFilename);
			} else {
				midiFile = myParent.saveFile(midiFilename + timestamp + ".mid");
			}
		}

		try {
			record(oscFile, midiFile);
		} catch (IOException e) {
			e.printStackTrace();
			throw new IllegalStateException(
					"Files could not be opened for recording!");
		}
	}

	public void record(File oscFile, File midiFile) throws IOException {
		if (oscFile != null)
			oscP5Wrapper = new OscP5Wrapper(this, oscFile);
		if (midiFile != null)
			midiBusWrapper = new MidiBusWrapper(this, midiFile);

		play();
	}

	public void setOscP5(oscP5.OscP5 oscP5) {
		oscP5Wrapper.set(new OscP5Impl(oscP5));
	}

	public void setMidiBus(themidibus.MidiBus midiBus) {
		midiBusWrapper.set(new MidiBusImpl(midiBus));
	}

	public void draw() {
		for (Pattern pattern : patterns) {
			pattern.draw();
		}
	}

	private static double periodToBpm(long period) {
		return 240000.0 / period;
	}

	private static long bpmToPeriod(double bpm) {
		return (long) (240000.0 / bpm);
	}

	public double getBPM() {
		return periodToBpm(getPeriod());
	}

	public void setBPM(double bpm) {
		setPeriod(bpmToPeriod(bpm));
	}

	public long getPeriod() {
		return scheduler.getPeriod();
	}

	public void setPeriod(long millis) {
		scheduler.setPeriod(millis);
	}

	public BigFraction getMinimumResolution() {
		return scheduler.getMinimumResolution();
	}

	public void midiMessage(MidiMessage theMidiMessage) {
		// MidiTools.printMidi(theMidiMessage);
	}

	public void rawMidi(byte[] raw) {
		// MidiTools.printMidiRaw(raw);
	}

	public PApplet getParent() {
		return myParent;
	}

	public void dispose() {
		oscP5Wrapper.dispose();
		midiBusWrapper.dispose();
	}
}