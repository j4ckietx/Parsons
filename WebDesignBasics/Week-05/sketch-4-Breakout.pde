//Acne Studio Summer 2017 Themed Breakout

int SCREEN_WIDTH = 800;
int SCREEN_HEIGHT = 800;

int br_width = 40;
int br_height = 35;
int br_count = SCREEN_WIDTH/br_width;

float ballX = 400;
float ballY = 758;
int ballD = 20;
int ballR = ballD/2;

float directionX = 1;
float directionY = -1;
float speed = 3;
boolean start = false;

int padX = 360;
int padY = 770;
int pad_width = 80;
int pad_height = 15;

boolean broken[] = new boolean[80];

boolean inside(int px, int py, int buttonX, int buttonY, int buttonW, int buttonH){
  return (px > buttonX && px < (buttonX+buttonW) && py > buttonY && py < (buttonY+buttonH));
}


void setup() {
  size(800, 800);
}

//button
void mouseClicked() {
  if (inside(mouseX, mouseY, padX, padY, pad_width, pad_height)) {
  start = true; 
  }
}

void draw(){
  background(250, 250, 250); //backlight
  noStroke();
  fill(255, 255, 255); //brilliant white
  rect(200, 70, 400, 280, 10);
  fill(198, 231, 245); //spotlight blue
  ellipse(315, 150, 30, 30);
  ellipse(485, 150, 30, 30);
  rect(300, 250, 200, 25, 15);
 
 //bricks
  for(int row=2; row<10; row++) {
    for(int column=5; column<br_count-5; column++) {
      int brickX = column * br_width;
      int brickY = 35*row;
      fill(247, 198, 173); //cosmetic peach
      stroke(244,173,142); //spotlight peach
      strokeWeight(5);
      
      if (ballX+ballR>=brickX 
        && ballX-ballR<=brickX+br_width 
        && ballY-ballR<=brickY+br_height
        && ballY+ballR>=brickY) {
        broken[8*column+row-42] = true;
      }
      
      if (!broken[8*column+row-42] == true) {
        rect(brickX, brickY, br_width, br_height, 5);
      } 
    }
  }
 
  //move paddle
  if (start){
    padX = mouseX - 40;
    padY = 770;
    if (padX > SCREEN_WIDTH - pad_width){
      padX = SCREEN_WIDTH - pad_width;
    } else if (padX < 0){
      padX = 0;
    }
  }    
  
  //draw paddle
  fill (173, 172, 172); //neutral grey
  if (!start){
    fill(247, 198, 173); //cosmetic peach 
  } 
  if (ballY >= padY-10 && ballX > padX && ballX < padX+pad_width) {
    fill(198, 231, 245); //spotlight blue
  }
  noStroke();
  rect(padX, 770, 80, 15, 10);

  
   //move bouncing ball
   if (start) {
   ballX = ballX + directionX*speed;
   ballY = ballY + directionY*speed;
   }
   if (ballX > SCREEN_WIDTH-ballR || ballX < ballR) {
     directionX *= -1;
   }
   if ( ballY < ballR) {
     directionY *= -1;
   }

   if (ballY >= padY
     && ballX > padX
     && ballX < padX+pad_width) {
     directionY = - (abs(directionY) + random(0.4));
     if (ballX<mouseX-4) {
       directionX = - abs(directionX);
     } else{
       directionX = abs(directionX);
     }
   }
   if (ballY+ballR>SCREEN_HEIGHT) {
      br_width = 40;
      br_height = 35;
      br_count = SCREEN_WIDTH/br_width;
      ballX = 400;
      ballY = 758;
      ballD = 20;
      ballR = ballD/2;
      directionX = 1;
      directionY = -1;
      speed = 3;
      start = false;
      padX = 360;
      padY = 770;
      pad_width = 80;
      pad_height = 15;
      broken = new boolean[80];
   }
   
   //draw ball
   fill (173, 172, 172); //neutral grey
   if (!start){
     fill(247, 198, 173); //cosmetic peach} 
   } 
   ellipse(ballX, ballY, ballD, ballD);
}
