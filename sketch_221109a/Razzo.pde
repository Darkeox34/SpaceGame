class Razzo{
 PImage razzo,razzo_m1,razzo_m2;
 int posx=500;
 int posy=300;
 float angle=0;
 int q=0;
 Razzo(){
   this.posx=posx;
   this.posy=posy;
   this.razzo=razzo;
   this.razzo_m1=razzo_m1;
   this.razzo_m2=razzo_m2;
 }
 void loadRazzo(){
  this.razzo_m1=loadImage("Razzo_m1.png");
  this.razzo_m1.resize(razzo_m1.height/6,razzo_m1.width/6);
  this.razzo_m2=loadImage("Razzo_m2.png");
  this.razzo_m2.resize(razzo_m2.height/6,razzo_m2.width/6);
  this.razzo=razzo_m1;
 }
 void drawRazzo(){
   pushMatrix();
   translate(posx,posy);
   rotate(angle);
   image(razzo,-86,-100);
   popMatrix();
   moving();
 }
 void keyPressed(){
 
  if(keyPressed  && key=='d'){
    posx+=10;
   
    angle=PI/2;
    
    
  }
  if(keyPressed && key=='a'){
    angle=PI+PI/2;
   
    posx-=10;
  }
  if(keyPressed  && key=='s'){
    angle=PI;
    posy+=10;
    
  }
  if(keyPressed  && key=='w'){
    posy-=10;
    angle=0;
  }
  if(keyPressed  && key=='e'){
    angle=PI/4;
    posx+=10;
    posy-=10;
  }
  if(keyPressed  && key=='q'){
    angle=PI+PI*0.75;
    posx-=10;
    posy-=10;
  }
  if(keyPressed  && key=='z'){
    posx-=10;
    posy+=10;
    angle=PI+PI*0.25;
   
  }
  if(keyPressed  && key=='c'){
    angle=PI*0.75;
    
    posx+=10;
    posy+=10;
  }
  if (posy<=0)
   posy=0;
  if(posy>=height)
    posy=height;
    if(posx<=width/4 && (key=='q' || key== 'a' ||  key=='z')){
    posx=width/4;
    }
    if(posx>=3*width/4 && (key=='e' || key== 'c' ||  key=='d')){
      posx=3*width/4;
    }
 }
 void moving(){
   if(q == 0 && frameCount%5==0){
      razzo = razzo_m1;
      q= 1;
    }
    else if(q == 1 && frameCount%5==0){
      razzo = razzo_m2;
      q= 0;
    }
 }
   int getX(){
     return posx;
   }
   int getY(){
     return posy;
   }
}
