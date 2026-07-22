float startTime = 0f;
float animTime = 0f;
PVector pos = new PVector(100, 384);
PVector dir = new PVector(0, 0);
PVector mouse = new PVector(100, 384);
float vel = 300;

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
  float dist = mouse.dist(pos);
  if (dist < 5) {
    dir = new PVector(0, 0);
  }
  pos.add(PVector.mult(dir, vel * et));
}

void render() {
  circle(pos.x, pos.y, 50);
}

void mouseMoved() {
  mouse = new PVector(mouseX, mouseY);
  dir = PVector.sub(mouse, pos).normalize();
}
