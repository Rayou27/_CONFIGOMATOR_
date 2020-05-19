void afficherPoints() {
  if (compteurNiveau>0&&compteurNiveau<11) {
    // NIVEAU 1
    for (int i=0; i<4; i++) {
      // POINTS DE DEPART
      if (depart[i]==true) {
        stroke(0);
        strokeWeight(3);
        fill(couleur[i]);
        ellipse(xJSON[billeDepart[compteurNiveau][i]], yJSON[billeDepart[compteurNiveau][i]], 40, 40);
      } else {
        noStroke();
        fill(couleur[i]);
        ellipse(xJSON[billeDepart[compteurNiveau][i]], yJSON[billeDepart[compteurNiveau][i]], 40, 40);
      }
      // POINTS D'ARRIVEE
      int d;
      noStroke();
      if (arrivee[i]==true) {
        d=40;
        fill(couleur[i]);
        noStroke();
        ellipse(xJSON[billeArrivee[compteurNiveau][i]], yJSON[billeArrivee[compteurNiveau][i]], d, d);
        stroke(150);
        strokeWeight(4);
        noFill();
        ellipse(xJSON[billeDepart[compteurNiveau][i]], yJSON[billeDepart[compteurNiveau][i]], 40, 40);
      } else {
        d=20;
        fill(couleur[i]);
        noStroke();
        ellipse(xJSON[billeArrivee[compteurNiveau][i]], yJSON[billeArrivee[compteurNiveau][i]], d, d);
      }
    }
  }
}
