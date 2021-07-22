const url = 'sketchbook/files/forest-blk360_centered.ply';
//const url = 'https://raw.githubusercontent.com/cansik/p5js-pointcloud/master/data/forest-blk360_centered.ply';
const pointSize = 3.1;

var program, renderer;
var vertices = [];
var colors = [];

function setup() {
  renderer = createCanvas(windowWidth, windowHeight, WEBGL);
  
  const vert = `
  attribute vec3 aPosition;
  attribute vec3 aColor;

  // matrices
  uniform mat4 uModelViewMatrix;
  uniform mat4 uProjectionMatrix;

  varying vec4 color;

  void main() {
    gl_Position = uProjectionMatrix * uModelViewMatrix * vec4(aPosition, 1.0);
    gl_PointSize = ${pointSize};
    color = vec4(aColor, 1.0);
  }
  `;
  
  const frag = `
  #ifdef GL_ES
  precision highp float;
  #endif

  varying vec4 color;

  void main() {
    gl_FragColor = color;
  }
  `;
  
  //load shader
  var vs = drawingContext.createShader(drawingContext.VERTEX_SHADER);
  drawingContext.shaderSource(vs, vert);
  drawingContext.compileShader(vs);

  var fs = drawingContext.createShader(drawingContext.FRAGMENT_SHADER);
  drawingContext.shaderSource(fs, frag);
  drawingContext.compileShader(fs);

  //create shader
  program = drawingContext.createProgram();
  drawingContext.attachShader(program, vs);
  drawingContext.attachShader(program, fs);
  drawingContext.linkProgram(program);
  
  //validate shader
  if (!drawingContext.getShaderParameter(vs, drawingContext.COMPILE_STATUS)){
    console.log(drawingContext.getShaderInfoLog(vs));
  }

  if (!drawingContext.getShaderParameter(fs, drawingContext.COMPILE_STATUS)){
    console.log(drawingContext.getShaderInfoLog(fs));
  }

  if (!drawingContext.getProgramParameter(program, drawingContext.LINK_STATUS)){
    console.log(drawingContext.getProgramInfoLog(program));
  }
  
  //use shader
  drawingContext.useProgram(program);
  
  //create uniform pointers
  program.uModelViewMatrix = drawingContext.getUniformLocation(program, "uModelViewMatrix");
  program.uProjectionMatrix = drawingContext.getUniformLocation(program, "uProjectionMatrix");
  
  //enable attributes
  program.aPosition = drawingContext.getAttribLocation(program, "aPosition");
  drawingContext.enableVertexAttribArray(program.aPosition);
  
  program.aColor = drawingContext.getAttribLocation(program, "aColor");
  drawingContext.enableVertexAttribArray(program.aColor);
  
  //load data
  httpGet(url, 'text', function(response) {
    parsePointCloud(response, 2500, 0, 500, 0);

    console.log("data loaded: " + (vertices.length/3) + " points");
    
    //create buffers
    program.positionBuffer = drawingContext.createBuffer();
    drawingContext.bindBuffer(drawingContext.ARRAY_BUFFER, program.positionBuffer);
    drawingContext.bufferData(drawingContext.ARRAY_BUFFER, new Float32Array(vertices), drawingContext.STATIC_DRAW);

    program.colorBuffer = drawingContext.createBuffer();
    drawingContext.bindBuffer(drawingContext.ARRAY_BUFFER, program.colorBuffer);
    drawingContext.bufferData(drawingContext.ARRAY_BUFFER, new Float32Array(colors), drawingContext.STATIC_DRAW);
  });
}

function draw() {
  background(0);
  orbitControl();
  
  if(vertices.length == 0){
    return;
  }
  
  drawingContext.useProgram(program);
  
  drawingContext.bindBuffer(drawingContext.ARRAY_BUFFER, program.positionBuffer);
  drawingContext.vertexAttribPointer(program.aPosition, 3, drawingContext.FLOAT, false, 0, 0);
  
  drawingContext.bindBuffer(drawingContext.ARRAY_BUFFER, program.colorBuffer);
  drawingContext.vertexAttribPointer(program.aColor, 3, drawingContext.FLOAT, false, 0, 0);
  
  drawingContext.uniformMatrix4fv(program.uModelViewMatrix, false, renderer.uMVMatrix.mat4);
  drawingContext.uniformMatrix4fv(program.uProjectionMatrix, false, renderer.uPMatrix.mat4);
  
  drawingContext.drawArrays(drawingContext.POINTS, 0, vertices.length/3);
}
