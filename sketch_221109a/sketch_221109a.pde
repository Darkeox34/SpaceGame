player Pl = new player(); //Creo un oggetto Pl che conterrà tutti i metodi ed istanze che permetteranno la giocabilità del Giocatore
int displayFuel; //Variabile di appoggio per stampare la quantità di fuel rimasta
int frameCounter = 0; //Un contatore che verrà utilizzato per contare il numero di frame
  boolean aPressed = false;
  boolean dPressed = false;
  boolean wPressed = false;
  boolean ePressed = false;
  boolean qPressed = false;
  boolean spacePressed = false;
  
void keyPressed(){
  if(key == 'a')
    aPressed = true;
  if(key == 'd')
    dPressed = true;
  if(key == 'w')
    wPressed = true;
  if(key == 'q')
    qPressed = true;
  if(key == 'e')
    ePressed = true;
  if(key == ' ')
    spacePressed = true;
}

void keyReleased(){
  if(key == 'a')
    aPressed = false;
  if(key == 'd')
    dPressed = false;
  if(key == 'w')
    wPressed = false;
  if(key == 'q')
    qPressed = false;
  if(key == 'e')
    ePressed = false;
  if(key == ' ')
    spacePressed = false;
}


void shoot(){ //Funzione ridichiarata all'interno del main per essere eseguita in un altro thread
  frameCounter = 0;
  Pl.shoot();
  delay(400);
}

void setup(){
  size(1920, 1080); //Viene impostata la dimensione della canvas a 1920x1080
  Pl.imageLoad(); //Vengono assegnate alle PImage le corrispondenti immagini tramite il loro path
}

void draw(){
background(0); 
stroke(255);
line(0, 700, width, 700);
fill(58, 63, 99);
if(!keyPressed || (keyPressed && key == 'A' || keyPressed && key == 'D' || keyPressed && key == 'a' || keyPressed && key == 'd')){ //Se non vengono premuti tasti o se vengono premuti i tasti per effettuare il movimento
  if(frameCount % 10 == 0){ //Ogni 10 frame effettuo l'animazione della bandiera
    Pl.stillAnimation();
  }
  Pl.y += 5; //Incremento della Y per simulare la gravità
}

displayFuel = (int)Pl.fuel; //Assegno ad un intero il varole a virgola mobile del fuel tramite un cast (int)
Pl.drawfuel(); //Stampo nella canvas l'indicatore del fuel
Pl.Player.resize(140,140); //Viene ridimensionata la dimensione del giocatore
Pl.drawPlayer(); //Viene stampato nella canvas il giocatore
Pl.checkJetpack(); //Viene controllata la capacità rimanente del fuel
Pl.fuelRegen(); //Viene rigenerato il fuel gradualmente
Pl.checkDownBarrier(); //Viene controllato se il giocatore sta superando la barriera inferiore dell terreno
Pl.actions(); //Vengono eseguite tutte le funzioni che permettono la giocabilità del Giocatore
if(Pl.fuel > 100){ //Per evitare false rappresentazioni, se il fuel dovesse superare il valore 100, gli viene riassegnato il medesimo valore.
  Pl.fuel = 100;
}
if(Pl.jetPackCharged == true){ //Se il jetpack è utilizzabile viene stampato il fuel rimanente
fill(255);
text(displayFuel + "%", 50, 900);
}
else{ //Altrimenti viene stampato "Recharging" finchè non sarà nuovamente riutilizzabile
fill(255);
text("Recharging", 50, 900);
}


if(frameCount % 60 == 0){ //Ogni 60 frame vengono stampate le coordinate ed il fuel rimanente
  println("x: " + Pl.x + " y: " + Pl.y + " Stamina: " + Pl.fuel+ "/100");
  
}
  
}
