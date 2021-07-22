boolean mode=false;
//true for encode false for decode
void setup(){
	if(mode){
		String[] loaded=loadStrings("../in.txt");
		String message="";
		for(int i=0;i<loaded.length;++i)
			{
			message+=loaded[i]+"\n";
			}
		int l=ceil(message.length()*0.25);
		l=ceil(sqrt(l));
		PImage img=createImage(l,l,ARGB);
		img.loadPixels();
		for(int i=0;i<img.pixels.length;++i)
			{
			int b1=0,b2=0,b3=0,b4=0;
			try
			{b1=((int)message.charAt(i*4))&255;
			b2=((int)message.charAt(i*4+1))&255;
			b3=((int)message.charAt(i*4+2))&255;
			b4=((int)message.charAt(i*4+3))&255;
			}
			catch(Exception e){}
			img.pixels[i]=(b1<<24)+(b2<<16)+(b3<<8)+b4;
			}
		img.updatePixels();
		img.save("out.png");
		}
	else
		{
		PImage img=loadImage("../out.png");
		String[] out={""};
		img.loadPixels();
		String c1,c2,c3,c4;
		for(int i=0;i<img.pixels.length;++i)
			{
			if(img.pixels[i]==0)break;
			c1=(char)((img.pixels[i]>>>24)&255)+"";
			c2=(char)((img.pixels[i]>>>16)&255)+"";
			c3=(char)((img.pixels[i]>>>8)&255)+"";
			c4=(char)((img.pixels[i])&255)+"";
			out[0]+=c1+c2+c3+c4;
			}
		println(out[0]);
		saveStrings("out.txt",out);
		}
	exit();
}
