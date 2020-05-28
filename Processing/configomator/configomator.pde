int compteurGlobalNiveaux =1 ;
float capital = 355000000;
float capitalAffiche = 27;
String niveauEnCours;
String uniteMonnaie = "";
boolean affichageEcranPrincipal = true, accueilOK=false;
boolean partieLancee = false;
boolean[] affichageEcran = new boolean[6], niveauTermine = new boolean[6], composantUnlocked = new boolean[6], afficherSceneAchat = new boolean[6];
PImage accueil, cadenas;
PImage[] sceneGarage = new PImage[5], sceneArgent = new PImage[5], reglesImg = new PImage[5], niveauImg = new PImage[5], finImg = new PImage[5];
PFont pixel, moon, meteora, arial;

void setup() {
  // taille fenêtre
  size(800, 600);

  pixel = createFont("dataPrincipal/font/pixel.ttf", 50);
  moon = createFont("dataPrincipal/font/moon.ttf", 50);
  meteora = createFont("dataPrincipal/font/meteora.ttf", 50);
  arial = createFont("Arial", 50);
  textFont(pixel);
  // CHARGER IMAGES
  for (int i=1; i<=4; i++) {
    sceneGarage[i]=loadImage("dataPrincipal/garage/Ecran Garage "+i+".png");
    sceneArgent[i]=loadImage("dataPrincipal/argent/achat"+i+".png");
  }
  setup11();
  setup12();
  setup21();
  setup22();
  cadenas = loadImage("dataPrincipal/cadenas.png");
  accueil = loadImage("dataPrincipal/configo accueil.png");
}

void draw() {
  if (accueilOK==true) {
    affichageEcranPrincipal();
    sceneArgentFonction();
  } else {
    affichageAccueil();
  }
  prochainNiveau();
  affichageEcranNiveaux();
  uniteMonnaie();
}

void keyPressed() {
  keyPressed22();
  if (key==ENTER) {
    accueilOK=true;
  }
}

void mouseClicked() {
  if (affichageEcran[1]==true) {
    mouseClicked11();
  }
  if (affichageEcran[2]==true) {
    mouseClicked12();
  }
  if (affichageEcran[3]==true) {
    skipNiveau21();
  }
  if (affichageEcran[4]==true) {
    mouseClicked22();
  }
}

void affichageAccueil() {
  image(accueil, 0, 0);
  textFont(pixel);
  textSize(50);
  textAlign(CENTER);
  if (frameCount%60>20) {
    fill(255, 255, 0);
    text("Press ENTER to begin", width/2, 430);
  }
}

void affichageEcranPrincipal() {
  if (affichageEcranPrincipal == true) {
    image(sceneGarage[compteurGlobalNiveaux], 0, 0);
    // bouton jouer
    strokeWeight(4);
    textAlign(CENTER);
    textFont(pixel);
    textSize(80);
    if (mouseX > 400 && mouseX < 700 && mouseY > 350 && mouseY < 430 
      && affichageEcranPrincipal == true) {
      // hover bouton jouer
      fill(255, 50, 50);
      rect(400, 350, 300, 80); // bouton jouer;
      fill(255, 215, 0);
      text("JOUER", 550, 410); // texte jouer;
      if (mousePressed==true&&afficherSceneAchat[compteurGlobalNiveaux]==false) {
        partieLancee = true ;
      }
    } else {
      fill(255, 0, 0);
      rect(400, 350, 300, 80);
      fill(0);
      text("JOUER", 550, 410);
    }
    // CADENAS ET TEXTE
    switch(compteurGlobalNiveaux) {
    case 1:
      image(cadenas, 50, 170, 70, 70);
      image(cadenas, 50, 250);
      image(cadenas, 40, 310);
      image(cadenas, 20, 380);
      break;
    case 2:
      image(cadenas, 50, 240, 70, 70);
      image(cadenas, 40, 310);
      image(cadenas, 20, 380);
      break;
    case 3:
      image(cadenas, 40, 300, 70, 70);
      image(cadenas, 20, 380);
      break;
    case 4:
      image(cadenas, 10, 370, 70, 70);
      break;
    }
    // AFFICHAGE INFOS
    afficherCapital();
    afficherNiveauEnCours();
    afficherTexteBulle(); // encore à faire
  }
}

void sceneArgentFonction() { 

  if (niveauTermine[compteurGlobalNiveaux]==true&&affichageEcranPrincipal==true
    &&mousePressed==true&& afficherSceneAchat[compteurGlobalNiveaux]==false) {
    afficherSceneAchat[compteurGlobalNiveaux]=true;
    affichageEcranPrincipal=false;
  }
  int prixDeVente=0;
  switch(compteurGlobalNiveaux) {
  case 1:
    if (mouseX > 70 && mouseX < 110 && mouseY > 170 && mouseY < 235&&composantUnlocked[1]==true) {
      afficherSceneAchat[1]=true;
      prixDeVente=argent11;
    } 
    break;
  case 2:
    if (mouseX > 65 && mouseX < 110 && mouseY >243&& mouseY < 310&&composantUnlocked[2]==true) {
      afficherSceneAchat[2]=true;
      prixDeVente=argent12;
    } 
    break;
  case 3:
    if (mouseX > 70 && mouseX < 110 && mouseY > 170 && mouseY < 235&&composantUnlocked[3]==true) {
      afficherSceneAchat[3]=true;
      prixDeVente=argent21;
    } 
    break;
  case 4:
    if (mouseX > 70 && mouseX < 110 && mouseY > 170 && mouseY < 235&&composantUnlocked[4]==true) {
      afficherSceneAchat[4]=true;
      prixDeVente=argent22;
    } 
    break;
  }
  if (afficherSceneAchat[compteurGlobalNiveaux]==true) {
    image(sceneArgent[compteurGlobalNiveaux], 0, 0);
    textFont(pixel);
    fill(0);
    textAlign(LEFT);
    textSize(50);
    text(prixDeVente, 647, 367);
    int achatHover=20;
    color couleurAchat;
    if (mouseX>568&&mouseX<752&&mouseY>407&&mouseY<496) {
      achatHover=20;
      fill(255, 50, 50);
      couleurAchat=color(255, 215, 0);
      if (mousePressed==true) {
        afficherSceneAchat[compteurGlobalNiveaux]=false;
        //composantUnlocked[compteurGlobalNiveaux]=false;
        compteurGlobalNiveaux++;
      }
    } else {
      achatHover=60;
      fill(255, 0, 0);
      couleurAchat=color(0);
    }
    stroke(0);
    strokeWeight(4);
    rect(568, 407, 184, 89, achatHover);
    fill(couleurAchat);
    textSize(40);
    textAlign(CENTER);
    text("ACHETER", 660, 460);
  }
}

void afficherCapital() {    // affiche en temps réel l'argent possédé
  fill(255);
  textSize(35);
  textAlign(RIGHT);
  text(nf(capitalAffiche, 0, 1) + " " + uniteMonnaie, 130, 95);
}

void afficherNiveauEnCours() { // affiche en temps réel le niveau en cours
  fill(200);
  textSize(40);
  textAlign(LEFT);
  text("STAGE "+niveauEnCours, 630, 95);
}

void afficherTexteBulle() { // en chantier
  fill(0);
  textSize(22);
  textAlign(RIGHT);
  text("Bienvenue sur le jeu _CONFIGOMATOR_ ! Clique sur le  \n\nbouton jouer pour relever le premier defi :)", 
    770, 480);
}
