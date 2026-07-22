float startTime = 0f;
float animTime = 0f;

float x = 100;
float y = 500;
float vel = 200;

boolean isJumping = false;

float h = 300;
float d = 150;
float dx = 0;
float dy = 0;




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
  x += vel * et;
  if (x > width) x = 0;
  if (isJumping){
    dx  += vel * et;
    dy = calcDY(dx);
    if (dx > d/2) {
      isJumping = false;
      dy = 0;
    }
  }
  

}

void render() {
  circle(x,y-dy,50);
  
}

void mousePressed(){
  if (!isJumping){
    isJumping = true;
    dx = -d/2;
    dy = 0;
  }
}

float calcDY(float dx){
  return ((-4 * h) / pow(d,2)) * pow(dx,2) + h;
}
