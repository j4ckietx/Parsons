import processing.pdf.*;

float ballsX [] = new float [300];
float ballsY [] = new float [300];
float lineX [] = new float [2000];
float lineY [] = new float [2000];
float circleX = 500;
float circleY = 300;
float circleR = 500;
boolean refresh = true;

void setup(){
  size (1000, 600, PDF, "filename.pdf");
}

void draw(){
  
  if (mousePressed){
    refresh =true;
  }
  
  if (refresh){
    background (247);
    for(int num=0; num<130; num++) {
      ballsX[num] = random (350, 650);
      ballsY[num] = random (200, 400);
      noStroke();
      fill(224,87,87);
      ellipse (ballsX[num], ballsY[num], 10, 10);
    }
    
    for(int num=131; num<220; num++) {
      ballsX[num] = random (200, 800);
      ballsY[num] = random (100, 500);
      noStroke();
      fill(224,87,87);
      ellipse (ballsX[num], ballsY[num], 10, 10);
    }
    
    for(int num=0; num<200; num++) {
      ballsX[num] = random (0, 1000);
      ballsY[num] = random (0, 600);
      float ballsize = random (0, 80);
      int B = int(random(150,250));
      noStroke();
      fill(B);
      ellipse (ballsX[num], ballsY[num], ballsize, ballsize);
      fill(B-10);
      ellipse (ballsX[num], ballsY[num], 30, 30);
      fill(B-30);
      ellipse (ballsX[num], ballsY[num], 20, 20);
    }
    
    for(int num=0; num<2000; num++) {
      lineX[num] = random (0, 1000);
      lineY[num] = random (0, 600);
      stroke(224,87,87);
      line (lineX[num], lineY[num], lineX[num]+random(-20,20), lineY[num]+random(-20,20));
    }

    
    for(int num=201; num<300; num++) {
      ballsX[num] = random (0, 1000);
      ballsY[num] = random (0, 600);
      float ballsize = random (0, 100);
      int B = int(random(150,250));
      noStroke();
      fill(B);
      ellipse (ballsX[num], ballsY[num], ballsize, ballsize);
      fill(B-10);
      ellipse (ballsX[num], ballsY[num], 30, 30);
      fill(B-30);
      ellipse (ballsX[num], ballsY[num], 20, 20);
    }
    
    for(int num=221; num<300; num++) {
      ballsX[num] = random (0, 1000);
      ballsY[num] = random (0, 600);
      noStroke();
      fill(224,87,87);
      ellipse (ballsX[num], ballsY[num], 10, 10);
    }
    
    for(int num=0; num<100; num++) {
      ballsX[num] = random (0, 1000);
      ballsY[num] = random (0, 600);
      noFill();
      stroke(224,87,87);
      ellipse (ballsX[num], ballsY[num], 10, 10);
    }
    refresh = false;
  }
  println("Finished.");
  exit();
  
}