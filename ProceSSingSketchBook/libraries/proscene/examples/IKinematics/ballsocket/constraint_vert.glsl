uniform mat4 transform;

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;

varying vec4 vertColor;

uniform mat4 localMatrix;
uniform vec3 line; 
uniform vec3 rvec; 
uniform vec3 uvec; 
uniform vec4 limits; 
uniform vec4 constraintColor; 
varying vec4 npos;


void main() {
  gl_Position = transform * position;
  vertColor = color;
  npos = localMatrix * position;
}


