class ominocarretto2{
  
  int frameCounter = 0;
  
  int x, y;
    PImage frame1;
    PImage frame2; 
    PImage model;
    
    boolean q = false;
    
    ArrayList<bullet> bs = new ArrayList<bullet>();
    
    
  void ImageLoad(){
    frame1 = loadImage("Resource/Images/ominocarretto/red_frame1.png");
    frame2 = loadImage("Resource/Images/ominocarretto/red_frame2.png");
    model = loadImage("Resource/Images/ominocarretto/red_frame1.png");
  }
  
  ominocarretto2(int X, int Y){
    x = X;
    y = Y;
  }
  
  void newBullet(){
      bs.add(new bullet(x, y,"red"));
  }
  
  
  void ominoActionShoot(){
    frameCounter++;
    if(frameCounter > 70){
      frameCounter = 0;
      newBullet();
    }
    for (bullet b : bs) {  //Questo ciclo viene ripetuto finchè il bullet esiste
      b.displayLeft();
      //if (b.getX() > 1920)
        //bs.remove(bs);
    }
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
    model.resize(180,180);
    image(model, x,y);
    animate();
  }
  
  void display(){
    body();
  }
}
