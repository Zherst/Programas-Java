class Plataform{
  
  private float x = 0;
  private float y = 0;
  private float l = 300;
  private float h = 40;
  
  Plataform( float x, float y, float l, float h){
    this.x = x;
    this.y = y;
    this.l = l;
    this.h = h;
  }
  
  
  void render(){
    //fill(0,255,0);
    rect(x,y,l,h);
  }
  
  float getX(){return x;}
  float getX2(){return x + l;}
  float getY(){return y;}
  float getY2(){return y + 15;}
  
  
  
  
}

  
