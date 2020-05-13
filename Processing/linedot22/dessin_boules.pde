int[] compteurDepart1={1, 2, 3, 12};
int[] compteurArrivee1={18, 25, 5, 21};

int[] compteurDepart = new int[4], compteurArrivee=new int[4];
boolean[] depart = new boolean[5];
boolean[] arrivee = new boolean[5];
color[] couleur = {color(255, 0, 0), color(0, 255, 0), color(255, 255, 0), color(0, 0, 255)};

void afficherPoints() {
  if (compteurNiveau>0&&compteurNiveau<6) {
    // NIVEAU 1
    if (compteurNiveau==1) {
      compteurDepart=compteurDepart1;
      compteurArrivee=compteurArrivee1;
    }
    for (int i=0; i<4; i++) {
      // POINTS DE DEPART
      if (depart[i]==true) {
        stroke(0);
        strokeWeight(3);
        fill(couleur[i]);
        ellipse(xJSON[compteurDepart[i]], yJSON[compteurDepart[i]], 40, 40);
      } else {
        noStroke();
        fill(couleur[i]);
        ellipse(xJSON[compteurDepart[i]], yJSON[compteurDepart[i]], 40, 40);
      }
      // POINTS D'ARRIVEE
      int d;
      noStroke();
      if (depart[i]==true) {
        d=40;
        fill(couleur[i]);
        noStroke();
        ellipse(xJSON[compteurArrivee[i]], yJSON[compteurArrivee[i]], d, d);
        stroke(150);
        strokeWeight(4);
        noFill();
        ellipse(xJSON[compteurDepart[i]], yJSON[compteurDepart[i]], 40, 40);
      } else {
        d=20;
        fill(couleur[i]);
        noStroke();
        ellipse(xJSON[compteurArrivee[i]], yJSON[compteurArrivee[i]], d, d);
      }
    }
  }
}
