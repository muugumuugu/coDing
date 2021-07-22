var vert = `

    precision highp float;

    // attributes, in
    attribute vec3 aPosition;
    attribute vec3 aNormal;
    attribute vec2 aTexCoord;

    // attributes, out
    varying vec3 var_vertPos;
    varying vec3 var_vertNormal;
    varying vec2 var_vertTexCoord;
    varying vec4 var_centerGlPosition;//原点
    
    // matrices
    uniform mat4 uModelViewMatrix;
    uniform mat4 uProjectionMatrix;
    uniform mat3 uNormalMatrix;

    void main() {
      vec3 pos = aPosition;
      vec4 posOut = uProjectionMatrix * uModelViewMatrix * vec4(pos, 1.0);
      //posOut.y *= -1.; //orthを入れるとなぜかこれが必要に。。。
      gl_Position = posOut;

      // set out value
      var_vertPos      = pos;
      var_vertNormal   =  aNormal;
      var_vertTexCoord = aTexCoord;
      var_centerGlPosition = uProjectionMatrix * uModelViewMatrix * vec4(0., 0., 0.,1.0);
    }
`;


var frag = `

precision highp float;

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;
uniform vec3 u_lightDir;
uniform vec3 u_col;
uniform mat3 uNormalMatrix;

//attributes, in
varying vec4 var_centerGlPosition;
varying vec3 var_vertNormal;




float random (in vec2 st) {
     highp float a = 12.9898;
    highp float b = 78.233;
    highp float c = 43758.5453;
    highp float dt= dot(st.xy ,vec2(a,b));
    highp float sn= mod(dt,3.14);
    return fract(sin(sn) * c);
}

float noise(vec2 st) {
    vec2 i = vec2(0.);
    i = floor(st);
    vec2 f = vec2(0.);
    f = fract(st);
    vec2 u =  vec2(0.);
    u = f*f*(3.0-2.0*f);
    return mix( mix( random( i + vec2(0.0,0.0) ),
                     random( i + vec2(1.0,0.0) ), u.x),
                mix( random( i + vec2(0.0,1.0) ),
                     random( i + vec2(1.0,1.0) ), u.x), u.y);
}

float grid(vec2 uv){
  uv *= 10.;
  uv = fract(uv);
  float v = uv.x >= 0. && uv.x < 0.1 || uv.y >= 0. && uv.y < 0.1 ? 1. : 0.;
  return v;
}

float gridGra(in vec2 uv , float gridNum){
    float scale = gridNum;
    uv *= scale;
    uv = fract(uv);
    float o = abs(uv.y + -0.5)*2.;
    o *= abs(uv.x + -0.5)*2.;
    return o;
}

void main() {
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    st.x *= u_resolution.x/u_resolution.y;

    vec2 centerPos = var_centerGlPosition.xy/var_centerGlPosition.w;//スクリーン変換
    centerPos = (centerPos + 1.0)*.5*2.;//gl_FragCoordと座標を合わせる pixelDensityによって係数が変化する
    centerPos.x *= u_resolution.x/u_resolution.y;//gl_FragCoordと座標を合わせる
    //centerPos.y *= -1.;//orthを入れるとなぜかこれが必要に。。。
    vec3 vertNormal = normalize(uNormalMatrix * var_vertNormal);
    float dot = dot(vertNormal,-normalize(u_lightDir));
    dot = (dot *.5) + .5;

    float noise1 = noise((st-centerPos)*500.);
    float noise2 = noise((st-centerPos)*1000.);
    float tone = step(noise1,dot);
    vec3 col = u_col * tone + (u_col-0.4) * (1.-tone);
    col += noise2*.1;

    gl_FragColor = vec4(col,1.0);
}

`;
