class Plataform implements Objects{
  
  private float x;
  private float y;  
  private float l;
  private float h;
  
  Plataform ( float x, float y, float l, float h){
  
    this.x = x;
    this.y = y;
    this.l = l;
    this.h = h;
  
  }
  void update(float et){
  }
  
  void render(){
    rect(x,y,l,h);
  }
  
  float get_x(){return x;}
  float get_y(){return y;}
  float get_x2(){return x + l;}
  float get_y2(){return y + h;}

}
