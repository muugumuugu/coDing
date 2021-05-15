#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform float fraction;

varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;
uniform mat4 localMatrix;
uniform vec3 line; 
uniform vec3 rvec; 
uniform vec3 uvec; 
uniform vec4 limits; 
uniform vec4 constraintColor; 
varying vec4 npos;


void main() {
  vec3 new_pos = vec3(npos[0], npos[1], npos[2]);
  vec3 rightvec = distance(new_pos, rvec) < 
  	distance(new_pos, -1*rvec) ? rvec : -1*rvec;
  vec3 upvec = distance(new_pos, uvec) < 
  	distance(new_pos, -1*uvec) ? uvec : -1*uvec;			  

  vec3 f = vec3(new_pos);
  float scalar = dot(new_pos, line)/length(line); 
  vec3 proj = scalar*line;
  vec3 adjust = new_pos - proj;
  if(scalar < 0){
	  proj = -1*proj;
  }
  
  float xaspect = dot(adjust, rightvec);
  float yaspect = dot(adjust, upvec);
  			  
  //get the cross section of the cone
  float left 	= -(length(proj)*  tan(limits[0]));
  float right 	= (length(proj)*  tan(limits[1]));
  float up 		= (length(proj)*  tan(limits[2]));
  float down 	= -(length(proj)*  tan(limits[3]));
  
  float xbound = xaspect >= 0 ? right : left;
  float ybound = yaspect >= 0 ? up : down;

  
  float ellipse = (xaspect*xaspect)/(xbound*xbound) + (yaspect*yaspect)/(ybound*ybound);
	//color = vec4(1,0,0,0.5);
  if(length(proj) > 0 && !(ellipse <= 1 && scalar >= 0))
	gl_FragColor = vertColor;
  else
    gl_FragColor =  constraintColor;
}
