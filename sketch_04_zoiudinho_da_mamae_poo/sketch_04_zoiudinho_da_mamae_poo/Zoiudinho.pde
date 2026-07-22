class Zoiudinho {
  
  private int x;
  private int y;
  private float vel;
  private boolean eyeOpen = true;
  private float fps = 1f;
  
  Zoiudinho(int x, int y, float vel) {
    this.x = x;
    this.y = y;
    this.vel = vel < 0 ? 0 : vel;
  }
  
  void update(float et) {
    //animação do Zoiudinho
    animTime += et;
    if (animTime > fps) {
      animTime = 0;
      eyeOpen = !eyeOpen;
      if (eyeOpen) 
        fps = 1 + random(5);
      else 
        fps = 0.2f;
    }
    //movimento do Zoiudinho
    x += vel * et;
    if (x > width) x = 0;
  }
  
  void render() {
    fill(0, 200, 0);
    circle(x, y, 150);
    fill(255, 0, 0);
    ellipse(x, y + 35, 90, 10);
    if (eyeOpen) {
      fill(255, 255, 255);
      circle(x, y - 25, 70);
      fill(0, 0, 0);
      circle(x, y - 20, 20);
    }
    else {
      fill(0, 0, 0);
      rect(x - 30, y - 20, 60, 5);
    }
  }
  
  void move(int x, int y) {
    this.x = x < 0 ? 0 : x;
    this.y = y < 0 ? 0 : y;
  }
  
  void changeEye() {
    eyeOpen = !eyeOpen;
  }
  
  void changeVel(int dir) {
    vel += dir * 50;
  }
}
