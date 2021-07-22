
let vert = `
#ifdef GL_ES
  precision highp float;
  precision mediump int;
#endif

attribute vec3 aPosition;
attribute vec4 aVertexColor;
attribute vec3 aNormal;
attribute vec2 aTexCoord;

varying vec3 var_vertPos;
varying vec4 var_vertCol;
varying vec3 var_vertNormal;
varying vec2 var_vertTexCoord;

uniform mat4 uModelViewMatrix;
uniform mat4 uProjectionMatrix;
uniform mat3 uNormalMatrix;

uniform sampler2D tex0;
uniform float intensity;

void main() {
  vec3 pos = aPosition;

  vec4 col = texture2D(tex0, aTexCoord.xy);

  vec3 bri = vec3(0.2126, 0.7152, 0.0722);
  pos.z += dot(bri, vec3(col)) * intensity;

  gl_Position = uProjectionMatrix * uModelViewMatrix * vec4(pos, 1.0 );
  var_vertPos = aPosition;

  var_vertCol = aVertexColor;
  var_vertNormal = aNormal;
  var_vertTexCoord = aTexCoord;
}
`;

let frag = `
#ifdef GL_ES
precision mediump float;
#endif

varying vec2 var_vertTexCoord;

uniform vec2 iResolution;
uniform sampler2D tex0;
uniform sampler2D map;

void main(){
  vec2 uv = var_vertTexCoord;

  vec3 bri = vec3(0.2126, 0.7152, 0.0722);
  vec3 col = vec3(texture2D(tex0, uv.xy));  
  float intensity = dot(bri, col);

  vec4 mappedCol = texture2D(map, vec2(1.0-intensity, 0.0));

  gl_FragColor = vec4(vec3(mappedCol), 1.0);
}`
