
void setup() {
  size (1000, 600);
}

float x = 0;
float a = 0;
float y = 0;
boolean click = false;

void draw() {
  
  float r, g, b;
  
  r = g = b = (cos(a + 3)) * 255;
  background(r, g, b);
  
  if (mousePressed
    && (mouseX<=525)
    && (mouseX>=475)
    && (mouseY<=525)
    && (mouseY>=475)) {
    click = true;
  }
 
  if (click == true) {
    a = a-0.02;
    x = 500 + 200*sin(a);
    y = 400 + 200*cos(a);
    fill(190, 50, 0);
    ellipse(x, y, 200, 200);
  }
  
  stroke (0, 0, 0);
  strokeWeight(5);
  line (100, 400, 900, 400);
  noStroke();
  fill (r,g,b);
  rect(102.5, 402.5, 800, 200);
  
  if (click == false) {
     fill(190, 50, 0);
     ellipse(500, 500, 50, 50);
  }
}
