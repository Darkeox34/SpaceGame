Razzo R1=new Razzo();
Spazio S=new Spazio();
Ostacoli M=new Ostacoli();


void setup(){
 
  size(1920,1100);
  R1.loadRazzo();
  S.loadSpace();
  M.loadOstacoli();
  M.creadimensioni();
}
void draw(){
  
  S.drawSpace();
  R1.drawRazzo();
  M.drawOstacoli();
 

 

}
void keyPressed(){
  R1.keyPressed();
  S.keyPressed();
  

}
