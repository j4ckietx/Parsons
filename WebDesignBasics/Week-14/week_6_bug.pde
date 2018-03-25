Bug pacbug;

float foodX;
float foodY;;
int foodD;

void setup() {
  size (800, 600);
  pacbug = new Bug (width/2, height/2);
  foodX = random(pacbug.d/2, width-pacbug.d/2);
  foodY = random(pacbug.d/2, height-pacbug.d/2);
  foodD = 20;
}

void draw() {
  background(226, 238, 249);
  pacbug.move();
  pacbug.display();
}

void keyPressed() {
    if(keyCode == UP) {
      pacbug.directionX = 0;
      pacbug.directionY = -1;
    } else if (keyCode == RIGHT) {
      pacbug.directionX = 1;
      pacbug.directionY = 0;
    } else if (keyCode == DOWN) {
      pacbug.directionX = 0; 
      pacbug.directionY = 1;
    } else if (keyCode == LEFT) {
      pacbug.directionX = -1;
      pacbug.directionY = 0;}
}

class Bug {
  float x;
  float y;
  float d = 70;
  float speed = 5;
  int directionX = 0;
  int directionY = 0;
  int t = 0;
  int p = 0;
  float px = -30;
  float py = -30;
  boolean start;
  
  Bug(float tempX, float tempY) {
  x = tempX;
  y = tempY;
  }
  
  void move(){
    x += speed * directionX;
    y += speed * directionY;
  }
  
  void display(){
    fill(39, 125, 211);
    ellipse(foodX, foodY, foodD, foodD);
    if ((foodX<x+d/2)&&(foodX>x-d/2)&&(foodY<y+d/2)&&(foodY>y-d/2)){
      foodX = random(d/2, width-d/2);
      foodY = random(d/2, height-d/2);
      start = true;
      p++;
    }
    if (start) {
      t += 1; 
      fill(249, 201, 4);
      ellipse(x, y, d, d);
    }
    if (t > 15) {
      start = false;
      t = 0;
    }
    
    if (p == 3){
      p = 0;
      px = x;
      py = y;
    }
    fill (112, 29, 8);
    rect(px, py, 10, 20, 5);
    
    if (directionX == 1) {
      stroke(219, 54, 57); strokeWeight(5);
        line(x-20, y, x-60, y);    
        line(x-20, y-10, x-50, y-20);
        line(x-20, y+10, x-50, y+20);
        line(x-10, y+20, x-10, y+50);
        line(x-10, y-20, x-10, y-50);
      noStroke(); fill(249, 201, 4);
        arc(x, y, d, d, radians(30), radians(330));    //go right
    } else if (directionX == -1){
      stroke(219, 54, 57); strokeWeight(5);
        line(x+20, y, x+60, y);  
        line(x+20, y-10, x+50, y-20);
        line(x+20, y+10, x+50, y+20);
        line(x+10, y+20, x+10, y+50);
        line(x+10, y-20, x+10, y-50);
      noStroke(); fill(249, 201, 4);
        arc(x, y, d, d, radians(210), radians(510));    //go left
    } else if (directionY == 1){
      stroke(219, 54, 57); strokeWeight(5);
        line(x, y-20, x, y-60);    
        line(x+10, y-20, x+20, y-50);
        line(x-10, y-20, x-20, y-50);
        line(x-20, y-10, x-50, y-10);
        line(x+20, y-10, x+50, y-10);
      noStroke(); fill(249, 201, 4);
        arc(x, y, d, d, radians(120), radians(420));    //go down
    } else if (directionY == -1){
      stroke(219, 54, 57); strokeWeight(5);
        line(x, y+20, x, y+60);    
        line(x+10, y+20, x+20, y+50);
        line(x-10, y+20, x-20, y+50);
        line(x-20, y+10, x-50, y+10);
        line(x+20, y+10, x+50, y+10);
      noStroke(); fill(249, 201, 4);
        arc(x, y, d, d, radians(300), radians(600));    //go up
    } else {
      stroke(219, 54, 57); strokeWeight(5);
        line(x-20, y, x-60, y);    
        line(x-20, y-10, x-50, y-20);
        line(x-20, y+10, x-50, y+20);
        line(x-10, y+20, x-10, y+50);
        line(x-10, y-20, x-10, y-50);
      noStroke(); fill(249, 201, 4);
        arc(x, y, d, d, radians(30), radians(330));    //start position
    } 
    
    if ((x+d/2>width) || (x-d/2<0)){
      directionX = -directionX;
    } else if ((y+d/2>height) || (y-d/2<0)){
      directionY = -directionY;
    }
  }
}