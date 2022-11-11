class Livello1 {
  PImage s=loadImage("sfondo.png");
  PImage rocket = loadImage("Resource/Images/astronave/astronave_spenta.png");
  float x, y;
  boolean [] q={true, true, true, false, false, false, true, true, true, false, true, true, true, false, false, false, true, true, true, true, true, true, true, true};
  PImage hearth = loadImage("Resource/Images/hearth.png");
  boolean q1 = false;



  Livello1() {
  }

  Blocco[] create1() {
    Blocco[] a=new Blocco[24];
    for (int i=0; i<24; i++)
      a[i]=new Blocco(250*i, height-130, q[i]);
    return a;
  }

  Blocco[] create2() {
    Blocco[] a=new Blocco[24];
    for (int i=0; i<24; i++)
      a[i]=new Blocco(250*i, height/2+100, !q[i]);
    return a;
  }

  Blocco [] b1=create1();
  Blocco [] b2=create2();
  
  robot[] create() {
    robot[] a = new robot[5];
    a[0] = new robot(b1[4].x,height/2);
    a[1] = new robot(b1[14].x, height/2);
    a[2] = new robot(b1[19].x, height-230);
    a[3] = new robot(b1[20].x ,height-230);
    a[4] = new robot(b1[21].x, height-230);
    return a;
  }
  
  ominocarretto[] createArr(){
    ominocarretto[] o = new ominocarretto[3];
    o[0] = new ominocarretto(b1[8].x+90, height/2+270);
    o[1] = new ominocarretto(b1[12].x+90, height/2+270);
    o[2] = new ominocarretto(b1[9].x+90, height/2-42);
    
    return o;
  }
  
  enemyBullet[] createBull(){
    enemyBullet[] b = new enemyBullet[3];
    b[0] = new enemyBullet(b1[8].x+40, height/2+300);
    b[1] = new enemyBullet(b1[12].x+40, height/2+300);
    b[2] = new enemyBullet(b1[9].x+40, height/2-5);
    return b;
  }
    

  robot[] r = create();
  ominocarretto[] om = createArr();
  enemyBullet[] bullet = createBull();
  
  
  void drawStillRocket(){
    rocket.resize(600,600);
    image(rocket, b1[23].x+l.x-130, height/2-40);
  }
  
  
    void body() {
    image(s, x, y);
    for (int i=0; i<24; i++) {
      b1[i].display();
      b2[i].display();
    }
  }
  

  void displayFuel() {
    displayFuel = (int)Pl.fuel; //Assegno ad un intero il varole a virgola mobile del fuel tramite un cast (int)
    if (Pl.fuel > 100) { //Per evitare false rappresentazioni, se il fuel dovesse superare il valore 100, gli viene riassegnato il medesimo valore.
      Pl.fuel = 100;
    }
    if (Pl.jetPackCharged == true) { //Se il jetpack è utilizzabile viene stampato il fuel rimanente
      fill(255);
      text(displayFuel + "%", 55, 40);
    } else { //Altrimenti viene stampato "Recharging" finchè non sarà nuovamente riutilizzabile
      fill(255);
      text("Recharging", 55, 40);
    }
  }

  void drawPlayer() {
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
  }

  void drawHearth(){
    hearth.resize(100,100);
    image(hearth, width-150, 0);
    text(Pl.lifes,width-65, 60);
  }


  void playerAction() {
    Pl.actions(); //Vengono eseguite tutte le funzioni che permettono la giocabilità del Giocatore
    Pl.jumpAnimation();
    Pl.jumpReset();
    Pl.drawfuel(); //Stampo nella canvas l'indicatore del fuel
    Pl.checkJetpack(); //Viene controllata la capacità rimanente del fuel
    Pl.fuelRegen(); //Viene rigenerato il fuel gradualmente
  }
  
  int num = 0;

  void display() {
    body();
    drawStillRocket();
    for (int i=0; i<5; i++)
      r[i].display();
    om[0].display();
    om[1].display();
    om[2].display();
    bullet[0].display();
    bullet[1].display();
    bullet[2].display();
  }
}
