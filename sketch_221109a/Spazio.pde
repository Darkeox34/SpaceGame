class Spazio{
  
 PImage sfondo,livello_terra,livello_2,livello_3;
 float h,k;
 float tx=300;
 float ux=2000;
 float vx=4000;
 PFont testo;
 
 void loadSpace(){
  this.sfondo=loadImage("Resource/Images/selezionelivello/Selezione_livello.png");
  this.livello_terra=loadImage("Resource/Images/selezionelivello/Livello_terra.png");
  this.livello_terra.resize(livello_terra.height/3,livello_terra.width/3);
  this.livello_2=loadImage("Resource/Images/selezionelivello/Livello_2.png");
  this.livello_2.resize(livello_2.height/3,livello_2.width/3);
  this.livello_3=loadImage("Resource/Images/selezionelivello/Livello_3.png");
  this.livello_3.resize(livello_3.height/3,livello_3.width/3);
  this.testo=loadFont("Resource/data/OCRAExtended-100.vlw");
  textFont(testo,35);
  //textAlign(CENTER);
 }
 void drawSpace(){
  image(sfondo,h,k);
  image(livello_terra,tx,400);
  image(livello_2,ux,600);
  image(livello_3,vx,250);
  if (dist(R1.getX(),R1.getY(),tx+livello_terra.width/2,400+livello_terra.height/2)<300){
     fill(255);
     strokeJoin(ROUND);
     strokeWeight(5);
     stroke(100);
     rect(tx,400,500,100);
     fill(0);
     text("Premere 'Invio' per atterrare sulla Terra",tx+20,420,tx+160,500);
     if(enterPressed){
       ifLevel1 = true;
       isPlayerUsable = true;
     }
  }
  if (dist(R1.getX(),R1.getY(),ux+livello_2.width/2,600+livello_2.height/2)<180){
     fill(255);
     strokeJoin(ROUND);
     strokeWeight(5);
     stroke(100);
     rect(ux,400,600,100);
  }
  if (dist(R1.getX(),R1.getY(),vx+livello_2.width/2,250+livello_2.height/2)<240){
     fill(255);
     strokeJoin(ROUND);
     strokeWeight(5);
     stroke(100);
     rect(vx,250,600,100);
  }
 }
  void spaceMove(){
    
  if(R1.getX()<=width/4 && (qPressed || aPressed ||  zPressed)){

    if(h>=0){
      h=0;
    }
    else{
      h+=20;
      tx+=20;
      ux+=20;
      vx+=20;
    }
  }
    if(R1.getX()>=3*width/4 && (ePressed || cPressed ||  dPressed)){

      if(h<=-sfondo.width+width)
       h=-sfondo.width+width;
      else{
       h-=20;
       tx-=20;
       ux-=20;
       vx-=20;
      }
    }
  
    
  }
 }
