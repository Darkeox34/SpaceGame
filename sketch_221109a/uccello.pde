class uccello{
  int x, y;
    PImage frame1;
    PImage frame2; 
    PImage frame3;
    PImage model;
  void ImageLoad(){
    frame1 = loadImage("Resource/Images/uccello/frame1.png");
    frame2 = loadImage("Resource/Images/uccello/frame2.png");
    model = loadImage("Resource/Images/uccello/frame1.png");
  }

  boolean q = false;
  
  uccello(int X, int Y){
    x = X;
    y = Y;
  }
  
  void move(){
    x-=4;
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
    model.resize(160,160);
    image(model, x,y);
    animate();
  }
  
  void display(){
    body();
    move();
  }
}
