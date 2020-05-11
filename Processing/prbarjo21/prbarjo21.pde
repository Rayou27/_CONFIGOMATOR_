int mx, my, dBille=5;
int xValide, yValide;
int compteurNiveau=10, compteurPerdu=0;
int randomEnt, yBloc1=335, vMob=1;
color terrainOut = color(0), frontiere = color(196), gagne = color(158, 246, 156), big = color(119, 198, 255), clef = color(255, 201, 14), mobColor=color(109, 76, 65), murClef=color(8, 9, 99);
color colorPicker, zoneDebut, zoneFin, couleurBille;
char fleche ='→';
String[] texteBulle = new String[12], textePerdu =new String[5], texteGagne = new String[5];
color[] couleurChoixBille = new color[9];
boolean terrainOutAtteint=false, frontiereTouchee=false, partiePerdue=false, partieGagnee=false;
boolean setDepart = false, mobTouche=false, debutPartie=true, rainbowTest=false, antiRainbow=false;
boolean[] rainbow = new boolean[9];
boolean[] clefOK = new boolean[4];
PImage smileyPerdu, smileyGagne, replay, valide, persoConfigo21, bulle, clefImg;
PImage[] map = new PImage[11];
JSONArray prbarjoJSON;

void setup() {
  size(800, 600);
  setup21();
}

void draw() {
  draw21();
}

void setup21() {
  background(155, 155, 0);
  // IMAGES NIVEAUX
  for (int i=1; i<=10; i++) {
    map[i] = loadImage("map/Map "+i+".png");
  }
  // IMAGES SUPPLEMENTAIRES
  smileyPerdu = loadImage("21data/smiley perdu.png");
  smileyGagne = loadImage("21data/smiley gagne.png");
  replay = loadImage("21data/replay.png");
  valide = loadImage("21data/valide.png");
  persoConfigo21 = loadImage("21data/persoconfigo21.png");
  bulle = loadImage("21data/bulle.png");
  clefImg=loadImage("21data/key.png");
  mx = constrain(mx, 440, 800);
  xValide=290;
  yValide=480;
  prbarjoJSON = loadJSONArray("prbarjo.json");
  prbarjoJSON();
  couleurBille=couleurChoixBille[3];
}

void draw21() {
  if (compteurNiveau==0) {
    afficherEcranDebut21();
  } 
  if (compteurNiveau>=1&&compteurNiveau<=10) {
    afficher21();
  }
  if (compteurNiveau==11) {
    afficherEcranFin21();
  }
}

void afficher21() {
  affichageEcranPrBarjo();
  recupPixel();
  testZone();
  etatNiveau21();
  setDepart();
  boutons();
  afficherValide();
  entiteMobile();
  clefOK();
  bille();
}

void afficherEcranDebut21() {
  background(155, 155, 0);
  fill(0);
  textSize(40);
  textAlign(CENTER);
  text("2-2", width/2, 100);
  textSize(60);
  text("Pr Barjo", width/2, 170);
  stroke(0);
  strokeWeight(6);
  fill(255);
  rect(100, 200, 600, 250);
  fill(0);
  textSize(27);
  textAlign(LEFT);
  text(texteBulle[compteurNiveau], 135, 270);
  fill(200, 200, 255);
  rect(620, 510, 160, 60);
  fill(0);
  text("Let's Go~", 640, 549);
}

void affichageEcranPrBarjo() {
  background(155, 155, 0);
  translate(0, 0);
  image(map[compteurNiveau], 440, 0);
  // GEOMETRIE
  fill(220);
  noStroke();
  rect(0, 415, 440, 185);
  stroke(255);
  strokeWeight(5);
  noFill();
  rect(100, -5, 230, 110);
  // PERSO ET BULLE
  image(persoConfigo21, 25, 140);
  image(bulle, 105, 110);
  // TEXTE
  fill(couleurChoixBille[4]);
  textSize(50);
  text("Pr BARJO", 110, 70);
  fill(0);
  textSize(25);
  text("Lvl. "+compteurNiveau, 15, 60);
  textSize(20);
  text("Morts : "+compteurPerdu, 15, 135);
  textSize(15);
  if (partiePerdue==false&&partieGagnee==false) {
    text(texteBulle[compteurNiveau], 190, 180);
  }
  if (partiePerdue==true) {
    text(textePerdu[randomEnt], 200, 200);
  }
  if (partieGagnee==true) {
    text(texteGagne[randomEnt], 200, 200);
  }
  // CASES BOULES
  int n=1;
  for (int y=440; y<521; y+=80) {
    for (int x=50; x<351; x+=100) {
      // RECTANGLES VIERGES
      fill(255);
      stroke(2);
      strokeWeight(3);
      rect(x, y, 60, 60);
      // FOND GRIS
      if (mouseX<x+60&&mouseX>x&&mouseY>y&&mouseY<y+60) {
        fill(190);
        rect(x, y, 60, 60);
        if (mousePressed==true) {
          fill(140);
          rect(x, y, 60, 60);
          couleurBille=couleurChoixBille[n];
          xValide=x+40;
          yValide=y+40;
          rainbow[n]=true;
        }
      }
      println(rainbowTest);
      // BILLES DE COULEUR
      fill(couleurChoixBille[n]);
      ellipse(x+30, y+30, 30, 30);
      n++;
    }
  }
}

void afficherEcranFin21() {
  background(155, 155, 0);
  stroke(0);
  strokeWeight(6);
  fill(255);
  rect(100, 50, 600, 150);
  rect(100, 230, 370, 250);
  rect(500, 360, 200, 120);
  fill(0);
  textSize(27);
  textAlign(LEFT);
  text(texteBulle[compteurNiveau], 155, 95);
  fill(200, 200, 255);
  rect(620, 510, 160, 60);
  fill(0);
  text(fleche+" Garage", 640, 549);
  text("Nombre de morts : "+compteurPerdu, 130, 280);
  text("Bonus bordure : ×5", 130, 330);
  text("Bonus Rainbow* : oui", 130, 380);
  text("TOTAL", 550, 400);
  textSize(20);
  text("*Avoir testé au moins une fois\nchaque couleur", 130, 430);
}

void afficherValide() {
  image(valide, xValide, yValide);
}

void bille() {
  if (terrainOutAtteint==false && partieGagnee==false && setDepart==true
    && mouseX>440 && mouseX<800) {
    mx=mouseX;
    my=mouseY;
    noStroke();
    fill(couleurBille);
    if (colorPicker==big) {
      rect(mx-dBille/2, my-dBille/2, dBille, dBille);
    } else {
      ellipse(mx, my, dBille, dBille);
    }
  }
  if (terrainOutAtteint==true&& mouseX>440) {
    mx=mouseX-20;
    my=mouseY-20;
    image(smileyPerdu, mx, my);
  }
  if (partieGagnee==true&& mouseX>440) {
    mx=mouseX-20;
    my=mouseY-20;
    image(smileyGagne, mx, my);
  }
}

void recupPixel() {
  colorPicker=map[compteurNiveau].get(mx-440, my);
}

void testZone() {
  if ((colorPicker==terrainOut||mobTouche==true)&&partieGagnee==false) {
    terrainOutAtteint=true;
  }
  if (colorPicker==frontiere&&partieGagnee==false) {
    frontiereTouchee=true;
  }
  if (colorPicker==gagne&&terrainOutAtteint==false) {
    partieGagnee=true;
  }
  if (colorPicker==big) {
    dBille=10;
  } else {
    dBille=5;
  }
  if (colorPicker==clef) {
    if (compteurNiveau==2||compteurNiveau==7||compteurNiveau==10) {
      clefOK[1]=true;
    }
    if (compteurNiveau==6) {
      if (mouseY<200) {
        clefOK[1]=true;
      } else if (mouseX<600) {
        clefOK[2]=true;
      } else {
        clefOK[3]=true;
      }
    }
  }
}

void setDepart() {
  if (mouseX>440 && mouseX<470 && mouseY<40) {
    setDepart=true;
  }
  if (mouseX>440) {
    noCursor();
  } else {
    cursor();
  }
}

void boutons() {
  if (partieGagnee==true||partiePerdue==true) {
    fill(255);
    rect(340, 15, 75, 50);
    if (partieGagnee==true) {
      // rectangle suivant
      textSize(60);
      fill(0);
      text(fleche, 350, 60); // texte suivant
    }
    if (partiePerdue==true) {
      image(replay, 358, 20); // image replay
    }
  }
}

void etatNiveau21() {
  if (terrainOutAtteint==true) {
    textSize(40);
    fill(255, 0, 0);
    text("perdu :(", 210, 370);
    partiePerdue=true;
  }
  if (frontiereTouchee==true&&terrainOutAtteint==false) {
    textSize(40);
    int clignotant = millis();
    fill(0, 0, clignotant % 255); // inspiré du code exemple de la référence processing pour millis()
    ellipse(170, 355, 50, 50);
    text("BORDURE !", 210, 370);
  }
  if (frontiereTouchee==true) {  
    frontiereTouchee=false;
  }
}

void mouseClicked() {
  skipNiveau21();
}

void skipNiveau21() {
  randomEnt = (int)random(0, 5);
  if (compteurNiveau==0&&mouseX>620&&mouseX<780&&mouseY>510&&mouseY<570) {
    compteurNiveau=1;
  }
  if (compteurNiveau!=11&&compteurNiveau!=0 && mouseX > 340 && mouseX < 415 && mouseY > 15 && mouseY < 75) {
    if (partieGagnee==true) {
      compteurNiveau+=1;
      partieGagnee=false;
      println("go pour le niveau "+compteurNiveau);
    }
    if (partiePerdue==true) {
      println("niveau "+compteurNiveau+" relancé");
      compteurPerdu++;
    }
    partiePerdue=false;
    frontiereTouchee=false;
    terrainOutAtteint=false;
    setDepart=false;
    mobTouche=false;
    allClefFalse();
  }
}

void entiteMobile() {
  if (compteurNiveau==7) { 
    // moissonneuse batteuse 1
    stroke(mobColor);
    pushMatrix();
    translate(746, 65);
    rotate(radians(frameCount*2.5));
    strokeWeight(7);
    line(0, 0, 30, 0);
    popMatrix();
    // moissonneuse batteuse 2
    pushMatrix();
    translate(670, 463);
    rotate(radians(frameCount*2.5));
    strokeWeight(4);
    line(0, 0, 20, 0);
    popMatrix();
    // bloc 1
    if (frameCount%1==0) { // pour ralentir il faut augmenter le nombre derrière le %
      yBloc1+=vMob;
      if (yBloc1>390) {
        yBloc1=390;
        vMob*=-1;
      }
    }
    if (yBloc1<345) {
      yBloc1=345;
      vMob*=-1;
    }
    stroke(mobColor);
    strokeWeight(4);
    fill(mobColor);
    rect(580, yBloc1, 15, 10);
    rect(620, yBloc1, 15, 10);
    mobTouche();
  }
}

boolean mobTouche() {
  color u = get(mouseX, mouseY);
  if (u==mobColor||u==murClef) {
    mobTouche=true;
  }
  return mobTouche;
}

void clefOK() {
  if (compteurNiveau==2) {
    if (clefOK[1]==true) {
      fill(255);
      noStroke();
      rect(498, 143, 27, 15);
    } else {
      fill(murClef);
      noStroke();
      rect(550, 364, 20, 26);
    }
  }
  if (compteurNiveau==7) {
    if (clefOK[1]==true) {
      fill(255);
      noStroke();
      rect(685, 80, 30, 20);
    } else {
      fill(murClef);
      noStroke();
      rect(750, 290, 35, 20);
    }
  }
  if (compteurNiveau==6) {
    if (clefOK[1]==true) {
      fill(255);
      noStroke();
      rect(760, 150, 30, 20);
    } else {
      fill(murClef);
      noStroke();
      rect(489, 282, 25, 20);
    }
    if (clefOK[2]==true) {
      fill(255);
      noStroke();
      rect(490, 530, 30, 20);
    } else {
      fill(murClef);
      noStroke();
      rect(724, 480, 18, 20);
    }
    if (clefOK[3]==true) {
      fill(255);
      noStroke();
      rect(700, 530, 30, 20);
    } else {
      fill(murClef);
      noStroke();
      rect(747, 430, 25, 20);
    }
  }
  if (compteurNiveau==10) {
    if (clefOK[1]==true) {
      fill(255);
      noStroke();
      rect(694, 454, 35, 20);
    } else {
      fill(murClef);
      noStroke();
      rect(600, 207, 15, 22);
    }
  }
  mobTouche();
}

void allClefFalse() {
  for (int i=1; i<4; i++) {
    clefOK[i]=false;
  }
}

void prbarjoJSON() {
  JSONArray donneesCouleurs = prbarjoJSON.getJSONArray(0); 
  int r, g, b;
  for (int i=1; i<=8; i++) {
    JSONObject objetCouleurs = donneesCouleurs.getJSONObject(i);
    r= objetCouleurs.getInt("r");
    g= objetCouleurs.getInt("g");
    b= objetCouleurs.getInt("b");
    couleurChoixBille[i]=color(r, g, b);
  }
  JSONArray donneesBulles = prbarjoJSON.getJSONArray(1);
  JSONObject objetExpl = donneesBulles.getJSONObject(0);
  for (int i=0; i<=11; i++) {
    texteBulle[i] = objetExpl.getString(str(i));
  }
  JSONObject objetPerdu = donneesBulles.getJSONObject(1);
  JSONObject objetGagne = donneesBulles.getJSONObject(2);
  for (int i=0; i<=4; i++) {
    textePerdu[i] = objetPerdu.getString(str(i));
    texteGagne[i] = objetGagne.getString(str(i));
  }
}