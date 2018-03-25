int R=255;
int G=87;
int B=10;

void setup(){
  size(300,300);
}

void draw() {
  background(R, G, B);
  stroke(255);
  strokeWeight(4);
  fill(255);
  if (R==255 && G==87 && B==10){
    ellipse(150,150,50,50);
  } else if (R==255 && G==243 && B==8){
    triangle(150,125,125,170,175,170);
  } else if (R==28 && G==62 && B==255){
    rect(125, 125, 50, 50);
  } else if (R==255 && G==28 && B==111){
    noFill();
    beginShape();
      vertex(150, 127.387);
      vertex(173.776, 144.662);
      vertex(164.695, 172.613);
      vertex(135.305, 172.613);
      vertex(126.224, 144.662);
      vertex(150, 127.387);
    endShape();
  } 
}

void mouseClicked() {
  if (R==255 && G==87 && B==10) {
    R=255;
    G=243;
    B=8;
  } else if (R==255 && G==243 && B==8){
    R=28;
    G=62;
    B=255;
  } else if (R==28 && G==62 && B==255){
    R=255;
    G=28;
    B=111;
  } else if (R==255 && G==28 && B==111){
    R=255;
    G=87;
    B=10;
  }
}

void keyPressed() {
    if(key == '1') {
      R=255;
      G=87;
      B=10;
    } else if (key == '2') {
      R=255;
      G=243;
      B=8;
    } else if (key == '3') {
      R=28;
      G=62;
      B=255;
    } else if (key == '4') {
      R=255;
      G=28;
      B=111;
    }
}