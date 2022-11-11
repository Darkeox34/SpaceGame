class Boss1{
  float x,y;
  PImage model;
  boolean q=true;
  Boss1(float x, float y){
    this.x=x;
    this.y=y;
  }
    
  PImage frame1 = loadImage("Resource/Images/boss/boss1_frame_1.png");
  PImage frame2 = loadImage("Resource/Images/boss/boss1_frame_2.png");
  
  void body(){
    if(q)
      model = frame1;
    else
      model = frame2;
    q=!q;
    model.resize(200,200);
    image(model, x, y);
  }
  
  void attack(){
  }
  
  void display(){
    body();
    attack();
  }
}
