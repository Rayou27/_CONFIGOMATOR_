int mx, my;

color bordure = color(0);
color frontiere = color(196);
color gagne = color(158, 246, 156);
color chemin = color(255);
color colorPicker;
color zoneDebut, zoneFin;

color[] couleurChoixBille = new color[9];

boolean bordureTouchee=false, frontiereTouchee=false;
boolean partiePerdue=false, partieGagnee=false;
boolean debutPartie=true;
boolean setDepart = false;

boolean[] rectangleChoixBille = new boolean[9];

PImage premiereMap, smileyPerdu, smileyGagne, replay;

void setup() {
  size(800, 600);
  background(155, 155, 0);
  setup41();
}

void draw() {
  afficher41();
}

void setup41() {
  premiereMap = loadImage("Frame 3.png");
  smileyPerdu = loadImage("smiley perdu.png");
  smileyGagne = loadImage("smiley gagne.png");
  replay = loadImage("replay.png");
  mx = constrain(mx, 440, 800);
  for (int i=1; i<=8; i++) {
    rectangleChoixBille[i]=false;
  }
  couleurChoixBille[1]=color(255, 0, 0); // ROUGE
  couleurChoixBille[2]=color(252, 168, 0); // ORANGE
  couleurChoixBille[3]=color(255, 255, 0); // JAUNE
  couleurChoixBille[4]=color(252, 0, 173); // ROSE
  couleurChoixBille[5]=color(0, 252, 122); // VERT
  couleurChoixBille[6]=color(153, 2, 60); // VIOLET
  couleurChoixBille[7]=color(2, 57, 153);  // BLEU
  couleurChoixBille[8]=color(24, 178, 184); // CYAN
}

void mousePressed() {
  choixBille();
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
  int n=1;
  // CASES BOULES
  for (int y=440; y<521; y+=80) {
    for (int x=50; x<351; x+=100) {
      // RECTANGLES VIERGES
      fill(255);
      stroke(2);
      rect(x, y, 60, 60);
      // BILLES DE COULEUR
      fill(couleurChoixBille[n]);
      ellipse(x+30, y+30, 30, 30);
      n++;
    }
  }
  // CASES BOULES COLOREES
  if (rectangleChoixBille[1]==true) {
    fill(150);
    rect(50, 440, 60, 60);
  }
  if (rectangleChoixBille[2]==true) {
    fill(150);
    rect(150, 440, 60, 60);
  }
  if (rectangleChoixBille[3]==true) {
    fill(150);
    rect(250, 440, 60, 60);
  }
  if (rectangleChoixBille[4]==true) {
    fill(150);
    rect(350, 440, 60, 60);
  }
  if (rectangleChoixBille[5]==true) {
    fill(150);
    rect(50, 520, 60, 60);
  }
  if (rectangleChoixBille[6]==true) {
    fill(150);
    rect(150, 520, 60, 60);
  }
  if (rectangleChoixBille[7]==true) {
    fill(150);
    rect(250, 520, 60, 60);
  }
  if (rectangleChoixBille[8]==true) {
    fill(350);
    rect(350, 520, 60, 60);
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
  if (partieGagnee==true&& mouseX>440) {
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
  if (colorPicker==gagne&&bordureTouchee==false) {
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

void boutons() {
  if (partieGagnee==true) {
    fill(255);
    rect(250, 300, 150, 50); // rectangle suivant
    textSize(27);
    fill(0);
    text("Suivant !", 270, 330); // texte suivant
  }
  if (partiePerdue==true) {
    fill(255);
    rect(750, 550, 50, 50); // carré replay
    image(replay, 755, 555); // image replay
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

void choixBille() {
  if (mouseX<110&&mouseX>50&&mouseY>440&&mouseY<500) {
    rectangleChoixBille[1]=true;
  }
  if (mouseX > 150 && mouseX < 210 && mouseY > 440 && mouseY < 500) {
    rectangleChoixBille[2]=true;
  }
  if (mouseX > 250 && mouseX < 310 && mouseY > 440 && mouseY < 500) {
    rectangleChoixBille[3]=true;
  }
  if (mouseX > 350 && mouseX < 410 && mouseY > 440 && mouseY < 500) {
    rectangleChoixBille[4]=true;
  }
  if (mouseX > 50 && mouseX < 110 && mouseY > 520 && mouseY < 580) {
    rectangleChoixBille[5]=true;
  }
  if (mouseX > 150 && mouseX < 210 && mouseY > 520 && mouseY < 580) {
    rectangleChoixBille[6]=true;
  }
  if (mouseX > 250 && mouseX < 310 && mouseY > 520 && mouseY < 580) {
    rectangleChoixBille[7]=true;
  }
  if (mouseX > 350 && mouseX < 410 && mouseY > 520 && mouseY < 580) {
    rectangleChoixBille[8]=true;
  }
}
