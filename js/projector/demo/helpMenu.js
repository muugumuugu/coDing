function help(){
  let helpmenus=
      {
        "position class":"posHelp()",
        "matrix manipulation":"matrixHelp()"
      };
  console.log("call any libraries help function")
  console.log(helpmenus);
  return helpmenus;
}
function posHelp(){
  let properties={
  };
  let functions=
      {
        'main constructor':
        {
          'arguments':
          {
            'coordiantes':'array',
            'screen args':
            {
              'Screen Obj':
              {
                'constructing':"Screen(Projection Mode as Integer,Camera Matrix,instance-Canvas/graphic-buffer, Scaling of Axes as Object ,Screen Center in Screen Coordinates as Object)",
                'objects properties':
                {
                  'mode':{
                'description':{
                  "ortho":0,
                  "stereo":1,
                  "iso":2,
                  "custom":3
                },
                'value':'integer'
              },
                  'cam':{
                'description':'camera for custom projections',
                'value':'4x4 or 3x3 matrix, post multiplier, 2D array'
              }
                }
              }
            },
            'physical attributes':{}
          },
      'description':'null',
      'returned obj':{}
    },
        'log':{
          'arguments':null,
          'description':'logs the vector',
          'returned obj':{}
        }
      };
  let extractables={};
  let res=
      {
        'properties':properties,
        'extractables': extractables,
        'functions':functions
      }
  return res;
}
function matrixHelp(){
  let formators=
      {
        'logMatrix':
        {
          'arguments':
          {
            'Matrix':'two dimensional array, array of rows, where each row is an array of column-wise arranged data'
          },
          'description':'logs the matrix in the console ',
          'returned obj':
          {
            'json object':
            {
              'matrix':"matrix as string with rows seperated by newline and columns seperated by '|'",
              'order':
              {
                "string" :"`#rowsX#cols`"
              },
              'cols':
              {
                '2D array': 'array of columns, basically, the transposed Matrix'
              },
              'rows':{
                '2D array': 'array of rows, basically, the  Matrix'
              }
            }
          }
        }
      };
  let generators=
      {
        'nullMatrix(rows,columns)':'Omxn',
        'identityMatrix(dimension)':'In',
        'rotMatrix(axis as string character,angle in radians)': ' pre multiply colum matrix of vec by this; right handed'
      };
  let extractables={};
  let transforms={};
  let operations={};
  let res=
      {
        'parsing':formators,
        'generators':generators,
        'determine characteristics':extractables,
        'transforms':transforms,
        'operations':operations
      }
  return res;
}
//function primitivesHelp(){
  
//}
