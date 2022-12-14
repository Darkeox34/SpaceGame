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
  this.razzo_m1=loadImage("Resource/Images/selezionelivello/Razzo_m1.png");
  this.razzo_m1.resize(razzo_m1.height/6,razzo_m1.width/6);
  this.razzo_m2=loadImage("Resource/Images/selezionelivello/Razzo_m2.png");
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
 void rocketActions(){
 
  if(dPressed && !aPressed && !wPressed && !sPressed){
    posx+=10;
   
    angle=PI/2;
    
    
  }
  if(aPressed && !dPressed && !wPressed && !sPressed){
    angle=PI+PI/2;
   
    posx-=10;
  }
  if(sPressed && !wPressed){
    angle=PI;
    posy+=10;
    
  }
  if(wPressed && !sPressed){
    posy-=10;
    angle=0;
  }
  if(ePressed && !wPressed && !dPressed && !aPressed && !sPressed && !qPressed && !zPressed && !cPressed){
    angle=PI/4;
    posx+=10;
    posy-=10;
  }
  if(qPressed && !ePressed && !wPressed && !dPressed && !aPressed && !sPressed && !zPressed && !cPressed){
    angle=PI+PI*0.75;
    posx-=10;
    posy-=10;
  }
  if(zPressed && !ePressed && !wPressed && !dPressed && !aPressed && !sPressed && !qPressed && !cPressed){
    posx-=10;
    posy+=10;
    angle=PI+PI*0.25;
   
  }
  if(cPressed && !ePressed && !wPressed && !dPressed && !aPressed && !sPressed && !qPressed && !zPressed){
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
