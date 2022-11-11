bullet b; //Creazione dell'oggetto b della classe Bullet
  ArrayList<bullet> bsR = new ArrayList<bullet>(); //Arraylist di bullet per muoversi verso destra
  ArrayList<bullet> bsL = new ArrayList<bullet>(); //Arraylist di bullet per muoversi verso sinistra
  boolean dead = false;
PImage gameOver;
//ALEX
Razzo R1=new Razzo();
Spazio S=new Spazio();
Ostacoli M=new Ostacoli();
//
robot r;

void setupAlex() {
  R1.loadRazzo();
  S.loadSpace();
  M.loadOstacoli();
  M.creadimensioni();
}

void drawAlex() {
  S.drawSpace();
  R1.drawRazzo();
  M.drawOstacoli();
}


//LEVEL BOOLEAN
boolean ifLevel1 = false;
//END LEVEL BOOLEAN

//OMINO SHOOT


//


//PLAYER
boolean isPlayerUsable = false;
player Pl = new player(); //Creo un oggetto Pl che conterrà tutti i metodi ed istanze che permetteranno la giocabilità del Giocatore
void gravity() {
  Pl.y += 5; //Incremento della Y per simulare la gravità
}

void fly() {
  if (wPressed) {
    if (Pl.fuel > 4 && Pl.jetPackCharged) {
      if (Pl.turnedRight) {
        if (frameCount % 10 == 0) {
          if (Pl.qR2) {
            Pl.Player = Pl.RightFrameFly1;
            Pl.qR2=!Pl.qR2;
          } else {
            Pl.Player = Pl.RightFrameFly2;
            Pl.qR2=!Pl.qR2;
          }
        }
      } else {
        if (frameCount % 10 == 0) {
          if (Pl.qL2) {
            Pl.Player = Pl.LeftFrameFly1;
            Pl.qL2=!Pl.qL2;
          } else {
            Pl.Player = Pl.LeftFrameFly2;
            Pl.qL2=!Pl.qL2;
          }
        }
      }
      Pl.jumping = true; //Viene assegnato true alla variabile jumping per riconoscere quando un giocatore è in volo
      Pl.fuel -= 1.2; //Viene decrementato il fuel in modo graduale
      Pl.y-=9;
    } else {
      if (frameCount % 10 == 0) {
        if (Pl.turnedLeft)
          Pl.Player = Pl.LeftPlayerStill;
        else
          Pl.Player = Pl.RightPlayerStill;
      }
      Pl.jetPackCharged = false;
    }
  }
}

void goDown() {
  if (sPressed) {
    Pl.y+=3.5;
  }
}

void shootRight() { //Funzione ridichiarata all'interno del main per essere eseguita in un altro thread
  frameCounter = 0;
  Pl.shootRight();
  delay(400);
}

void shootLeft() {
  frameCounter = 0;
  Pl.shootLeft();
  delay(400);
}
//FINE PLAYER




//INPUT
boolean aPressed = false;
boolean dPressed = false;
boolean wPressed = false;
boolean sPressed = false;
boolean spacePressed = false;
boolean qPressed = false;
boolean ePressed = false;
boolean zPressed = false;
boolean cPressed = false;
boolean enterPressed = false;
boolean escPressed = false;

void keyPressed() {
  if (keyCode == ESC)
    escPressed = true;
  if (keyCode == ENTER)
    enterPressed = true;
  if (key == 'q')
    qPressed = true;
  if (key == 'e')
    ePressed = true;
  if (key == 'z')
    zPressed = true;
  if (key == 'c')
    cPressed = true;
  if (key == 'a')
    aPressed = true;
  if (key == 's')
    sPressed = true;
  if (key == 'd')
    dPressed = true;
  if (key == 'w')
    wPressed = true;
  if (key == ' ')
    spacePressed = true;
}

void keyReleased() {
  if (keyCode == ESC)
    escPressed = false;
  if (keyCode == ENTER)
    enterPressed = false;
  if (key == 'q')
    qPressed = false;
  if (key == 'e')
    ePressed = false;
  if (key == 'z')
    zPressed = false;
  if (key == 'c')
    cPressed = false;
  if (key == 'a')
    aPressed = false;
  if (key == 's')
    sPressed = false;
  if (key == 'd')
    dPressed = false;
  if (key == 'w')
    wPressed = false;
  if (key == ' ')
    spacePressed = false;
}
//FINE INPUT

Livello1 l;


void drawGameOver(){
  gameOver.resize(1920,1080);
  image(gameOver, 0,0);
}

int displayFuel; //Variabile di appoggio per stampare la quantità di fuel rimasta
int frameCounter = 0; //Un contatore che verrà utilizzato per contare il numero di frame

void setup() {
  size(1920, 1080); //Viene impostata la dimensione della canvas a 1920x1080
  Pl.imageLoad(); //Vengono assegnate alle PImage le corrispondenti immagini tramite il loro path
  l=new Livello1();
  setupAlex();
  gameOver = loadImage("Resource/Images/gameover.png");
}

void draw() {
   l.display();
  if(!dead){
    if (isPlayerUsable) {
      l.displayFuel();
      l.drawHearth();
      l.drawPlayer();
      l.playerAction();
    }
  }
  else{
    drawGameOver();
    if(spacePressed){
      ifLevel1 = false;
      Pl.lifes = 3;
      setup();
    }
  }
  if (ifLevel1 == false) {
    dead = false;
    drawAlex();
    R1.rocketActions();
    S.spaceMove();
  }


  thread("goDown");
  thread("gravity");
  thread("fly");

  if (frameCount % 60 == 0) { //Ogni 60 frame vengono stampate le coordinate ed il fuel rimanente
  }
}
