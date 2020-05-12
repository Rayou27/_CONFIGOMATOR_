void afficherPoints() {
  if (compteurNiveau>0&&compteurNiveau<6) {
    // NIVEAU 1
    if (compteurNiveau==1) {
      // POINTS DE DEPART
      if (rougeDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(rouge);
        ellipse(240, 140, 40, 40);
      } else {
        noStroke();
        fill(rouge);
        ellipse(240, 140, 40, 40);
      }
      if (vertDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(vert);
        ellipse(320, 140, 40, 40);
      } else {
        noStroke();
        fill(vert);
        ellipse(320, 140, 40, 40);
      }
      if (jauneDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(jaune);
        ellipse(400, 140, 40, 40);
      } else {
        noStroke();
        fill(jaune);
        ellipse(400, 140, 40, 40);
      }
      if (bleuDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(bleu);
        ellipse(320, 300, 40, 40);
      } else {
        noStroke();
        fill(bleu);
        ellipse(320, 300, 40, 40);
      }
      // POINTS D'ARRIVEE
      int d;
      noStroke();
      if (rougeArrivee==true) {
        d=40;
        fill(rouge);
        noStroke();
        ellipse(400, 380, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(240, 140, 40, 40);
      } else {
        d=20;
        fill(rouge);
        noStroke();
        ellipse(400, 380, d, d);
      }
      if (vertArrivee==true) {
        d=40;
        fill(vert);
        noStroke();
        ellipse(560, 460, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(320, 140, 40, 40);
      } else {
        d=20;
        fill(vert);
        noStroke();
        ellipse(560, 460, d, d);
      }
      if (jauneArrivee==true) {
        d=40;
        fill(jaune);
        noStroke();
        ellipse(560, 140, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(400, 140, 40, 40);
      } else {
        d=20;
        fill(jaune);
        noStroke();
        ellipse(560, 140, d, d);
      }
      if (bleuArrivee==true) {
        d=40;
        fill(bleu);
        noStroke();
        ellipse(240, 460, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(320, 300, 40, 40);
      } else {
        d=20;
        fill(bleu);
        noStroke();
        ellipse(240, 460, d, d);
      }
    }
    // NIVEAU 2
    if (compteurNiveau==2) {
      // POINTS DE DEPART
      if (rougeDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(rouge);
        ellipse(240, 140, 40, 40);
      } else {
        noStroke();
        fill(rouge);
        ellipse(240, 140, 40, 40);
      }
      if (vertDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(vert);
        ellipse(480, 140, 40, 40);
      } else {
        noStroke();
        fill(vert);
        ellipse(480, 140, 40, 40);
      }
      if (jauneDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(jaune);
        ellipse(240, 220, 40, 40);
      } else {
        noStroke();
        fill(jaune);
        ellipse(240, 220, 40, 40);
      }
      if (bleuDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(bleu);
        ellipse(320, 220, 40, 40);
      } else {
        noStroke();
        fill(bleu);
        ellipse(320, 220, 40, 40);
      }
      // POINTS D'ARRIVEE
      int d;
      noStroke();
      if (rougeArrivee==true) {
        d=40;
        fill(rouge);
        noStroke();
        ellipse(400, 380, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(240, 140, 40, 40);
      } else {
        d=20;
        fill(rouge);
        noStroke();
        ellipse(400, 380, d, d);
      }
      if (vertArrivee==true) {
        d=40;
        fill(vert);
        noStroke();
        ellipse(560, 460, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(480, 140, 40, 40);
      } else {
        d=20;
        fill(vert);
        noStroke();
        ellipse(560, 460, d, d);
      }
      if (jauneArrivee==true) {
        d=40;
        fill(jaune);
        noStroke();
        ellipse(240, 460, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(240, 220, 40, 40);
      } else {
        d=20;
        fill(jaune);
        noStroke();
        ellipse(240, 460, d, d);
      }
      if (bleuArrivee==true) {
        d=40;
        fill(bleu);
        noStroke();
        ellipse(480, 220, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(320, 220, 40, 40);
      } else {
        d=20;
        fill(bleu);
        noStroke();
        ellipse(480, 220, d, d);
      }
    } 
    if (compteurNiveau==3) {
      if (rougeDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(rouge);
        ellipse(480, 140, 40, 40); // départ
      } else {
        noStroke();
        fill(rouge);
        ellipse(480, 140, 40, 40); // départ
      }
      if (vertDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(vert);
        ellipse(560, 140, 40, 40);
      } else {
        noStroke();
        fill(vert);
        ellipse(560, 140, 40, 40);
      }
      if (jauneDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(jaune);
        ellipse(320, 220, 40, 40);
      } else {
        noStroke();
        fill(jaune);
        ellipse(320, 220, 40, 40);
      }
      if (bleuDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(bleu);
        ellipse(400, 380, 40, 40);
      } else {
        noStroke();
        fill(bleu);
        ellipse(400, 380, 40, 40);
      }
      // POINTS D'ARRIVEE
      int d;
      noStroke();
      if (rougeArrivee==true) {
        d=40;
        fill(rouge);
        noStroke();
        ellipse(240, 460, d, d); // arrivée
        stroke(150);
        strokeWeight(4);
        ellipse(480, 140, 40, 40); // départ
      } else {
        d=20;
        fill(rouge);
        noStroke();
        ellipse(240, 460, d, d); // arrivée
      }
      if (vertArrivee==true) {
        d=40;
        fill(vert);
        noStroke();
        ellipse(480, 460, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(560, 140, 40, 40);
      } else {
        d=20;
        fill(vert);
        noStroke();
        ellipse(480, 460, d, d);
      }
      if (jauneArrivee==true) {
        d=40;
        fill(jaune);
        noStroke();
        ellipse(480, 220, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(320, 220, 40, 40);
      } else {
        d=20;
        fill(jaune);
        noStroke();
        ellipse(480, 220, d, d);
      }
      if (bleuArrivee==true) {
        d=40;
        fill(bleu);
        noStroke();
        ellipse(560, 460, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(400, 380, 40, 40);
      } else {
        d=20;
        fill(bleu);
        noStroke();
        ellipse(560, 460, d, d);
      }
    }
  } 
  if (compteurNiveau==4) {
    ;
  } 
  if (compteurNiveau==5) {
    ;
  }
}
