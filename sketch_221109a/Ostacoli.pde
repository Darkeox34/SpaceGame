class Ostacoli{
  PImage m1,m2,m3,m4,m5,m6,ufo1,ufo2;
  int [] mx=new int[6];
  int [] my=new int[6];
  int wx=5000;
  int wy=700;
  int wwx=1000;
  int wwy=500;

 void loadOstacoli(){
    m1=loadImage("Meteorite.png");
    m1.resize(m1.width/10,m1.height/10);
    ufo1=loadImage("Ufo.png");
    ufo1.resize(ufo1.width/10,ufo1.height/10);
   /* m2=loadImage("Meteorite.png");
    m2.resize(m2.width/10,m2.height/10);
    m3=loadImage("Meteorite.png");
    m3.resize(m1.width,m1.height);
    m4=loadImage("Meteorite.png");
    m4.resize(m1.width,m1.height);
    m5=loadImage("Meteorite.png");
    m5.resize(m1.width,m1.height);*/
    
    m2=m1.copy();
    m3=m1.copy();
    m4=m1.copy();
    m5=m1.copy();
    m6=m1.copy();
    ufo2=ufo1.copy();
 }
 void creadimensioni(){
   for (int i=0;i<6;i++){
     mx[i]=(int)random(2000,6000);
     print(mx[i]);
     my[i]=(int)random(200,1000);
     print(my[i]);
   }
 
 
 }
 
  void drawOstacoli(){
    
    image(m1,mx[0],my[0]);
    image(m2,mx[1],my[1]);
    image(m3,mx[2],my[2]);
    image(m4,mx[3],my[3]);
    image(m5,mx[4],my[4]);
    image(m6,mx[5],my[5]);
    image(ufo1,wx,wy);
    image(ufo2,wwx,wwy);
    moveMeteorite();
    moveUfo();
   
    
  }
  void moveMeteorite(){
     for (int i=0;i<6;i++){
       if(i%2==0){
        mx[i]-=(int)random(5,30);
        my[i]-=(int)random(2,10);
        if(mx[i]<=-100)
        mx[i]=6000;
        if(my[i]<=-100)
        my[i]=(int)random(0,1000);
       }
       if(i%2==1){
        mx[i]+=(int)random(5,30);
        my[i]+=(int)random(2,10);
        if(mx[i]>=6100)
        mx[i]=0;
        if(my[i]>=6100)
        my[i]=(int)random(0,1000);
       }
   
   }
    
    
  }
  void moveUfo(){
    if (wx>0)
    wx-=10;
    else
    wx=5000;
    if (wwx<6000)
    wwx+=10;
    else
    wwx=1000;
  
  }
  
 
  




}
