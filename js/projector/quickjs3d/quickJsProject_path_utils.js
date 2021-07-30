// This file implements helpers related to creating / modifying Paths.

quickJsProject.PathUtils = (function() {

  // Make a line (a straight cubic bezier curve) from |p0| to |p1|.
  function makeLine(p0, p1) {
    var path = new quickJsProject.Path();
    path.points = [
      {x: p0.x, y: p0.y, z: p0.z},
      {x: p1.x, y: p1.y, z: p1.z}];
    path.curves = [new quickJsProject.Curve(1, 1, 1)];
    path.starting_point = 0;
    return path;
  }

  // Make a circle (consisting of two cublic splines) with points
  // (0, 0, 0) to (0, 1, 0);
  // http://www.whizkidtech.redprince.net/bezier/circle/
  // http://www.tinaja.com/glib/ellipse4.pdf
  function makeCircle() {
    var kKappa = 0.66666666666;  // Circle via 2 cubic splines.

    var path = new quickJsProject.Path();
    path.points = [
      {x: 0, y: kKappa,  z: 0},
      {x: 1, y: kKappa,  z: 0},
      {x: 1, y: 0,       z: 0},
      {x: 1, y: -kKappa, z: 0},
      {x: 0, y: -kKappa, z: 0},
      {x: 0, y: 0,       z: 0}
    ];
    path.curves = [
      new quickJsProject.Curve(2, 0, 1),
      new quickJsProject.Curve(5, 3, 4)
    ];
    return path;
  }

  // Make a spiral, with |count| rings.  Each ring moves -0.1 along the z-axis.
  function makeSpiral(count) {
    var kKappa = 0.66666666666;  // Circle via 2 cubic splines.

    var points = [ ];
    var curves = [ ];

    var z = 0;
    var p = 0;
    for (var i = 0; i < count; ++i) {
      points.push({x: 0, y: kKappa,  z: z});
      z -= 0.05;
      points.push({x: 1, y: kKappa,  z: z});
      points.push({x: 1, y: 0,       z: z});
      points.push({x: 1, y: -kKappa, z: z});
      z -= 0.05;
      points.push({x: 0, y: -kKappa, z: z});
      points.push({x: 0, y: 0,       z: z});
      curves.push(new quickJsProject.Curve(p + 2, p + 0, p + 1));
      curves.push(new quickJsProject.Curve(p + 5, p + 3, p + 4));
      p += 6;
    }

    var path = new quickJsProject.Path();
    path.points = points;
    path.curves = curves;
    return path;
  }

  // Fits a quadratic bezier curve evenly through 3 points.  Returns a control
  // point that forms a quadratic bezier (with end points p0 and p2) that
  // crosses through p1 at t=0.5. The time value 0.5 is hardcoded / implicit to
  // simplify the calculation.
  function fitQuadraticToPoints(p0, p1, p2) {
    return {
        x: p1.x + p1.x - 0.5 * (p0.x + p2.x),
        y: p1.y + p1.y - 0.5 * (p0.y + p2.y),
        z: p1.z + p1.z - 0.5 * (p0.z + p2.z)};
  }

  return {
    makeLine: makeLine,
    makeCircle: makeCircle,
    makeSpiral: makeSpiral,
    fitQuadraticToPoints: fitQuadraticToPoints
  };
})();
