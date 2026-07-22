float startTime = 0f;
float animTime = 0f;
Zoiudinho z = new Zoiudinho(100, 384, 200);
Zoiudinho z2 = new Zoiudinho(100, 600, 600);

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
  z.update(et);
  z2.update(et);
}

void render() {
  z.render();
  z2.render();
}

void mousePressed() {
  z.move(mouseX, mouseY);
}

void keyPressed() {
  z.changeEye();
  if (key == CODED) {
    if (keyCode == RIGHT) {
      z2.changeVel(1);
    } else if (keyCode == LEFT) {
      z2.changeVel(-1);
    } 
  }
}
