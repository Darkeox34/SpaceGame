class player {
  float x = 80, y = 645; //Coordinate Giocatore
  int lifes = 3; //Vite Player
  int qR = 0; //Switch per i frame dell'animazione del movimento verso destra
  int qL = 0; //Switch per i frame dell'animazione del movimento verso sinistra
  float fuel = 100; //Fuel Player

  boolean qR2 = false;
  boolean qL2 = false;
  boolean moving = false; //Se il giocatore si sta muovendo
  boolean jumping = false; //Se il giocatore è in volo o sta saltando
  boolean jetPackCharged = true; //Se il jetpack ha superato il 35%
  boolean q1 = false; //Booleano per i frame dell'animazione della bandiera
  boolean qL1 = false; // Booleano per i frame dell'animazione della bandiera verso sinistra
  boolean keyIsReleased = true; //Booleano per capire se un pulsante è stato rilasciato
  boolean turnedLeft = false; //Se il giocatore è rivolto verso sinistra
  boolean turnedRight = true; //Se il giocatore è rivolto verso destra

  PImage Player; //L'immagine che viene stampata nella canvas del giocatore
  PImage RightPlayerStill; //Immagine del giocatore fermo
  PImage RightPlayerFrame1; //Primo frame dell'animazione per camminare
  PImage RightPlayerFrame2; //Secondo frame dell'animazione per camminare
  PImage LeftPlayerStill;
  PImage LeftPlayerFrame1;
  PImage LeftPlayerFrame2;
  PImage LeftFlagAnim1;
  PImage LeftFlagAnim2;
  PImage RightFlagAnim1; //Primo frame della bandiera animata
  PImage RightFlagAnim2; //Secondo frame della bandiera animata
  PImage LeftFrameFly1;
  PImage LeftFrameFly2;
  PImage RightFrameFly1;
  PImage RightFrameFly2;
  PImage LeftFrameStillFly1;
  PImage LeftFrameStillFly2;
  PImage RightFrameStillFly1;
  PImage RightFrameStillFly2;


  ArrayList<bullet> bsR = new ArrayList<bullet>(); //Arraylist di bullet per muoversi verso destra
  ArrayList<bullet> bsL = new ArrayList<bullet>(); //Arraylist di bullet per muoversi verso sinistra

  bullet b; //Creazione dell'oggetto b della classe Bullet

  void imageLoad() {  //Funzione assegnare alle PImage le corrispettive immagini
    this.RightPlayerStill = loadImage("Resource/Images/frame1.png");
    this.RightPlayerFrame1 = loadImage("Resource/Images/frame2.png");
    this.RightPlayerFrame2 = loadImage("Resource/Images/frame3.png");
    this.RightFlagAnim1 = loadImage("Resource/Images/frame_flag_pos1.png");
    this.RightFlagAnim2 = loadImage("Resource/Images/frame_flag_pos2.png");
    this.LeftPlayerStill = loadImage("Resource/Images/left_frame_flag_pos1.png");
    this.LeftPlayerFrame1 = loadImage("Resource/Images/leftframe1.png");
    this.LeftPlayerFrame2 = loadImage("Resource/Images/leftframe1.png");
    this.LeftFlagAnim1 = loadImage("Resource/Images/left_frame_flag_pos1.png");
    this.LeftFlagAnim2 = loadImage("Resource/Images/left_frame_flag_pos2.png");
    this.LeftFrameFly1 = loadImage("Resource/Images/left_frame_flying_pos1.png");
    this.LeftFrameFly2 = loadImage("Resource/Images/left_frame_flying_pos2.png");
    this.RightFrameFly1 = loadImage("Resource/Images/right_frame_flying_pos1.png");
    this.RightFrameFly2 = loadImage("Resource/Images/right_frame_flying_pos2.png");
    this.LeftFrameStillFly1 = loadImage("Resource/Images/left_frame_stillfly_pos1.png");
    this.LeftFrameStillFly2 = loadImage("Resource/Images/left_frame_stillfly_pos1.png");
    this.RightFrameStillFly1 = loadImage("Resource/Images/right_frame_stillfly_pos1.png");
    this.RightFrameStillFly2 = loadImage("Resource/Images/right_frame_stillfly_pos2.png");
    this.Player = this.RightPlayerFrame1;
  }

  void drawPlayer() {  //Funzione per stampare nella canvas il player
    Player.resize(140, 140); //Viene ridimensionata la dimensione del giocatore
    imageMode(CENTER);
    image(Player, x, y);
  }


  void drawfuel() {  //Funzione per stampare nella canvas l'indicatore del fuel
    fill(250, 242, 8);
    rect(50, 50, 3 * fuel, 20);
  }


  void shootRight() { //Aggiunge un nuovo oggetto bullet all'arraylist
    bsR.add(new bullet(x, y,"Player"));
  }

  void shootLeft() {
    bsL.add(new bullet(x, y, "Player"));
  }

  void movingAnimation() { //Animazione del movimento
    if (!wPressed) {
      if (qR == 0) {
        Player = RightPlayerFrame1;
        qR= 1;
      } else if (qR == 1) {
        Player = RightPlayerStill;
        qR= 2;
      } else if (qR == 2) {
        Player = RightPlayerFrame2;
        qR = 3;
      } else if (qR == 3) {
        Player = RightPlayerStill;
        qR = 0;
      }
    }
  }

  void movingLeftAnimation() {
    if (!wPressed) {
      if (qL == 0) {
        Player = LeftPlayerFrame1;
        qL= 1;
      } else if (qL == 1) {
        Player = LeftFlagAnim2;
        qL= 2;
      } else if (qL == 2) {
        Player = LeftPlayerFrame2;
        qL = 3;
      } else if (qL == 3) {
        Player = LeftFlagAnim2;
        qL = 0;
      }
    }
  }

  void stillAnimation() { //Animazione per la bandiera
    if (q1) {
      Player = RightFlagAnim1;
      q1=!q1;
    } else {
      Player = RightFlagAnim2;
      q1=!q1;
    }
  }

  void stillLeftAnimation() {
    if (qL1) {
      Player = LeftFlagAnim2;
      qL1=!qL1;
    } else {
      Player = LeftFlagAnim1;
      qL1=!qL1;
    }
  }

  void jumpAnimation() {
    if (jumping) {  //Se il player sta saltando, viene utilizzato il frame del salto
    }
  }


  void checkJetpack() { //Controlla se il jetpack ha abbastanza fuel per essere riutilizzato
    if (fuel > 35) {
      jetPackCharged = true;
    }
  }


  void fuelRegen() {  //Se il fuel non ha raggiunto il pieno, viene ricaricato gradualmente
    if (fuel < 100.0) {
      fuel+= 0.4;
    }
  }

  void jumpReset() {
    if (x > 635)
      jumping = false;
  }
  void actions() { //Funzione che contiene i vari movimenti delle entità quali Proiettili e movimenti vari del giocatore

    if (keyIsReleased == false) {
      frameCounter++;
      if (frameCounter > 50) {
        keyIsReleased = true;
      }
    }

    for (bullet b : bsR) {  //Questo ciclo viene ripetuto finchè il bullet esiste
      b.display();
    }

    for (bullet b : bsL) {
      b.displayLeft();
    }

    if (dPressed && !aPressed) {
      turnedRight = true;
      turnedLeft = false;
      moving = true; //Se un tasto viene premuto ed il tasto premuto corrisponde a D, il giocatore si muoverà verso destra
      x+=3; //Incremento della coordinata x per permettere lo spostamento del giocatore verso destra
    } else if (aPressed && !dPressed) {
      turnedLeft = true;
      turnedRight = false;
      moving = true;
      x-=3; //Decremento della coordinata x per permettere lo spostamento del giocatore verso sinistra
    } else
      moving = false;

    if (moving && !jumping && !wPressed) { //Se il giocatore si sta muovendo, allora viene eseguita l'animazione del movimento ogni 10 frame
      if (turnedRight) {
        if (frameCount % 10 == 0) {
          movingAnimation();
        }
      } else {
        if (frameCount % 10 == 0) {
          movingLeftAnimation();
        }
      }
    }

    if (spacePressed) { //Se viene premuto il tasto SPACEBAR, viene sparato un proiettile
      {
        if (keyIsReleased) {
          if (turnedRight) {
            thread("shootRight"); //Esegue la funzione shootRight in un altro thread per ottimizzare il gameplay e permettere di eseguire più azioni contemporaneamente
            keyIsReleased = false;
          } else if (turnedLeft) {
            thread("shootLeft");
            keyIsReleased = false;
          }
        }
      }
    }
   
   //funzione per far muovere lo schermo va aggiustato con il volo in obliquo
   if(x>=7*width/8 && keyPressed && (key=='d'||key=='D')){
      if(l.x<=-l.s.width+width)
        l.x=-l.s.width+width;
      else{
        l.x-=3;
        x=7*width/8;
      }
  }
  if(x<=width/8 && keyPressed && (key=='a'||key=='a')){
    if(l.x>=0)
      l.x=0;
    else{
      l.x+=3;
      x=width/8;
    }
  }
  if(x>=width)
    x=width;
  if(x<=0)
    x=0;
  }
};
