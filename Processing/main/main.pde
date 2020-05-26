int compteurGlobalNiveaux =1 ;
float capital = 355000000;
float capitalAffiche = 27;
String niveauEnCours;
String uniteMonnaie = "";
boolean affichageEcranPrincipal = true;
boolean partieLancee = false;
boolean[] affichageEcran = new boolean[5];
boolean[] niveauTermine = new boolean[5];
PImage[] scene = new PImage[5];
PFont pixel, moon, meteora;

void setup() {
  // taille fenêtre
  size(800, 600);
  pixel = createFont("dataPrincipal/pixel.ttf", 50);
  moon = createFont("dataPrincipal/moon.ttf", 50);
  meteora = createFont("dataPrincipal/meteora.ttf", 50);
  textFont(pixel);
  // CHARGER IMAGES
  for (int i=1; i<=4; i++) {
    scene[i]=loadImage("dataPrincipal/Ecran Garage "+i+".png");
  }
  setup11();
  setup12();
  setup21();
  setup22();
}

void draw() {
  prochainNiveau();
  affichageEcranPrincipal();
  affichageEcranNiveaux();
  uniteMonnaie();
}

void keyPressed() {
  keyPressed22();
}

void mouseClicked() {
  mouseClicked11();
  mouseClicked12();
  skipNiveau21();
  mouseClicked22();
}

void affichageEcranPrincipal() {
  if (affichageEcranPrincipal == true) {
    image(scene[compteurGlobalNiveaux], 0, 0);
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
      if (mousePressed==true) {
        partieLancee = true ;
      }
    } else {
      fill(255, 0, 0);
      rect(400, 350, 300, 80);
      fill(0);
      text("JOUER", 550, 410);
    }
    // AFFICHAGE INFOS
    afficherCapital();
    afficherNiveauEnCours();
    afficherTexteBulle(); // encore à faire
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
