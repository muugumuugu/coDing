package camera3D.generators.util;

public class ColorVector {

    public float red;
    public float green;
    public float blue;

    public ColorVector() {
        this(0, 0, 0);
    }

    public ColorVector(float red, float green, float blue) {
        this.red = red;
        this.green = green;
        this.blue = blue;
    }

    public ColorVector add(ColorVector that) {
        ColorVector out = new ColorVector(red + that.red, green + that.green,
                blue + that.blue);

        return out;
    }
}
