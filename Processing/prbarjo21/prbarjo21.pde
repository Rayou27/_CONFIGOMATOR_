int mx, my;

color bordure = color(0);
color frontiere = color(196);
color gagne = color(158, 246, 156);
color chemin = color(255);
color colorPicker;
color zoneDebut, zoneFin;

boolean bordureTouchee=false, frontiereTouchee=false;
boolean partiePerdue=false, partieGagnee=false;
boolean debutPartie=true;
boolean setDepart = false;

PImage premiereMap, smileyPerdu, smileyGagne, replay;

void setup() {
  size(800, 600);
  background(155, 155, 0);
  premiereMap = loadImage("Frame 1.png");
  smileyPerdu = loadImage("smiley perdu.png");
  smileyGagne = loadImage("smiley gagne.png");
  replay = loadImage("replay.png");
  mx = constrain(mx, 440, 800);
}

void draw() {
  afficher41();
}

void afficher41() {
  affichageEcranPrBarjo();
  recupPixel();
  testZone();
  etatNiveau();
  setDepart();
  bille();
  boutons();
}

void affichageEcranPrBarjo() {
  background(155, 155, 0);
  image(premiereMap, 440, 0);

  // GEOMETRIE
  fill(220);
  noStroke();
  rect(0, 415, 440, 185);

  // TEXTE
  fill(0);
  textSize(40);
  text("Pr BARJO", 100, 70);

  // CASES BOULES
  for (int x=50; x<351; x+=100) {
    for (int y=440; y<521; y+=80) {
      fill(255);
      stroke(2);
      rect(x, y, 60, 60);
    }
  }
}

void bille() {
  if (bordureTouchee==false && partieGagnee==false && setDepart==true
    && mouseX>440 && mouseX<800) {
    mx=mouseX;
    my=mouseY;
    noStroke();
    fill(255, 0, 0);
    ellipse(mx, my, 5, 5);
  }
  if (bordureTouchee==true&& mouseX>440) {
    mx=mouseX;
    my=mouseY;
    translate(-20, -20);
    image(smileyPerdu, mx, my);
  }
  if(partieGagnee==true&& mouseX>440){
    mx=mouseX;
    my=mouseY;
    translate(-20, -20);
    image(smileyGagne, mx, my);
  }
}

void recupPixel() {
  colorPicker=premiereMap.get(mx-440, my);
}

void testZone() {
  if (colorPicker==bordure&&partieGagnee==false) {
    bordureTouchee=true;
  }
  if (colorPicker==frontiere&&partieGagnee==false) {
    frontiereTouchee=true;
  }
  if (colorPicker==gagne&&bordureTouchee==false){
    partieGagnee=true;
  }
}

void setDepart() {
  if (mouseX>440 && mouseX<470 && mouseY<40) {
    setDepart=true;
  }
  if (mouseX>440) {
    noCursor();
    ;
  } else {
    cursor();
  }
}

void boutons(){
  if(partieGagnee==true){
    fill(255);
    rect(250,300,150,50); // rectangle suivant
    textSize(27);
    fill(0);
    text("Suivant !",270,330); // texte suivant
  }
  if(partiePerdue==true){
    fill(255);
    rect(750,550,50,50); // carré replay
    image(replay,755,555); // image replay
  }
}

void etatNiveau() {
  if (bordureTouchee==true) {
    textSize(40);
    fill(255, 0, 0);
    text("perdu :(", 210, 390);
    partiePerdue=true;
  }
  if (frontiereTouchee==true&&bordureTouchee==false) {
    textSize(40);
    int clignotant = millis();
    fill(0, 0, clignotant % 255); // inspiré du code exemple de la référence processing pour millis()
    ellipse(170, 375, 50, 50);
    text("BORDURE !", 210, 390);
  }
  if (frontiereTouchee==true) {  
    frontiereTouchee=false;
  }
}
