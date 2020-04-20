int capital = 27;
int compteurGlobalNiveaux = 1;
String niveauEnCours = "1-1";
boolean ecranPrincipal = true;

void setup() {
  // taille fenêtre
  size(800, 600);

/*  // barre bleue haut
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
  smooth(8);
  rect(330, 370, 350, 80);

  // contours
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
  text("JOUER", 430, 427); */
}
void draw() {
  if (ecranPrincipal == true){
    afficherEcranPrincipal();
  }
  afficherTexteBulle(); // encore à faire
}

void afficherEcranPrincipal(){
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
  smooth(8);
  rect(330, 370, 350, 80);

  // contours
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
  afficherCapital();
  afficherNiveauEnCours();
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
  text("texteBulle[i]", 70, 545);
}

void prochainNiveau() {
  if (compteurGlobalNiveaux == 2) { 
    niveauEnCours = "1-2";
  }
  if (compteurGlobalNiveaux == 3) { 
    niveauEnCours = "2-1";
  }
  if (compteurGlobalNiveaux == 4) { 
    niveauEnCours = "2-2";
  }
  if (compteurGlobalNiveaux == 5) { 
    niveauEnCours = "3-1";
  }
  if (compteurGlobalNiveaux == 6) { 
    niveauEnCours = "3-2";
  }
  if (compteurGlobalNiveaux == 7) { 
    niveauEnCours = "4-1";
  }
  if (compteurGlobalNiveaux == 8) { 
    niveauEnCours = "4-2";
  }
}
