//infection

int WIDTH = 800;
int HEIGHT = 600;

class Person {
  float x;
  float y;
  float tx;
  float ty;
  float wait; // how long before we give up
  float speed;
  float health; // everybody dies.
  float infected;
  
  Person(float x, float y, float infected) {
   this.x = x;
   this.y = y;
   this.infected = infected;
   this.speed = 1;
   this.health = 1;
  }

  void wander() {
    
    this.tx = boundx(this.x + random(-PERSON_DIAMETER * 16, PERSON_DIAMETER * 16));
    this.ty = boundy(this.y + random(-PERSON_DIAMETER * 16, PERSON_DIAMETER * 16));
    
    // don't hug the walls
    if (this.tx < (LEFT_BOUND+PERSON_DIAMETER+32))  {
      this.tx += 32 * random(0, 32);
    }
    if (this.tx > (RIGHT_BOUND-PERSON_DIAMETER-32)) {
      this.tx -= random(0, 64);
    }
    if (this.ty < (TOP_BOUND+PERSON_DIAMETER+32)) {
      this.ty += random(0, 64);
    }
    if (this.ty > (BOTTOM_BOUND-PERSON_DIAMETER-32)) {
      this.ty -= random(0, 64);
    }
    this.wait = 500;
    this.speed = 0.2 + (random(1, 10) / 20); // randomize speed a bit.
  }
  
  // don't touch each other
  void personCollide(Person other) {
     float d = distance(this.x, this.y, other.x, other.y);
     
     // healthy people avoid sick people
     if ((this.infected <= 0.0) && (other.infected > 0.0) && (d < (PERSON_DIAMETER * 3))) {
      this.x += ((this.x - other.x) / d) * (0.4);
      this.y += ((this.y - other.y) / d) * (0.4);
      
      this.tx += ((this.tx - other.x) / d) * (0.4);
      this.ty += ((this.ty - other.y) / d) * (0.4);
     }
     
     if (d < PERSON_DIAMETER) {
       this.x += ((this.x - other.x) / d) * (PERSON_DIAMETER - d);
       this.y += ((this.y - other.y) / d) * (PERSON_DIAMETER - d);
     }
  }
  
  void infect(Person other) {
     float d = distance(this.x, this.y, other.x, other.y);
     if (d < (PERSON_DIAMETER * 2.0)) {
       // infect people near me
       if (this.infected > 0.0) {
         other.infected += 0.001 * random(0, 1); 
       }
     }
  }
  
  void update(float t) {
    
    float d = distance(this.x, this.y, this.tx, this.ty);
    // give up after a while
    if (this.wait <= 0) {
      this.wander();
    }
    this.wait -= 1;
    
    //  keep moving
    if (d > PERSON_RADIUS) {
      float dx = (this.tx - this.x) / d;
      float dy = (this.ty - this.y) / d;
      //dx *= (3+cos(t / 40.0))/2; // excited
      //dy *= (3+sin(t / 40.0))/2;
      if (this.health >= 0.1) {
        this.x += (dx * this.speed); // when you''re dead, you stop moving
        this.y += (dy * this.speed);
      }
    } else {
      // find a new place to walk to
      this.wander();
    }
    
    // don't touch me
    for (int i=0; i<PERSON_COUNT; i++) {
      if (this != personList[i]) {
         float dd = distance(this.tx, this.ty, personList[i].tx, personList[i].ty);
         if (dd < PERSON_DIAMETER) {
           this.tx += ((this.tx - personList[i].tx) / dd) * PERSON_DIAMETER;
           this.ty += ((this.ty - personList[i].ty) / dd) * PERSON_DIAMETER;
         }
        this.personCollide(personList[i]);
        this.infect(personList[i]);
      }
    }
    
    // die slowly
    if (this.infected > 0.0) {
     this.health -= (this.infected) * 0.001;
    }
    
    // but also get better over time!
    if (this.health > 0.25 && this.infected < 0.25) {
     this.infected -= 0.001;
     this.health += 0.001;
    }
    
    // don't walk off the map please
    this.x = boundx(this.x);
    this.y = boundy(this.y);
    this.tx = boundx(this.tx);
    this.ty = boundy(this.ty);
    this.infected = boundNormal(this.infected);
    this.health = boundNormal(this.health);
    
    // the power of life and death
    if (distance(mouseX, mouseY, this.x, this.y) < 100 && mousePressed) {
      this.infected = 0;
      this.health = 1;
    }
  }
  
  void draw() {
    noStroke();
    float r = (254 * this.infected);
    float g = 0;
    float b = (254 * (1 - this.infected));
    if (this.health < 0.1) {
      fill(90,30,0);  
    } else {
      fill(r,g,b);
    }
    
    ellipseMode(RADIUS);
    ellipse(this.x, this.y, PERSON_RADIUS, PERSON_RADIUS);
  }
}

float distance(float x1, float y1, float x2, float y2) {
 return sqrt(((x2 - x1) * (x2 - x1)) + ((y2 - y1) * (y2 - y1)));
}

float boundx(float x) {
  return max(LEFT_BOUND + PERSON_DIAMETER, min(RIGHT_BOUND - PERSON_DIAMETER, x));
}

float boundy(float y) {
  return max(TOP_BOUND + PERSON_DIAMETER, min(BOTTOM_BOUND - PERSON_DIAMETER, y));
}

float boundNormal(float i) {
  return max(0, min(1.0, i)); 
}


int PERSON_COUNT = 1024 * 1;
float PERSON_RADIUS = 4;
float PERSON_DIAMETER = PERSON_RADIUS * 2;

float LEFT_BOUND = 0 + 32;
float RIGHT_BOUND = WIDTH - 32;
float TOP_BOUND = 0 + 32;

float BOTTOM_BOUND = HEIGHT - 32;



Person[] personList = new Person[PERSON_COUNT];
float time = 0;

void setup() {
  size(800, 600);

  background(255,255,255);
  for (int i=0; i<PERSON_COUNT; i++) {
     float x = random(0+PERSON_RADIUS, WIDTH-PERSON_RADIUS);
    float y = random(0+PERSON_RADIUS, HEIGHT-PERSON_RADIUS);
    Person p = new Person(x, y, 0);
    p.wander();
    personList[i] = p;
  }
  // patient zero
  personList[0].infected = 1;
}

void draw() {
  
  time += 0.1;
  
  background(255,255,255);
  for (int i=0; i<PERSON_COUNT; i++) {
    personList[i].update(time);
  personList[i].draw();
  }
}
