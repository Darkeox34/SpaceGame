class robot{
  float x, y;
  float s;
  int xSpeed = 4;
  Blocco b;
    PImage frame1 = loadImage("Resource/Images/robot/robot_frame1.png");
    PImage frame2 = loadImage("Resource/Images/robot/robot_frame2.png"); 
    PImage model = loadImage("Resource/Images/robot/robot_frame2.png");
    
  boolean q = false;
  boolean v=true;
  
  robot(float X, float Y){
    this.x = X;
    this.y = Y;
    s=x;
  }
  
  void move(){
    //println(s);
    //println(x);
    x+=xSpeed;
    if(x<=s-250 || x>=s+400){
      xSpeed = -xSpeed;
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
    if(v==false)
      for(int j=0; j<model.pixels.length; j++)
        model.pixels[j]=color(0,0,0,0);
    model.resize(100,100);
    image(model, x+l.x,y);
    animate();
  }
  
  void display(){
    body();
    move();
  }
}
