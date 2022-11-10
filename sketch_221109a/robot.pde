class robot{
  int x, y;
    PImage frame1;
    PImage frame2; 
    PImage model;
  void ImageLoad(){
    frame1 = loadImage("Resource/Images/robot/robot_frame1.png");
    frame2 = loadImage("Resource/Images/robot/robot_frame2.png");
    model = loadImage("Resource/Images/robot/robot_frame2.png");
  }

  boolean q = false;
  
  robot(int X, int Y){
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
    model.resize(100,100);
    image(model, x,y);
    animate();
  }
  
  void display(){
    body();
    move();
  }
}
