float startTime = 0f;
float animTime = 0f;
PVector pos = new PVector(100, 384);
PVector dir = new PVector(1, 0);
float vel = 300;
boolean right = false;
boolean left = false;

void setup() {
  size(1024, 768);
  startTime = millis();
}

void draw() {
  float elapsedTime = (millis() - startTime) / 1000f;
  startTime = millis();
  background(0);
  update(elapsedTime);
  render();
}

void update(float et) {
  if (left) {
    dir.rotate(-(PI/2) * et); 
  }
  if (right) {
    dir.rotate((PI/2) * et); 
  }
  
  PVector m = PVector.mult(dir, vel * et);
  pos.add(m);
  if (pos.x > 1024) pos.x = 0;
  if (pos.y > 768) pos.y = 0;
}

void render() {
  circle(pos.x, pos.y, 50);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      left = true;
    }
    else if (keyCode == RIGHT) {
      right = true;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      left = false;
    }
    else if (keyCode == RIGHT) {
      right = false;
    }
  }
}
