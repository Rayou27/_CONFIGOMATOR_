int capital = 27;
int compteurGlobalNiveaux = 2;
String niveauEnCours = "1-1";
boolean affichageEcranPrincipal = true;
boolean partieLancee = false;
boolean affichageEcran31 = false;
PImage persoConfigo;

void setup() {
  // taille fenêtre
  size(800, 600);
  persoConfigo = loadImage("persoConfigo.png");
}
void draw() {
  if (affichageEcranPrincipal == true) {
    afficherEcranPrincipal();
  }
  prochainNiveau();
  if (compteurGlobalNiveaux == 2 && partieLancee == true) {
    affichageEcranPrincipal = false;
    affichageEcran31 = true;
  }
}

void afficherEcranPrincipal() {
  // barre bleue haut
  fill(0, 70, 200);
  rect(0, 0, 800, 70);

  // barre jaune gauche
  fill(250, 200, 0);
  rect(0, 70, 230, 400);

  // barre blanche bas
  fill(255);
  rect(0, 470, 800, 130);

  // bouton jouer
  fill(255, 0, 0);
  rect(330, 370, 350, 80);

  // CONTOURS
  noFill();
  stroke(0);
  strokeWeight(7);

  // contours pour bleu
  rect(2, 2, 138, 70);
  rect(140, 2, 520, 70);
  rect(660, 2, 136, 70);

  // contour pour jaune
  rect(2, 72, 230, 400);

  // contour pour blanc
  rect(2, 472, 794, 124);

  // bordure droite
  line(796, 72, 796, 470);

  // contour pour rouge
  rect(330, 370, 350, 80);

  // nom du jeu
  fill(255);
  textSize(30);
  text("_CONFIGOMATOR_", 270, 47);

  // texte jouer
  textSize(50);
  text("JOUER", 430, 427);

  // AFFICHAGE INFOS
  afficherCapital();
  afficherNiveauEnCours();
  afficherTexteBulle(); // encore à faire
  
  // IMAGES
  image(persoConfigo, 30,440);
}

void afficherCapital() {    // affiche en temps réel l'argent possédé
  fill(255);
  textSize(30);
  text(capital + " $", 30, 50);
}

void afficherNiveauEnCours() { // affiche en temps réel le niveau en cours
  fill(255);
  textSize(30);
  text(niveauEnCours, 700, 50);
}

void afficherTexteBulle() { // en chantier
  fill(0);
  textSize(20);
  text("Bienvenue sur le jeu _CONFIGOMATOR_ ! \nClique sur le  bouton jouer pour relever le premier défi :)", 185, 527);
}

void testPartieLancee() {
  if (mouseX > 330 && mouseX < 670 && mouseY > 370 && mouseY < 450 && affichageEcranPrincipal == true && mousePressed == true) {
    partieLancee = true ;
  }
}
