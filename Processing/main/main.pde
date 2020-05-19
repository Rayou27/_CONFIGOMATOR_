int compteurGlobalNiveaux = 3;
float capital = 27;
float capitalAffiche = 27;
String niveauEnCours = "1-1";
String uniteMonnaie = "";
boolean affichageEcranPrincipal = true;
boolean partieLancee = false;
boolean[] affichageEcran = new boolean[9];
boolean[] niveauTermine = new boolean[9];
PImage persoConfigo;

void setup() {
  // taille fenêtre
  size(800, 600);

  // CHARGER IMAGES
  persoConfigo = loadImage("persoConfigo.png");
  setup21();
}

void draw() {
  affichageEcranPrincipal();
  affichageEcranNiveaux();
  testPartieLancee();
  prochainNiveau();
  uniteMonnaie();
}

void mouseClicked() {
  skipNiveau21();
}

void affichageEcranPrincipal() {
  if (affichageEcranPrincipal == true) {

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
    rect(2, 2, 178, 70); // gauche
    rect(180, 2, 480, 70); // milieu
    rect(660, 2, 136, 70); // droite

    // contour pour jaune
    rect(2, 72, 230, 400);

    // contour pour blanc
    rect(2, 472, 794, 124);

    // bordure droite
    line(796, 72, 796, 470); // compléter la bordure

    // contour pour rouge
    rect(330, 370, 350, 80);

    // nom du jeu
    fill(255);
    textSize(30);
    text("_CONFIGOMATOR_", 284, 47);

    // texte jouer
    textSize(50);
    text("JOUER", 430, 427);

    // AFFICHAGE INFOS
    afficherCapital();
    afficherNiveauEnCours();
    afficherTexteBulle(); // encore à faire

    // IMAGES
    image(persoConfigo, 30, 440);
  }
}

void afficherCapital() {    // affiche en temps réel l'argent possédé
  fill(255);
  textSize(30);
  text(nf(capitalAffiche, 0, 1) + " " + uniteMonnaie + "$", 30, 50);
}

void afficherNiveauEnCours() { // affiche en temps réel le niveau en cours
  fill(255);
  textSize(30);
  text(niveauEnCours, 700, 50);
}

void afficherTexteBulle() { // en chantier
  fill(0);
  textSize(20);
  text("Bienvenue sur le jeu _CONFIGOMATOR_ ! \nClique sur le  bouton jouer pour relever le premier défi :)", 
    185, 527);
}

void testPartieLancee() {
  if (mouseX >= 330 && mouseX <= 680 && mouseY >= 370 && mouseY <= 450 
    && affichageEcranPrincipal == true && mousePressed==true) {
    partieLancee = true ;
  }
}
