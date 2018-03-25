//Reference: Make: Chapter 3; processing.org/examples/easing

//canvas
void setup() {
  size(1280, 800);
}

float x;
float y;

void draw(){
  background(210, 239, 244);
  
  float easing=0.04;

  float targetX = mouseX;
  float dx = (targetX-600) - x;
  x += dx * easing;
  
  float targetY = mouseY;
  float dy = (targetY-370) - y;
  y += dy * easing;
  
//limbs and mouth
strokeWeight(14);
stroke(4, 68, 7);
noFill();

  //left arm
  line(x+515, y+430, x+515, y+530);
  arc(x+538, y+430, 45, 60, 3.14, 4.71);
  //right arm
  arc(x+710, y+410, 60, 60, 0.3, 2.8);
  arc(x+784, y+423, 90, 90, 3.31, 5.0);
  //left leg
  line(x+580, y+500, x+580, y+600);
  arc(x+550, y+600, 60, 60, 0, 1.57);
  //right leg
  line(x+655, y+500, x+655, y+600);
  arc(x+685, y+600, 60, 60, 1.57, 3.14);

//body
noStroke();
fill(255, 172, 26);
rect(x+540, y+200, 150, 340, 75);

//glow
stroke(255, 229, 164);
strokeWeight(11);
line(x+660, y+407, x+660, y+408);
line(x+660, y+430, x+660, y+475);
arc(x+630, y+475, 60, 60, 0, 1.2);

//mouth
stroke(4, 68, 7);
strokeWeight(10);
arc(x+600, y+380, 40, 40, 0.8, 2.2);

//eye
stroke(4, 68, 7);
strokeWeight(11);
strokeJoin(ROUND);
fill(255, 249, 225);
arc(x+610, y+350, 180, 180, 3.14, TWO_PI, CHORD);

//eyeball
noStroke();
fill(4, 68, 7);
ellipse(x+595, y+308, 85, 85);
fill(255, 255, 255);
ellipse(x+580, y+310, 18, 18);

//hat
noStroke();
fill(102, 14, 4);
arc(x+615, y+255, 160, 170, 3.3, 6.13, CHORD);
rect(x+650, y+212, 85, 30, 45);
fill(255, 172, 26);
arc(x+590, y+233, 30, 33, 3.3, 6.13, CHORD); 

}
