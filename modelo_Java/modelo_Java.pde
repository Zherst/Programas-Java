int r = 0;
int g = 0;
int b = 0;
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

}

void render() {
  fill(255);
  rect(x,y,40,40);
  fill(255);
  ellipse(x+15,y+40,15,5);
  fill(255,0,0);
  circle(x+20,y+20,40);
  fill(255);
  circle(x+15,y+20,5);
  circle(x+10,y+20,5);
  ellipse(x+20,y+40,15,5);

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
