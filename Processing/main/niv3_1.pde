int vraiFauxScore=0;
int compteurQuestion = 1;

color reponseVraiCouleur;
color reponseFauxCouleur;
color reponseViergeCouleur = color(252, 243, 204);
color reponseJusteCouleur = color(62, 207, 62);
color reponseMauvaisCouleur = color(255, 48, 100);

String vraiFauxQuestion1, vraiFauxQuestion2, vraiFauxQuestion3, 
  vraiFauxQuestion4, vraiFauxQuestion5, vraiFauxQuestion6, 
  vraiFauxQuestion7, vraiFauxQuestion8, vraiFauxQuestion9, 
  vraiFauxQuestion10;
String vraiFauxCorrection1, vraiFauxCorrection2, vraiFauxCorrection3, 
  vraiFauxCorrection4, vraiFauxCorrection5, vraiFauxCorrection6, 
  vraiFauxCorrection7, vraiFauxCorrection8, vraiFauxCorrection9, 
  vraiFauxCorrection10;

boolean bonneReponse = false;
boolean mauvaiseReponse = false;
boolean questionRepondue = false;
boolean questionSuivante = false;


void miniJeu31() {
  afficherJeuVraiFaux();
  afficherQuestionVraiFaux();
  finVraiFaux();
  questionSuivante();
  correctionEtCouleur();
}

void mousePressed() {

  if (compteurQuestion==1 && mouseX > 150 && mouseX < 350 &&  mouseY > 400 && mouseY < 500 && questionRepondue == false ) {
    vraiFauxScore+=1;
    questionRepondue = true;
    bonneReponse = true;
  } else if ( compteurQuestion==1 && mouseX > 450 && mouseX < 650 &&  mouseY >  400 && mouseY < 500) {
    questionRepondue = true;
    mauvaiseReponse=true;
  } else if ( compteurQuestion==2 && mouseX > 150 && mouseX < 350 &&  mouseY > 400 && mouseY < 500 && questionRepondue == false ) {
    questionRepondue = true;
    mauvaiseReponse=true;
  } else if ( compteurQuestion==2 && mouseX > 450 && mouseX < 650 &&  mouseY >  400 && mouseY < 500) {
    vraiFauxScore+=1;
    questionRepondue = true;
    bonneReponse = true;
  } else if ( compteurQuestion==3 && mouseX > 150 && mouseX < 350 &&  mouseY > 400 && mouseY < 500 && questionRepondue == false ) {
    questionRepondue = true;
    mauvaiseReponse=true;
  } else if ( compteurQuestion==3 && mouseX > 450 && mouseX < 650 &&  mouseY >  400 && mouseY < 500) {
    vraiFauxScore+=1;
    questionRepondue = true;
    bonneReponse = true;
  } else if ( compteurQuestion==4 && mouseX > 150 && mouseX < 350 &&  mouseY > 400 && mouseY < 500 && questionRepondue == false ) {
    vraiFauxScore+=1;
    questionRepondue = true;
    bonneReponse = true;
  } else if ( compteurQuestion==4 && mouseX > 450 && mouseX < 650 &&  mouseY >  400 && mouseY < 500) {
    questionRepondue = true;
    mauvaiseReponse=true;
  } else if ( compteurQuestion==5 && mouseX > 150 && mouseX < 350 &&  mouseY > 400 && mouseY < 500 && questionRepondue == false ) {
    vraiFauxScore+=1;
    questionRepondue = true;
    bonneReponse = true;
  } else if ( compteurQuestion==5 && mouseX > 450 && mouseX < 650 &&  mouseY >  400 && mouseY < 500) {
    questionRepondue = true;
    mauvaiseReponse=true;
  } else if ( compteurQuestion==6 && mouseX > 150 && mouseX < 350 &&  mouseY > 400 && mouseY < 500 && questionRepondue == false ) {
    questionRepondue = true;
    mauvaiseReponse=true;
  } else if ( compteurQuestion==6 && mouseX > 450 && mouseX < 650 &&  mouseY >  400 && mouseY < 500) {
    vraiFauxScore+=1;
    questionRepondue = true;
    bonneReponse = true;
  } else if ( compteurQuestion==7 && mouseX > 150 && mouseX < 350 &&  mouseY > 400 && mouseY < 500 && questionRepondue == false ) {
    questionRepondue = true;
    mauvaiseReponse=true;
  } else if ( compteurQuestion==7 && mouseX > 450 && mouseX < 650 &&  mouseY >  400 && mouseY < 500) {
    vraiFauxScore+=1;
    questionRepondue = true;
    bonneReponse = true;
  } else if ( compteurQuestion==8 && mouseX > 150 && mouseX < 350 &&  mouseY > 400 && mouseY < 500 && questionRepondue == false ) {
    vraiFauxScore+=1;
    questionRepondue = true;
    bonneReponse = true;
  } else if (compteurQuestion==8 && mouseX > 450 && mouseX < 650 &&  mouseY >  400 && mouseY < 500) {
    questionRepondue = true;
    mauvaiseReponse=true;
  } else if ( compteurQuestion==9 && mouseX > 150 && mouseX < 350 &&  mouseY > 400 && mouseY < 500 && questionRepondue == false ) {
    questionRepondue = true;
    mauvaiseReponse=true;
  } else if ( compteurQuestion==9 && mouseX > 450 && mouseX < 650 &&  mouseY >  400 && mouseY < 500) {
    vraiFauxScore+=1;
    questionRepondue = true;
    bonneReponse = true;
  } else if ( compteurQuestion==10 && mouseX > 150 && mouseX < 350 &&  mouseY > 400 && mouseY < 500 && questionRepondue == false ) {
    vraiFauxScore+=1;
    questionRepondue = true;
    bonneReponse = true;
  } else if ( compteurQuestion==10 && mouseX > 450 && mouseX < 650 &&  mouseY >  400 && mouseY < 500) {
    questionRepondue = true;
    mauvaiseReponse=true;
  }
  if (questionRepondue==true && mouseX > 570 && mouseX < 740 && mouseY > 520 && mouseY < 570) {
    questionSuivante=true;
  }
}
void finVraiFaux() {
  if (compteurQuestion==11) {
    resultatFinal();
  }
}

void afficherJeuVraiFaux() {
  background(251, 210, 71);

  if (compteurQuestion > 0 && compteurQuestion < 11) {
    fill(255);
    rect(200, 130, 400, 200); // case de question
    fill(reponseVraiCouleur);
    rect(150, 400, 200, 100); // case vrai
    fill(reponseFauxCouleur);
    rect(450, 400, 200, 100); // case faux
    fill(0);
    textSize(40);
    text("VRAI", 200, 465);
    text("FAUX", 500, 465);

    if (questionRepondue==true) {
      fill(reponseViergeCouleur);
      rect(570, 520, 170, 50);
      fill(0);
      textSize(27);
      text("Suivant !", 600, 555);
    }
  }
}

void afficherQuestionVraiFaux() {
  textSize(27);
  if (compteurQuestion==1) {
    text(vraiFauxQuestion1, 250, 190);
  }
  if (compteurQuestion==2) {
    text(vraiFauxQuestion2, 250, 180);
  }
  if (compteurQuestion==3) {
    text(vraiFauxQuestion3, 250, 180);
  }
  if (compteurQuestion==4) {
    text(vraiFauxQuestion4, 250, 180);
  }
  if (compteurQuestion==5) {
    text(vraiFauxQuestion5, 250, 180);
  }
  if (compteurQuestion==6) {
    text(vraiFauxQuestion6, 250, 180);
  }
  if (compteurQuestion==7) {
    text(vraiFauxQuestion7, 250, 180);
  }
  if (compteurQuestion==8) {
    text(vraiFauxQuestion8, 250, 180);
  }
  if (compteurQuestion==9) {
    text(vraiFauxQuestion9, 250, 180);
  }
  if (compteurQuestion==10) {
    text(vraiFauxQuestion10, 250, 180);
  }
}

void resultatFinal() {
  String ResultatFinal = "Votre score est de " + vraiFauxScore ;
  text(ResultatFinal, 50, 50);
}

void correctionEtCouleur() {

  // QUESTION 1
  if (bonneReponse == true && compteurQuestion==1) {
    reponseVraiCouleur=reponseJusteCouleur;
  } 
  if (mauvaiseReponse == true && compteurQuestion==1) { 
    reponseFauxCouleur=reponseMauvaisCouleur;
  }

  // QUESTION 2
  if (bonneReponse == true && compteurQuestion==2) {
    reponseFauxCouleur=reponseJusteCouleur;
  } 
  if (mauvaiseReponse == true && compteurQuestion==2) { 
    reponseVraiCouleur=reponseMauvaisCouleur;
  }

  // QUESTION 3
  if (bonneReponse == true && compteurQuestion==3) {
    reponseFauxCouleur=reponseJusteCouleur;
  } 
  if (mauvaiseReponse == true && compteurQuestion==3) { 
    reponseVraiCouleur=reponseMauvaisCouleur;
  }

  // QUESTION 4
  if (bonneReponse == true && compteurQuestion==4) {
    reponseVraiCouleur=reponseJusteCouleur;
  } 
  if (mauvaiseReponse == true && compteurQuestion == 4) { 
    reponseFauxCouleur=reponseMauvaisCouleur;
  }

  // QUESTION 5
  if (bonneReponse == true && compteurQuestion==5) {
    reponseVraiCouleur=reponseJusteCouleur;
  } 
  if (mauvaiseReponse == true && compteurQuestion==5) { 
    reponseFauxCouleur=reponseMauvaisCouleur;
  }

  // QUESTION 6
  if (bonneReponse == true && compteurQuestion==6) {
    reponseFauxCouleur=reponseJusteCouleur;
  } 
  if (mauvaiseReponse == true && compteurQuestion==6) { 
    reponseVraiCouleur=reponseMauvaisCouleur;
  }

  // QUESTION 7 
  if (bonneReponse == true && compteurQuestion==7) {
    reponseFauxCouleur=reponseJusteCouleur;
  } 
  if (mauvaiseReponse == true && compteurQuestion==7) { 
    reponseVraiCouleur=reponseMauvaisCouleur;
  }

  // QUESTION 8
  if (bonneReponse == true && compteurQuestion==8) {
    reponseVraiCouleur=reponseJusteCouleur;
  } 
  if (mauvaiseReponse == true && compteurQuestion==8) { 
    reponseFauxCouleur=reponseMauvaisCouleur;
  }

  // QUESTION 9
  if (bonneReponse == true && compteurQuestion==9) {
    reponseFauxCouleur=reponseJusteCouleur;
  } 
  if (mauvaiseReponse == true && compteurQuestion==9) { 
    reponseVraiCouleur=reponseMauvaisCouleur;
  }

  // QUESTION 10
  if (bonneReponse == true && compteurQuestion==10) {
    reponseVraiCouleur=reponseJusteCouleur;
  } 
  if (mauvaiseReponse == true && compteurQuestion==10) { 
    reponseFauxCouleur=reponseMauvaisCouleur;
  }
}

void afficherCorrection() {
  //for (int i=0; i<5; i++) {
  //background(random(200, 250), random(180, 220), random(50, 90));

  //}

  if (bonneReponse==true) {
    text("Bien joué c'était ça !",200,500);
  } else if (mauvaiseReponse==true) {
    if (compteurQuestion==1) {
      text(vraiFauxCorrection1, 200, 500);
    }
    if (compteurQuestion==2) {
      text(vraiFauxCorrection2, 200, 500);
    }
    if (compteurQuestion==3) {
      text(vraiFauxCorrection3, 200, 500);
    }
    if (compteurQuestion==4) {
      text(vraiFauxCorrection4, 200, 500);
    }
    if (compteurQuestion==5) {
      text(vraiFauxCorrection5, 200, 500);
    }
    if (compteurQuestion==6) {
      text(vraiFauxCorrection6, 200, 500);
    }
    if (compteurQuestion==7) {
      text(vraiFauxCorrection7, 200, 500);
    }
    if (compteurQuestion==8) {
      text(vraiFauxCorrection8, 200, 500);
    }
    if (compteurQuestion==9) {
      text(vraiFauxCorrection9, 200, 500);
    }
    if (compteurQuestion==10) {
      text(vraiFauxCorrection10, 200, 500);
    }
  }
}

void questionSuivante() {
  if (questionSuivante==true) {
    questionSuivante = false;
    questionRepondue = false;
    compteurQuestion+=1;
    reponseVraiCouleur = reponseViergeCouleur;
    reponseFauxCouleur = reponseViergeCouleur;
    bonneReponse = false;
    mauvaiseReponse = false;
  }
}
