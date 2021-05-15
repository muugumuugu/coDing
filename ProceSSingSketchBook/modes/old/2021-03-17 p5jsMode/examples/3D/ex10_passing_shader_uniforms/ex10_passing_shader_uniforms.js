/*
 * @name Passing Shader Uniforms
 * @description Uniforms are the way in which information is passed from p5 to the shader.
 * <br> To learn more about using shaders in p5.js: <a href="https://itp-xstory.github.io/p5js-shaders/">p5.js Shaders</a>
 */

 // this variable will hold our shader object
 let theShader;

 function preload(){
   // load the shader
   theShader = loadShader('data/uniforms.vert', 'assets/uniforms.frag');
 }

 function setup() {
   // shaders require WEBGL mode to work
   createCanvas(710, 400, WEBGL);
   noStroke();
 }

 function draw() {
   // shader() sets the active shader with our shader
   shader(theShader);

   // lets send the resolution, mouse, and time to our shader
   // before sending mouse + time we modify the data so it's more easily usable by the shader
   theShader.setUniform('resolution', [width, height]);
   theShader.setUniform('mouse', map(mouseX, 0, width, 0, 7));
   theShader.setUniform('time', frameCount * 0.01);

   // rect gives us some geometry on the screen
   rect(0,0,width, height);
 }
