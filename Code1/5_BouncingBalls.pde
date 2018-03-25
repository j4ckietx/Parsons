int ballD = 30;
int ballR = ballD/2;
int SCREEN_WIDTH = 800;
int SCREEN_HEIGHT = 800;
int speed = 3;
int sqX;
int sqY;
int sq_width;
int sq_height;
float ballsX [] = new float [80];
float ballsY [] = new float [80];
int directionX [] = new int [80];
int directionY [] = new int [80];

void setup(){
  size(800, 800);
  for(int num=0; num<80; num++) {
    ballsX[num] = random(15,785);
    ballsY[num] = random(15,785);
    directionX[num] = 1;
    directionY[num] = 1;
  }
}

void draw(){
  background(97, 97, 99); //granite gray

  //bricks
  for(int row=1; row<=2; row++) {
    for(int column=1; column<=2; column++){
      noStroke();
      fill(255, 220, 200); //unbleached silk
      if ((row == 1 && column == 1) || (row == 2 && column == 2)) {
        sqX = 175 + (300 * (row-1));
        sqY = 200 + (350 * (column-1));
        sq_width = 150;
        sq_height = 50;
      }
      if ((row == 1 && column ==2) || (row == 2 && column == 1)){
        sqX = 175 + (400 * (row-1));
        sqY = 200 + (250 * (column-1));
        sq_width = 50;
        sq_height = 150;
      }

      for(int num=0; num<80; num++) {
        //detect square collision
        if (ballsX[num] >= (sqX - ballR)
        && ballsX[num] <= (sqX + sq_width + ballR)
        && ballsY[num] >= (sqY - ballR)
        && ballsY[num] <= (sqY + sq_height + ballR)) {
          fill(255, 255, 255); //brilliant white
          if (ballsX[num] < sqX){
            directionX[num] = -directionX[num];
            ballsX[num] = sqX - ballR;
          } else if (ballsX[num] > (sqX + sq_width)){
            directionX[num] = -directionX[num];
            ballsX[num] = sqX + sq_width + ballR;
          } else if (ballsY[num] < sqY) {
            directionY[num] = -directionY[num];
            ballsY[num] = sqY - ballR;
          } else if (ballsY[num] > sqY + sq_height) {
            directionY[num] = -directionY[num];
            ballsY[num] = sqY + sq_height + ballR;
          }
        }
        rect(sqX, sqY, sq_width, sq_height, 10);
      }
    }
  }

  for(int num=0; num<80; num++) {
    ballsX[num] = ballsX[num] + directionX[num] * speed;
    ballsY[num] = ballsY[num] + directionY[num] * speed;

    //detect wall collision
    if (ballsX[num] >= SCREEN_WIDTH - ballR || ballsX[num] < ballR){
      directionX[num] = -directionX[num];
    }
    if (ballsY[num] >= SCREEN_HEIGHT - ballR || ballsY[num] < ballR){
      directionY[num] = -directionY[num];
    }
    fill(255, 220, 200); //unbleached silk
    ellipse (ballsX[num], ballsY[num], 30, 30);

  }
}
