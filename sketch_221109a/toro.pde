class toro{
  int x, y;
    PImage frame1;
    PImage frame2; 
    PImage frame3;
    PImage model;
  void ImageLoad(){
    frame1 = loadImage("Resource/Images/toro/frame1.png");
    frame2 = loadImage("Resource/Images/toro/frame2.png");
    frame3 = loadImage("Resource/Images/toro/frame3.png");
    model = loadImage("Resource/Images/toro/frame1.png");
  }

  int q = 0;
  
  toro(int X, int Y){
    x = X;
    y = Y;
  }
  
  void move(){
    x-=4;
  }
  
  void animate() { //Animazione del movimento
    if(frameCount % 10 == 0){
      if (q == 0) {
        model = frame2;
        q= 1;
      } else if (q == 1) {
        model = frame1;
        q= 2;
      } else if (q == 2) {
        model = frame3;
        q = 3;
      } else if (q == 3) {
        model = frame1;
        q = 0;
      }
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
