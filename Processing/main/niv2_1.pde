int mx, my, dBille=5;
int xValide, yValide;
int compteurNiveau21=0, compteurPerdu21=0, compteurFrontiere21=0, argent21=0;
int randomEnt, yBloc1=335, vMob=1;
color terrainOut = color(0), frontiere = color(196), gagne = color(158, 246, 156), big = color(119, 198, 255), clef = color(255, 201, 14), mobColor=color(109, 76, 65), murClef=color(8, 9, 99);
color colorPicker, zoneDebut, zoneFin, couleurBille;
String rainbowFinal="Non";
String[] texteBulle = new String[12], textePerdu =new String[5], texteGagne = new String[5];
color[] couleurChoixBille = new color[9];
boolean terrainOutAtteint=false, frontiereTouchee=false, partiePerdue=false, partieGagnee=false;
boolean setDepart = false, mobTouche=false, debutPartie=true, rainbowTest=false, bonusFrontiere=true;
boolean[] rainbow = new boolean[9];
boolean[] clefOK = new boolean[5];
PImage smileyPerdu, smileyGagne, replay, valide, persoConfigo21, bulle, clefImg;
PImage[] map = new PImage[11];
JSONArray prbarjoJSON;

void setup21() {
  // BACKGROUND
  reglesImg[3]=loadImage("data21/regles21.png");
  niveauImg[3]=loadImage("data21/level21.png");
  finImg[3]=loadImage("data21/fin21.png");
  // IMAGES NIVEAUX
  for (int i=1; i<=10; i++) {
    map[i] = loadImage("data21/map/Map "+i+".png");
    if (i<9) {
      rainbow[i]=false;
    }
  }
  // IMAGES SUPPLEMENTAIRES
  smileyPerdu = loadImage("data21/autres/smiley perdu.png");
  smileyGagne = loadImage("data21/autres/smiley gagne.png");
  replay = loadImage("data21/autres/replay.png");
  valide = loadImage("data21/autres/valide.png");
  persoConfigo21 = loadImage("data21/autres/persoconfigo21.png");
  bulle = loadImage("data21/autres/bulle.png");
  clefImg=loadImage("data21/autres/key.png");
  mx = constrain(mx, 440, 800);
  xValide=300;
  yValide=480;
  prbarjoJSON = loadJSONArray("data21/prbarjo.json");
  prbarjoJSON();
  couleurBille=couleurChoixBille[3];
}

void draw21() {
  textAlign(LEFT);
  if (compteurNiveau21==0) {
    afficherEcranDebut21();
  } 
  if (compteurNiveau21>=1&&compteurNiveau21<=10) {
    afficher21();
  }
  if (compteurNiveau21==11) {
    afficherEcranFin21();
  }
  argent21();
}

void afficher21() {
  affichageEcranPrBarjo();
  testZone();
  etatNiveau21();
  setDepart();
  boutons();
  entiteMobile();
  clefOKFonction();
  bille();
  rainbow();
}

void afficherEcranDebut21() {
  image(reglesImg[compteurGlobalNiveaux], 0, 0);
  textFont(meteora);
  fill(0);
  textSize(27);
  textAlign(CENTER);
  text(texteBulle[compteurNiveau21], width/2, 230);
  int letsgoHover21=0;
  if (mouseX>430&&mouseX<680&&mouseY>450&&mouseY<530) {
    letsgoHover21=10;
    fill(hover);
  } else {
    letsgoHover21=30;
    fill(neutre);
  }
  stroke(0, 48, 73);
  strokeWeight(4);
  rect(430, 450, 250, 80, letsgoHover21);
  fill(0); // fill le texte en hover aussi /!\
  textSize(35);
  text("Let's Go !!", 557, 503);
}  

void affichageEcranPrBarjo() {
  image(niveauImg[compteurGlobalNiveaux], 0, 0);
  image(map[compteurNiveau21], 440, 0);
  textSize(25);
  textFont(pixel);
  textSize(50);
  textAlign(LEFT);
  fill(0);
  text(compteurPerdu21, 284, 147);
  text(compteurFrontiere21, 295, 205);
  text(compteurNiveau21, 387, 205);
  textFont(meteora);
  textSize(18);
  textAlign(LEFT);
  if (partiePerdue==false&&partieGagnee==false) {
    text(texteBulle[compteurNiveau21], 190, 267);
  }
  if (partiePerdue==true) {
    textSize(20);
    textAlign(CENTER);
    fill(255, 0, 0);
    text(textePerdu[randomEnt], 290, 300);
  }
  if (partieGagnee==true) {
    textSize(20);
    fill(0, 200, 0);
    textAlign(CENTER);
    text(texteGagne[randomEnt], 290, 300);
  }
  // CASES BOULES
  int n=1;
  for (int y=440; y<521; y+=80) {
    for (int x=70; x<356; x+=95) {
      // RECTANGLES VIERGES
      fill(255);
      stroke(2);
      strokeWeight(4);
      int bouleHover21=20;
      // HOVER  GRIS
      if (mouseX<x+60&&mouseX>x&&mouseY>y&&mouseY<y+60) {
        fill(190);
        bouleHover21=10;
        if (mousePressed==true) {
          fill(140);
          couleurBille=couleurChoixBille[n];
          xValide=x+40;
          yValide=y+40;
          rainbow[n]=true;
        }
      }
      rect(x, y, 60, 60, bouleHover21);
      // BILLES DE COULEUR
      fill(couleurChoixBille[n]);
      ellipse(x+30, y+30, 30, 30);
      n++;
    }
  }
  image(valide, xValide, yValide);
}

void afficherEcranFin21() {
  image(finImg[compteurGlobalNiveaux], 0, 0);
  textFont(meteora);
  textAlign(CENTER);
  fill(0);
  textSize(24);
  text(texteBulle[compteurNiveau21], width/2, 190);
  textAlign(LEFT);
  fill(0);
  textSize(22);
  text("Nombre de morts : ", 130, 345);
  text("Bonus bordure : x ", 130, 390);   
  text("Bonus Rainbow* : ", 130, 435);
  textSize(15);
  text("*Avoir testé au moins une fois\nchaque couleur", 140, 470); 
  textSize(23);
  fill(reponseMauvaisCouleur);
  if (rainbowTest==true) {
    rainbowFinal="Oui";
    fill(reponseJusteCouleur);
  }
  text(rainbowFinal, 115+textWidth("Bonus Rainbow* : "), 435);
  textFont(pixel);
  textAlign(LEFT);
  textSize(50);
  textAlign(CENTER);
  fill(0, 48, 73);
  text(argent21+" $", 575, 380);
  fill(0);
  textSize(40);
  textAlign(LEFT);
  text(score32, 355, 347);
  text(compteurFrontiere21, 345, 392);  
  int homeHover21=20;
  color neutre21=color(252, 191, 73), hover21=color(240, 159, 4);
  if (mouseX>588&&mouseX<676&&mouseY>438&&mouseY<520) {
    homeHover21=20;
    fill(hover21);
  } else {
    homeHover21=60;
    fill(neutre21);
  }
  rect(588, 438, 88, 82, homeHover21);
  fill(0);
  textSize(60);
  textFont(arial);
  textAlign(CENTER);
  text("⌂", 633, 490);
  textFont(meteora);
  if (niveauTermine[3]==true) {
    affichageEcran[3]=false;
    affichageEcranPrincipal=true;
    affichageEcranPrincipal();
  }
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

void testZone() {
  colorPicker=map[compteurNiveau21].get(mx-440, my);
  if ((colorPicker==terrainOut||mobTouche==true)&&partieGagnee==false) {
    terrainOutAtteint=true;
  }
  if (colorPicker==frontiere&&partieGagnee==false) {
    frontiereTouchee=true;
    bonusFrontiere=false;
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
    if (compteurNiveau21==2||compteurNiveau21==7||compteurNiveau21==10) {
      clefOK[1]=true;
    }
    if (compteurNiveau21==6) {
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
    // BOUTON SUIVANT
    int suivHover21=0;
    if (mouseX>335&&mouseX<405&&mouseY>90&&mouseY<160) {
      suivHover21=10;
      fill(hover);
    } else {
      suivHover21=30;
      fill(neutre);
    }
    stroke(0, 48, 73);
    strokeWeight(5);
    rect(335, 90, 70, 70, suivHover21);
    fill(0);
    String suiv;
    textFont(meteora);
    if (compteurNiveau21==10&&partieGagnee==true) {
      suiv="Fin";
      textSize(27);
      text(suiv, 370, 136);
    } else if (partieGagnee==true) {
      suiv=">>";
      textSize(30);
      text(suiv, 370, 136);
    } else {
      image(replay, 350, 106);
    }
  }
}

void etatNiveau21() {
  if (terrainOutAtteint==true) {
    partiePerdue=true;
  }
  if (frontiereTouchee==true&&terrainOutAtteint==false) {
    textSize(40);
    int clignotant = millis();
    fill(0, 0, clignotant % 255); // inspiré du code exemple de la référence processing pour millis()
  } else {
    fill(0);
  }
  if (partieGagnee==false) {
    ellipse(370, 125, 50, 50);
  }
  if (frontiereTouchee==true) {  
    frontiereTouchee=false;
  }
}

void skipNiveau21() {
  if (mouseX>430&&mouseX<680&&mouseY>450&&mouseY<530&&compteurNiveau21==0) {
    compteurNiveau21=1;
  }
  if (compteurNiveau21!=11&&compteurNiveau21!=0 && mouseX>335&&mouseX<405&&mouseY>90&&mouseY<160) {
    if (partieGagnee==true) {
      compteurNiveau21++;
      partieGagnee=false;
      println("go pour le niveau "+compteurNiveau21);
      if (bonusFrontiere==true) {
        compteurFrontiere21++;
      }
    }
    if (partiePerdue==true) {
      println("niveau "+compteurNiveau21+" relancé");
      compteurPerdu21++;
    }
    bonusFrontiere=true;
    partiePerdue=false;
    frontiereTouchee=false;
    terrainOutAtteint=false;
    setDepart=false;
    mobTouche=false;
    allClefFalse();
    randomEnt = (int)random(0, 5);
  }
  if(compteurNiveau21==11&&mouseX>588&&mouseX<676&&mouseY>438&&mouseY<520){
    niveauTermine[3]=true;
  }
}

void entiteMobile() {
  if (compteurNiveau21==7) { 
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

void clefOKFonction() {
  if (compteurNiveau21==2) {
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
  if (compteurNiveau21==7) {
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
  if (compteurNiveau21==6) {
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
  if (compteurNiveau21==10) {
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

void rainbow() {
  if (rainbow[1]==true&&rainbow[2]==true&&rainbow[3]==true
    &&rainbow[4]==true&&rainbow[5]==true&&rainbow[6]==true
    &&rainbow[7]==true&&rainbow[8]==true) {
    rainbowTest=true;
  }
}

public int argent21() {
  if (rainbowTest==true) {
    argent21=10500;
  } else {
    argent21=0;
  }
  argent21+=50000-500*compteurPerdu21+800*compteurFrontiere21;
  return argent21;
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
