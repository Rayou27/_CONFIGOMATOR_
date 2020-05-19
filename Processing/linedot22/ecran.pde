void afficherEcranDebut22() {
  background(45, 132, 138);
  fill(0);
  textSize(40);
  textAlign(CENTER);
  text("2-1", width/2, 100);
  textSize(60);
  text("Line Dot", width/2, 170);
  stroke(0);
  strokeWeight(6);
  fill(255);
  rect(100, 200, 600, 250);
  fill(0);
  textSize(27);
  textAlign(LEFT);
  text("Ici, tu dois relier des points de couleurs\nprésents sur le quadrillage. Interdit \nde repasser sur un trait déjà fait.\nUtilise les 4 flèches directionnelles du\nclavier pour te déplacer. ", 140, 250);
  fill(200, 200, 255);
  rect(620, 510, 160, 60);
  fill(0);
  text("Let's Go~", 640, 549);
  if (mousePressed&&mouseX>620&&mouseX<780&&mouseY>510&&mouseY<570) {
    compteurNiveau=1;
  }
}

void afficherQuadrillage() {
  fill(255);
  stroke(0);
  strokeWeight(3);
  rect(200, 100, 400, 400);
  for (int i=180; i<421; i=i+80) {
    line(200, i, 600, i);
  }
  for (int i=280; i<521; i=i+80) {
    line(i, 100, i, 500);
  }
}

void afficherMurs() {
  stroke(couleurMur);
  strokeWeight(10);
  for (int i=1; i<=nombreMurHorizontal[compteurNiveau]; i++) {

    line(
      xJSON[murHorizontal[compteurNiveau][i]]-40, 
      yJSON[murHorizontal[compteurNiveau][i]]+40, 
      xJSON[murHorizontal[compteurNiveau][i]]+40, 
      yJSON[murHorizontal[compteurNiveau][i]]+40);
  }
  for (int i=1; i<=nombreMurVertical[compteurNiveau]; i++) {
    line(
      xJSON[murVertical[compteurNiveau][i]]+40, 
      yJSON[murVertical[compteurNiveau][i]]-40, 
      xJSON[murVertical[compteurNiveau][i]]+40, 
      yJSON[murVertical[compteurNiveau][i]]+40);
  }
}

void afficherEcranFin22(){
  background(45, 132, 138);
  stroke(0);
  strokeWeight(6);
  fill(255);
  rect(100, 50, 600, 250);
  rect(100, 330, 370, 150);
  rect(500, 360, 200, 120);
  fill(0);
  textSize(27);
  textAlign(LEFT);
  text("Bravo, tu en as enfin fini avec cette\nbouillabaisse de fils colorés !!!\nVoyons l'argent que tu as remporté\ngrâce à cette épreuve...",150,120);
  fill(200, 200, 255);
  rect(620, 510, 160, 60);
  fill(0);
  text(fleche+" Garage", 640, 549);
  text("Nombre de replay : "+(compteurReplay22-11), 130, 380);
  text("1 replay = -750$ ", 130, 430);
  text("TOTAL", 550, 400);
  text(argent22+" $", 550, 440);
  textSize(20);
}

public int argent22() {
  argent22=0;
  argent22+=50000-750*(compteurReplay22-11);
  return argent22;
}
