
/*
 * Easing Functions - inspired from http://gizma.com/easing/
 * only considering the t value for the range [0, 1] => [0, 1]
 */

class EasingFunctions{
  int index;
  EasingFunctions(){
    this.index=1;
  }
  // no easing, no acceleration
  float linear(float t){return t; }
  // accelerating from zero velocity
  float easeInQuad(float t){ return t*t;}
  // decelerating to zero velocity
  float easeOutQuad(float t){ return t * (2 - t);}
  // acceleration until halfway, then deceleration
  float easeInOutQuad(float t){ if (t < 0.5){return 2 * t * t ;} else{ return -1 + (4 - 2 * t) * t;}}
  // accelerating from zero velocity 
  float easeInCubic(float t){ return t * t * t;}
  // decelerating to zero velocity 
  float easeOutCubic(float t){ return (t-1) * (t-1) * (t-1) + 1;}
  // acceleration until halfway, then deceleration 
 float  easeInOutCubic(float t){ if (t <0.5){return 4 * t * t * t; }else{return (t - 1) * (2 * t - 2) * (2 * t - 2) + 1;}}
  // accelerating from zero velocity 
  float easeInQuart(float t){return t * t * t * t;}
  // decelerating to zero velocity 
  float easeOutQuart(float t){ return 1 - (t-1) * (t-1) * (t-1) *(t-1) ;}
  // acceleration until halfway, then deceleration
  float easeInOutQuart(float t){if( t < 0.5){return 8 * t * t * t * t ;} else{return 1 - 8 * (t-1) * (t-1) * (t-1) *(t-1) ;}}
  // accelerating from zero velocity
  float easeInQuint(float t){return t * t * t * t * t;}
  // decelerating to zero velocity
  float easeOutQuint(float t){return 1 + (t-1) * (t-1) * (t-1) *(t-1) * (t-1);}
  // acceleration until halfway, then deceleration 
  float easeInOutQuint(float t){if  (t < 0.5 ){return 16 * t * t * t * t * t;} else{return 1 + 16 * (t-1) * (t-1) * (t-1) *(t-1) * (t-1);}}
}


/* 
ES6 js arrow notation.
 EasingFunctions = {
  // no easing, no acceleration
  linear =: t=> t,
  // accelerating from zero velocity
  easeInQuad: t => t * t,
  // decelerating to zero velocity
  easeOutQuad: t => t * (2 - t),
  // acceleration until halfway, then deceleration
  easeInOutQuad: t => t < .5 ? 2 * t * t : -1 + (4 - 2 * t) * t,
  // accelerating from zero velocity 
  easeInCubic: t => t * t * t,
  // decelerating to zero velocity 
  easeOutCubic: t => (--t) * t * t + 1,
  // acceleration until halfway, then deceleration 
  easeInOutCubic: t => t < .5 ? 4 * t * t * t : (t - 1) * (2 * t - 2) * (2 * t - 2) + 1,
  // accelerating from zero velocity 
  easeInQuart: t => t * t * t * t,
  // decelerating to zero velocity 
  easeOutQuart: t => 1 - (--t) * t * t * t,
  // acceleration until halfway, then deceleration
  easeInOutQuart: t => t < .5 ? 8 * t * t * t * t : 1 - 8 * (--t) * t * t * t,
  // accelerating from zero velocity
  easeInQuint: t => t * t * t * t * t,
  // decelerating to zero velocity
  easeOutQuint: t => 1 + (--t) * t * t * t * t,
  // acceleration until halfway, then deceleration 
  easeInOutQuint: t => t < .5 ? 16 * t * t * t * t * t : 1 + 16 * (--t) * t * t * t * t
}
*/
