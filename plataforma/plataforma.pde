
float fps = 0.05;
float startTime = 0f;
float animTime = 0f;

float x = 100;
float y = 530;

ArrayList<Plataform> plataforms = new ArrayList<Plataform>();


Plataform ground = new Plataform(0,555, 1024,40);
Player player = new Player(x,y,50, ground);

void setup() {
  size(1024, 768);
  startTime = millis();
  
  plataforms.add(ground);
  plataforms.add(new Plataform(600,300, 300, 40));
  plataforms.add(new Plataform(150,300, 300, 40));
  
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
  
  player.update(et);
  for (Plataform p: plataforms){
    player.collision(p);  
  }
}

void render() {
  player.render();
  for (Plataform p: plataforms){
    p.render();
  }
  
}

void mousePressed(){
  player.jump();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      
    } else if (keyCode == LEFT) {
      
    } 
    if(keyCode == UP){
      player.jump();
    }
  }
}
