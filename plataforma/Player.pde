class Player{
  
  private float x;
  private float y;
  private float r;
  private float vel = 200;
  
  
  private boolean isJumping = false;
  private boolean isFalling = false;
  
  
  private float h = 300;
  private float d = 150;
  private float dx = 0;
  private float dy = 0;
  
  private Plataform p = null;
  private Plataform ground = null;
    
    
  Player( float x, float y, float r, Plataform ground){
    this.x = x;
    this.y = y;
    this.r = r;
    this.ground = ground;
  }
  
  void update(float et){
    
    

    x += vel * et;

    
    if (x > width) x = 0;
    if (x < 0) x = 1024;
    
    if (isJumping){
      dx  += vel * et;
      dy = calcDY(dx);
      
    }
    
    else if (p != null){
      if (x < p.getX() || x > p.getX2()){
        isFalling = true;
        y = ground.getY() - 25;
        h = ground.getY() - p.getY();
        d = 150;
        dy = h;
        dx = 0;
        p = null;
      }
    }
    else if (isFalling){
     dx  += vel * et;
     dy = calcDY(dx);
    }
  }
  void render(){
    //fill(255);
    circle(x,y-dy,r);
  }
  
  void jump(){
    if (!isJumping){
      this.p = null;
      isJumping = true;
      dx = -d/2;
      dy = 0;
    }
  }
 
  
  void collision(Plataform p){
    if ((isJumping || isFalling) && dx > 0 ){
      if (x > p.getX() && x < p.getX2() && y - dy + 25 > p.getY() && y - dy + 25  < p.getY2()){
          isJumping = false;
          y = p.getY() - 25 ;
          dy = 0;
          this.p = p;
          h = d = 300;
        }
    }
  }
  
  float calcDY(float dx){
    return ((-4 * h) / pow(d,2)) * pow(dx,2) + h;
  }
}
