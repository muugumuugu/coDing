
const CELL_SIZE = 1;
const QR_SIZE = 25;
const BACKGROUND_COLOR = '#eee';
const CELL_COLOR = 'black';

const SCALE_LARGE = 25;
const SCALE_SMALL = 1;
let gScale = SCALE_LARGE;

let gQRImgData;
let gQRdataArray;

function setup() {

  const WIDTH = HEIGHT = QR_SIZE * QR_SIZE;
  createCanvas( WIDTH, HEIGHT );

  noStroke();
  noSmooth();
  fill( CELL_COLOR );

  const QRModule = QRCode.create( generateRandomData() ).modules
  gQRdataArray = QRModule.data;
  makeQRImgData();

  drawImage( gQRdataArray );
  
}

const makeQRImgData = () => {

  const size = QR_SIZE * CELL_SIZE;

  gQRImgData = createGraphics( size, size );
  gQRImgData.noStroke();
  gQRImgData.noSmooth();
  gQRImgData.fill( CELL_COLOR );

  for( let row = 0; row < QR_SIZE; row++ ){
    for( let column = 0; column < QR_SIZE; column++ ){
      if( gQRdataArray[ QR_SIZE * row + column ] ){
        gQRImgData.square( CELL_SIZE * column, CELL_SIZE * row, CELL_SIZE );
      }
    }
  }

}

const drawImage = ( dataArray ) => {

  background( BACKGROUND_COLOR );

  for( let row = 0; row < QR_SIZE; row++ ){
    for( let column = 0; column < QR_SIZE; column++ ){
      if( dataArray[ QR_SIZE * row + column ] ){
        image( gQRImgData, QR_SIZE * (column), QR_SIZE * (row) );
      }
    }
  }
}

function draw() {

  background( BACKGROUND_COLOR );
  const REPEAT_FRAME_COUNT = 220;

  if( ( frameCount % REPEAT_FRAME_COUNT ) > 30 ){

    const EASE = 0.07;
    gScale += ( SCALE_SMALL - gScale ) * EASE;

  }

  scale( gScale );
  drawImage( gQRdataArray );

  if( frameCount % REPEAT_FRAME_COUNT > 180 ){

    // Go Back to one QR Code.
    fill( color( 0, 0, 0, ( frameCount % REPEAT_FRAME_COUNT - 180 ) * 8 ) );
    drawQR( 0, 0, gQRdataArray, CELL_SIZE * QR_SIZE );

  }

  if( frameCount % REPEAT_FRAME_COUNT === ( REPEAT_FRAME_COUNT - 1 ) ){
    gScale = SCALE_LARGE;
  }

}

// Draw QR code
const drawQR = ( offsetX, offsetY, dataArray, cellSize ) => {

  const size = QR_SIZE;

  push();

    translate( offsetX, offsetY );
      
    for( let row = 0; row < size; row++ ){
      for( let column = 0; column < size; column++ ){
        if( dataArray[ size * row + column ] ){
          square( cellSize * column, cellSize * row, cellSize )
        }
      }
    }

  pop();

}



// Generate random data
const generateRandomData = () => {

  // Memo: There was no alignment patter in the data size below 34.
  const size = 35;
  let data = '';
  
  for( let i = 0; i < size; i++ ){
    data += floor( random( 9 ) );
  }

  // console.log( data );
  return data;

}
