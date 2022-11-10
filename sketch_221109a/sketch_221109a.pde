int x = 1600;
int y = 645;

player Pl = new player(); //Creo un oggetto Pl che conterrà tutti i metodi ed istanze che permetteranno la giocabilità del Giocatore
ominocarretto Omino = new ominocarretto(x,y);

int displayFuel; //Variabile di appoggio per stampare la quantità di fuel rimasta
int frameCounter = 0; //Un contatore che verrà utilizzato per contare il numero di frame
boolean aPressed = false;
boolean dPressed = false;
boolean wPressed = false;
boolean sPressed = false;
boolean spacePressed = false;

void keyPressed() {
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

void gravity() {
  if (Pl.y < 638)
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
      Pl.fuel -= 1.5; //Viene decrementato il fuel in modo graduale
      Pl.y-=9;
    } else {
      if(frameCount % 10 == 0){
        if(Pl.turnedLeft)
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

void OminoShoot(){
  Omino.ominoActionShoot();
}

void spawnRobot(){
}

void setup() {
  size(1920, 1080); //Viene impostata la dimensione della canvas a 1920x1080
  Pl.imageLoad(); //Vengono assegnate alle PImage le corrispondenti immagini tramite il loro path
  //Robot.ImageLoad();
  //Toro.ImageLoad();
  //Uccello.ImageLoad();
  Omino.ImageLoad();
}

void draw() {
  background(0);
  stroke(255);
  line(0, 700, width, 700);
  fill(58, 63, 99);
  thread("OminoShoot");
  Pl.drawPlayer(); //Viene stampato nella canvas il giocatore
  if (!keyPressed || (keyPressed && key == 'A' || keyPressed && key == 'D' || keyPressed && key == 'a' || keyPressed && key == 'd')) { //Se non vengono premuti tasti o se vengono premuti i tasti per effettuare il movimento
    if (frameCount % 10 == 0) { //Ogni 10 frame effettuo l'animazione della bandiera
      if (Pl.turnedRight) {
        Pl.stillAnimation();
      } else {
        Pl.stillLeftAnimation();
      }
    }
  }
  thread("goDown");
  thread("gravity");
  thread("fly");
  Omino.display();
  displayFuel = (int)Pl.fuel; //Assegno ad un intero il varole a virgola mobile del fuel tramite un cast (int)
  
  Pl.jumpAnimation();
  Pl.jumpReset();
  Pl.drawfuel(); //Stampo nella canvas l'indicatore del fuel
  Pl.checkJetpack(); //Viene controllata la capacità rimanente del fuel
  Pl.fuelRegen(); //Viene rigenerato il fuel gradualmente
  Pl.checkDownBarrier(); //Viene controllato se il giocatore sta superando la barriera inferiore dell terreno
  Pl.actions(); //Vengono eseguite tutte le funzioni che permettono la giocabilità del Giocatore
  if (Pl.fuel > 100) { //Per evitare false rappresentazioni, se il fuel dovesse superare il valore 100, gli viene riassegnato il medesimo valore.
    Pl.fuel = 100;
  }
  if (Pl.jetPackCharged == true) { //Se il jetpack è utilizzabile viene stampato il fuel rimanente
    fill(255);
    text(displayFuel + "%", 50, 900);
  } else { //Altrimenti viene stampato "Recharging" finchè non sarà nuovamente riutilizzabile
    fill(255);
    text("Recharging", 50, 900);
  }


  if (frameCount % 60 == 0) { //Ogni 60 frame vengono stampate le coordinate ed il fuel rimanente
    //println("x: " + Pl.x + " y: " + Pl.y + " Stamina: " + Pl.fuel+ "/100");
    println("Jumping = " + Pl.jumping + " Moving = " + Pl.moving);
  }
}
