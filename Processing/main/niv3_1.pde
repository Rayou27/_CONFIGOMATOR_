int vraiFauxScore=0;
int vraiFauxCompteurQuestion = 1;
String vraiFauxQuestion1, vraiFauxQuestion2, vraiFauxQuestion3, 
  vraiFauxQuestion4, vraiFauxQuestion5, vraiFauxQuestion6, 
  vraiFauxQuestion7, vraiFauxQuestion8, vraiFauxQuestion9, 
  vraiFauxQuestion10;



void miniJeu31() {
  afficherJeuVraiFaux();
  afficherQuestionVraiFaux();
  finVraiFaux();
}

void mousePressed() {

  if (vraiFauxCompteurQuestion==1 && mouseX > 0 && mouseX < 200 && mouseY > 200 && mouseY < 300 ) {
    vraiFauxScore=vraiFauxScore+1;
    vraiFauxCompteurQuestion+=1;
  } else if ( vraiFauxCompteurQuestion==1 && mouseX > 300 && mouseX < 500 && mouseY > 200 && mouseY < 300) {
    ;
    vraiFauxCompteurQuestion+=1;
  } else if ( vraiFauxCompteurQuestion==2 && mouseX > 0 && mouseX < 200 && mouseY > 200 && mouseY < 300 ) {
    ;
    vraiFauxCompteurQuestion+=1;
  } else if ( vraiFauxCompteurQuestion==2 && mouseX > 300 && mouseX < 500 && mouseY > 200 && mouseY < 300) {
    vraiFauxScore=vraiFauxScore+1;
    vraiFauxCompteurQuestion+=1;
  } else if ( vraiFauxCompteurQuestion==3 && mouseX > 0 && mouseX < 200 && mouseY > 200 && mouseY < 300 ) {
    ;
    vraiFauxCompteurQuestion+=1;
  } else if ( vraiFauxCompteurQuestion==3 && mouseX > 300 && mouseX < 500 && mouseY > 200 && mouseY < 300) {
    vraiFauxScore=vraiFauxScore+1;
    vraiFauxCompteurQuestion+=1;
  } else if ( vraiFauxCompteurQuestion==4 && mouseX > 0 && mouseX < 200 && mouseY > 200 && mouseY < 300 ) {
    vraiFauxScore=vraiFauxScore+1;
    vraiFauxCompteurQuestion+=1;
  } else if ( vraiFauxCompteurQuestion==4 && mouseX > 300 && mouseX < 500 && mouseY > 200 && mouseY < 300) {
    ;
    vraiFauxCompteurQuestion+=1;
  } else if ( vraiFauxCompteurQuestion==5 && mouseX > 0 && mouseX < 200 && mouseY > 200 && mouseY < 300 ) {
    vraiFauxScore=vraiFauxScore+1;
    vraiFauxCompteurQuestion+=1;
  } else if ( vraiFauxCompteurQuestion==5 && mouseX > 300 && mouseX < 500 && mouseY > 200 && mouseY < 300) {
    ;
    vraiFauxCompteurQuestion+=1;
  } else if ( vraiFauxCompteurQuestion==6 && mouseX > 0 && mouseX < 200 && mouseY > 200 && mouseY < 300 ) {
    ;
    vraiFauxCompteurQuestion+=1;
  } else if ( vraiFauxCompteurQuestion==6 && mouseX > 300 && mouseX < 500 && mouseY > 200 && mouseY < 300) {
    vraiFauxScore=vraiFauxScore+1;
    vraiFauxCompteurQuestion+=1;
  } else if ( vraiFauxCompteurQuestion==7 && mouseX > 0 && mouseX < 200 && mouseY > 200 && mouseY < 300 ) {
    ;
    vraiFauxCompteurQuestion+=1;
  } else if ( vraiFauxCompteurQuestion==7 && mouseX > 300 && mouseX < 500 && mouseY > 200 && mouseY < 300) {
    vraiFauxScore=vraiFauxScore+1;
    vraiFauxCompteurQuestion+=1;
  } else if ( vraiFauxCompteurQuestion==8 && mouseX > 0 && mouseX < 200 && mouseY > 200 && mouseY < 300 ) {
    vraiFauxScore=vraiFauxScore+1;
    vraiFauxCompteurQuestion+=1;
  } else if ( vraiFauxCompteurQuestion==8 && mouseX > 300 && mouseX < 500 && mouseY > 200 && mouseY < 300) {
    ;
    vraiFauxCompteurQuestion+=1;
  } else if ( vraiFauxCompteurQuestion==9 && mouseX > 0 && mouseX < 200 && mouseY > 200 && mouseY < 300 ) {
    ;
    vraiFauxCompteurQuestion+=1;
  } else if ( vraiFauxCompteurQuestion==9 && mouseX > 300 && mouseX < 500 && mouseY > 200 && mouseY < 300) {
    vraiFauxScore=vraiFauxScore+1;
    vraiFauxCompteurQuestion+=1;
  } else if ( vraiFauxCompteurQuestion==10 && mouseX > 0 && mouseX < 200 && mouseY > 200 && mouseY < 300 ) {
    vraiFauxScore=vraiFauxScore+1;
    vraiFauxCompteurQuestion+=1;
  } else if ( vraiFauxCompteurQuestion==10 && mouseX > 300 && mouseX < 500 && mouseY > 200 && mouseY < 300) {
    ;
    vraiFauxCompteurQuestion+=1;
  }
}
void finVraiFaux() {
  if (vraiFauxCompteurQuestion==11) {
    resultatFinal();
  }
}

void afficherJeuVraiFaux() {
  background(0);
  fill(255);
  rect(0, 0, 500, 200);
  rect(0, 200, 200, 100);
  rect(300, 200, 200, 100);
  fill(0);
  textSize(20);
  text("Vrai", 0, 270);
  text("Faux", 400, 270);
}

void afficherQuestionVraiFaux() {
  if (vraiFauxCompteurQuestion==1) {
    text(vraiFauxQuestion1, 50, 50);
  }
  if (vraiFauxCompteurQuestion==2) {
    text(vraiFauxQuestion2, 50, 50);
  }
  if (vraiFauxCompteurQuestion==3) {
    text(vraiFauxQuestion3, 50, 50);
  }
  if (vraiFauxCompteurQuestion==4) {
    text(vraiFauxQuestion4, 50, 50);
  }
  if (vraiFauxCompteurQuestion==5) {
    text(vraiFauxQuestion5, 50, 50);
  }
  if (vraiFauxCompteurQuestion==6) {
    text(vraiFauxQuestion6, 50, 50);
  }
  if (vraiFauxCompteurQuestion==7) {
    text(vraiFauxQuestion7, 50, 50);
  }
  if (vraiFauxCompteurQuestion==8) {
    text(vraiFauxQuestion8, 50, 50);
  }
  if (vraiFauxCompteurQuestion==9) {
    text(vraiFauxQuestion9, 50, 50);
  }
  if (vraiFauxCompteurQuestion==10) {
    text(vraiFauxQuestion10, 50, 50);
  }
}

void resultatFinal() {
  String ResultatFinal = "Votre score est de " + vraiFauxScore ;
  text(ResultatFinal, 50, 50);
}
