# transformations
## main functions
+ translate
    + useful to centre entire system around a given point. basically shifts `orgin`
+ rotate
    + uses radians and rotates co-ordinate **pivoting @ origin** , along Z axis.(by default pointing outward.)
+ scale
    + scales/multiplies the units on the axes. even direction  `flipp` by -ve values.
+ _push_
    + *save* current cordinate `matrix` and also   `styles` info
+ _pop_
    + *reload* the temp stored coord `matrix` n `styles`.

### abt the functioning
> drawings are based relative to origin, which is initially @ **top left corner**

> however, translate ***accumulates***. once done, it stays there and that point is considered origin. And then it  _resets @ draw_

> rotate also behaves the same ***accumulating*** way,  _reseting @ draw_

> scale is *not relative*, it just means how many pixels is 1 unit. and signs for direction.

> origin's coordinates are also **relative** to current running origin

> co-ordinate system is **left handed**, so angles _clockwise_, and y increases downward.

> push n pop are lil staccks , so the pushing popping is **LIFO**

> rotateX,rotateY,rotateZ are specific axis rotn for WEBGL 3d renderer

> applyMatrix() will apply a co-ordinate transform.