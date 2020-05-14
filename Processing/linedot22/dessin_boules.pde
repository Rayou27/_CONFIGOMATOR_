void afficherPoints() {
  if (compteurNiveau>0&&compteurNiveau<6) {
    // NIVEAU 1
    for (int i=0; i<4; i++) {
      // POINTS DE DEPART
      if (depart[i]==true) {
        stroke(0);
        strokeWeight(3);
        fill(couleur[i]);
        ellipse(xJSON[compteurDepart[compteurNiveau][i]], yJSON[compteurDepart[compteurNiveau][i]], 40, 40);
      } else {
        noStroke();
        fill(couleur[i]);
        ellipse(xJSON[compteurDepart[compteurNiveau][i]], yJSON[compteurDepart[compteurNiveau][i]], 40, 40);
      }
      // POINTS D'ARRIVEE
      int d;
      noStroke();
      if (depart[i]==true) {
        d=40;
        fill(couleur[i]);
        noStroke();
        ellipse(xJSON[compteurArrivee[compteurNiveau][i]], yJSON[compteurArrivee[compteurNiveau][i]], d, d);
        stroke(150);
        strokeWeight(4);
        noFill();
        ellipse(xJSON[compteurDepart[compteurNiveau][i]], yJSON[compteurDepart[compteurNiveau][i]], 40, 40);
      } else {
        d=20;
        fill(couleur[i]);
        noStroke();
        ellipse(xJSON[compteurArrivee[compteurNiveau][i]], yJSON[compteurArrivee[compteurNiveau][i]], d, d);
      }
    }
  }
}
