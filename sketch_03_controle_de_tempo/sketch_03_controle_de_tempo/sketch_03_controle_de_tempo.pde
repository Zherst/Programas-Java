int r = 0;
int g = 0;
int b = 0;
float startTime = 0f;
float animTime = 0f;

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
  animTime += et;
  if (animTime > 1) {
    animTime = 0;
    r = int(random(256));
    g = int(random(256));
    b = int(random(256));
  }
}

void render() {
  fill(r, g, b);
  rect(0, 0, width, height);
}
