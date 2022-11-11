class Blocco{
  float x,y;
  PImage i=loadImage("terra2.png");
  boolean q;
  Blocco(float x, float y, boolean q){
    this.x=x;
    this.y=y;
    this.q=q;
  }
  
  void collision(){
    if(((Pl.y+50 >= y-10) && (Pl.y+50 <= y+5) && Pl.x >= x+l.x && Pl.x <= x+250+l.x) && q==true){
      Pl.jumping = false;
      Pl.y = y-60;
      }
    else{
      if(Pl.y>=1500){
        Pl.y=height/3;
        }
    }
  }
 
  void display(){
    collision();
    i.resize(250,87);
    if(q==true){
      image(i,x+l.x,y);
    }
    else{
      for(int j=0; j<i.pixels.length; j++)
        i.pixels[j]=color(0,0,0,0);
    }
    //line(x+i.width+l.x, height, x+i.width+l.x, 0);
  }
}
