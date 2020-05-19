void boutonEffacer() {
  // BOX
  stroke(0);
  strokeWeight(2);
  fill(200, 200, 255);
  rect(620, 510, 160, 60);
  // TEXTE
  textSize(30);
  fill(0);
  if (arrivee[3]==false) {
    text("Rejouer..", 640, 550);
  } else {
    text("Suivant !", 640, 550);
  }
  // FONCTIONNEL
  if (mouseClickedBoutonEffacer==true) {
    if (arrivee[3]==true) {
      compteurNiveau++;
    }
    background(45, 132, 138);
    for (int i=0; i<=3; i++) {
      depart[i]=false;
      arrivee[i]=false;
    }
    for (int i=1; i<=25; i++) {
      caseOccupee[i]=false;
    }
    couleurTrait=couleur[0];
    depart[0]=true;
    xCentreCarre=xJSON[billeDepart[compteurNiveau][0]];
    yCentreCarre=yJSON[billeDepart[compteurNiveau][0]];
    afficherQuadrillage();
    afficherMurs();
    afficherPoints();
    dernierMouvement="";
    compteurReplay22++;
    mouseClickedBoutonEffacer=false;
  }
}

// MESSAGE REJOINS
void rejoins() {
  fill(255);
  noStroke();
  rect(30, 367, 165, 55);
  fill(0);
  textSize(20);
  String nomCouleur="rouge";
  String[] baseCouleur={"rouge", "vert", "jaune", "bleu"};
  for (int i=0; i<=3; i++) {
    if (couleurTrait==couleur[i]) {
      nomCouleur=baseCouleur[i];
      textSize(13);
      fill(couleur[i]);
      text("Rejoins la couleur "+nomCouleur, 40, 400);
    }
    if (arrivee[3]==true) {
      fill(0);
      text("finiiii", 60, 400);
    }
  }
}
