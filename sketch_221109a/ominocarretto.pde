class ominocarretto{
  
  int frameCounter = 0;
  
  float x, y;
    PImage frame1 = loadImage("Resource/Images/ominocarretto/frame1.png");
    PImage frame2 = loadImage("Resource/Images/ominocarretto/frame2.png");
    PImage model = loadImage("Resource/Images/ominocarretto/frame1.png");
    
    boolean q = false;
    boolean v=true;
    
    ArrayList<bullet> bs = new ArrayList<bullet>();

  ominocarretto(float X, float Y){
    this.x = X;
    this.y = Y;
  }
  
  
  
  void animate(){
    if(frameCount % 10 == 0)
      if(q){
        model = frame1;
        q = !q;
      }
      else{
        model = frame2;
        q = !q;
      }
  }
  
  void body(){
    if(v==false)
      for(int j=0; j<model.pixels.length; j++)
        model.pixels[j]=color(0,0,0,0);
    model.resize(180,180);
    image(model, x+l.x,y);
    animate();
  }
  
  void display(){
    body();
  }
}
