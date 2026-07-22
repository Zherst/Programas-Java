class Player implements Objects {
  private float x;
  private float y;
  private float r;
  private float vel = 200;
  
  private boolean is_jumping = false;
  private boolean is_falling = false;
  
  
  private float h = 300;
  private float d = 150;
  private float dx = 0;
  private float dy = 0;
  
  private Plataform p = null;
  private Plataform ground = null;
  
  
  
  
  
  Player(float x, float y,  float r, Plataform ground){
    this.x = x;
    this.y = y;
    this.r = r;
    this.ground = ground;
    
  }

  void update(float et){
    x += vel * et;
    
    if (x > width) x = 0;
    if (x < 0) x = width;
    
    if (is_jumping){
      dx += vel * et;
      dy = calc_dy(dx);
    }
    else if (p != null){
      if(x < p.get_x() || x > p.get_x2()){
        is_falling = true;
        y = ground.get_y() - r/2;
        h = ground.get_y() - p.get_y();
        d = 150;
        dy = h;
        dx = 0;
        p = null;
        
      }
    }
    else if (is_falling){
      dx += vel * et;
      dy = calc_dy(dx);
    }
    
  }
  
  void render(){
    circle(x,y,50);
  }
  
  void jump(){
    if (!is_jumping){
      this.p = null;
      is_jumping = true;
      dx = -dx/2;
      dy = 0;
    }
  }
  
  void collision(Objects o){
    if ((is_jumping || is_falling) && dx > 0){
      
    }
  }
  
  float calc_dy(float dx){
    return ((-4 * h) / pow(d,2)) * pow(dx,2) + h;
  }

}
