int vraiFauxScore=0;
int vraiFauxCompteurQuestion = 0;
float argentGagne31 =0;

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
boolean vraiFauxQuestionSuivanteOK = false;


void miniJeu31() {
  afficherJeuVraiFaux();
  afficherQuestionVraiFaux();
  vraiFauxQuestionSuivanteOK();
  couleurCorrection();
  vraiFauxAffichageCorrection();
  vraiFauxEcranFin();
}

void mousePressed() {

  if (vraiFauxCompteurQuestion==1 && mouseX > 150 && mouseX < 350 &&  mouseY > 400 && mouseY < 500 && questionRepondue == false ) {
    vraiFauxScore+=1;
    questionRepondue = true;
    bonneReponse = true;
  } else if ( vraiFauxCompteurQuestion==1 && mouseX > 450 && mouseX < 650 &&  mouseY >  400 && mouseY < 500&& questionRepondue == false) {
    questionRepondue = true;
    mauvaiseReponse=true;
  } else if ( vraiFauxCompteurQuestion==2 && mouseX > 150 && mouseX < 350 &&  mouseY > 400 && mouseY < 500 && questionRepondue == false ) {
    questionRepondue = true;
    mauvaiseReponse=true;
  } else if ( vraiFauxCompteurQuestion==2 && mouseX > 450 && mouseX < 650 &&  mouseY >  400 && mouseY < 500&& questionRepondue == false) {
    vraiFauxScore+=1;
    questionRepondue = true;
    bonneReponse = true;
  } else if ( vraiFauxCompteurQuestion==3 && mouseX > 150 && mouseX < 350 &&  mouseY > 400 && mouseY < 500 && questionRepondue == false ) {
    questionRepondue = true;
    mauvaiseReponse=true;
  } else if ( vraiFauxCompteurQuestion==3 && mouseX > 450 && mouseX < 650 &&  mouseY >  400 && mouseY < 500&& questionRepondue == false) {
    vraiFauxScore+=1;
    questionRepondue = true;
    bonneReponse = true;
  } else if ( vraiFauxCompteurQuestion==4 && mouseX > 150 && mouseX < 350 &&  mouseY > 400 && mouseY < 500 && questionRepondue == false ) {
    vraiFauxScore+=1;
    questionRepondue = true;
    bonneReponse = true;
  } else if ( vraiFauxCompteurQuestion==4 && mouseX > 450 && mouseX < 650 &&  mouseY >  400 && mouseY < 500&& questionRepondue == false) {
    questionRepondue = true;
    mauvaiseReponse=true;
  } else if ( vraiFauxCompteurQuestion==5 && mouseX > 150 && mouseX < 350 &&  mouseY > 400 && mouseY < 500 && questionRepondue == false ) {
    vraiFauxScore+=1;
    questionRepondue = true;
    bonneReponse = true;
  } else if ( vraiFauxCompteurQuestion==5 && mouseX > 450 && mouseX < 650 &&  mouseY >  400 && mouseY < 500&& questionRepondue == false) {
    questionRepondue = true;
    mauvaiseReponse=true;
  } else if ( vraiFauxCompteurQuestion==6 && mouseX > 150 && mouseX < 350 &&  mouseY > 400 && mouseY < 500 && questionRepondue == false ) {
    questionRepondue = true;
    mauvaiseReponse=true;
  } else if ( vraiFauxCompteurQuestion==6 && mouseX > 450 && mouseX < 650 &&  mouseY >  400 && mouseY < 500&& questionRepondue == false) {
    vraiFauxScore+=1;
    questionRepondue = true;
    bonneReponse = true;
  } else if ( vraiFauxCompteurQuestion==7 && mouseX > 150 && mouseX < 350 &&  mouseY > 400 && mouseY < 500 && questionRepondue == false ) {
    questionRepondue = true;
    mauvaiseReponse=true;
  } else if ( vraiFauxCompteurQuestion==7 && mouseX > 450 && mouseX < 650 &&  mouseY >  400 && mouseY < 500&& questionRepondue == false) {
    vraiFauxScore+=1;
    questionRepondue = true;
    bonneReponse = true;
  } else if ( vraiFauxCompteurQuestion==8 && mouseX > 150 && mouseX < 350 &&  mouseY > 400 && mouseY < 500 && questionRepondue == false ) {
    vraiFauxScore+=1;
    questionRepondue = true;
    bonneReponse = true;
  } else if (vraiFauxCompteurQuestion==8 && mouseX > 450 && mouseX < 650 &&  mouseY >  400 && mouseY < 500&& questionRepondue == false) {
    questionRepondue = true;
    mauvaiseReponse=true;
  } else if ( vraiFauxCompteurQuestion==9 && mouseX > 150 && mouseX < 350 &&  mouseY > 400 && mouseY < 500 && questionRepondue == false ) {
    questionRepondue = true;
    mauvaiseReponse=true;
  } else if ( vraiFauxCompteurQuestion==9 && mouseX > 450 && mouseX < 650 &&  mouseY >  400 && mouseY < 500&& questionRepondue == false) {
    vraiFauxScore+=1;
    questionRepondue = true;
    bonneReponse = true;
  } else if ( vraiFauxCompteurQuestion==10 && mouseX > 150 && mouseX < 350 &&  mouseY > 400 && mouseY < 500 && questionRepondue == false ) {
    vraiFauxScore+=1;
    questionRepondue = true;
    bonneReponse = true;
  } else if ( vraiFauxCompteurQuestion==10 && mouseX > 450 && mouseX < 650 &&  mouseY >  400 && mouseY < 500&& questionRepondue == false) {
    questionRepondue = true;
    mauvaiseReponse=true;
  }
  if (vraiFauxCompteurQuestion!=11 && (questionRepondue==true || vraiFauxCompteurQuestion==0) && mouseX > 570 && mouseX < 740 && mouseY > 520 && mouseY < 570) {
    vraiFauxQuestionSuivanteOK=true;
  }
  if (vraiFauxCompteurQuestion==11 && mouseX > 570 && mouseX < 740 && mouseY > 520 && mouseY < 570) {
    niveauTermine31=true;
  }
}

void afficherJeuVraiFaux() {
  background(251, 210, 71);

  // PAGE ACCUEIL MINI JEU
  if (vraiFauxCompteurQuestion == 0) {
    textSize(32);
    fill(0);
    text(niveauEnCours, 360, 70);
    textSize(40);
    text("LE VRAI OU FAUX \n INFORMATIQUE", 230, 140);
    fill(255);
    rect(100, 230, 600, 200);
    fill(0);
    textSize(27);
    text("10 affirmations, à toi de trouver si elles \nsont vraies ou fausses ! Plus tu as de \nréponses justes et plus tu gagnes d'argent.", 124, 296);
    fill(reponseViergeCouleur);
    rect(570, 520, 170, 50);
    fill(0);
    textSize(27);
    text("Let's Go~", 600, 555);
  }

  // PAGE QUESTIONS
  if (vraiFauxCompteurQuestion >= 1 && vraiFauxCompteurQuestion <= 10) {
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
    textSize(27);
    text(vraiFauxScore +"/10", 690, 70);
    text("Q°" + vraiFauxCompteurQuestion, 30, 70);
  }
}

void afficherQuestionVraiFaux() {
  textSize(27);
  if (vraiFauxCompteurQuestion==1) {
    text(vraiFauxQuestion1, 230, 190);
  }
  if (vraiFauxCompteurQuestion==2) {
    text(vraiFauxQuestion2, 230, 180);
  }
  if (vraiFauxCompteurQuestion==3) {
    text(vraiFauxQuestion3, 230, 180);
  }
  if (vraiFauxCompteurQuestion==4) {
    text(vraiFauxQuestion4, 230, 180);
  }
  if (vraiFauxCompteurQuestion==5) {
    text(vraiFauxQuestion5, 230, 180);
  }
  if (vraiFauxCompteurQuestion==6) {
    text(vraiFauxQuestion6, 230, 180);
  }
  if (vraiFauxCompteurQuestion==7) {
    text(vraiFauxQuestion7, 230, 180);
  }
  if (vraiFauxCompteurQuestion==8) {
    text(vraiFauxQuestion8, 230, 180);
  }
  if (vraiFauxCompteurQuestion==9) {
    text(vraiFauxQuestion9, 230, 180);
  }
  if (vraiFauxCompteurQuestion==10) {
    text(vraiFauxQuestion10, 230, 180);
  }
}

void couleurCorrection() {

  // QUESTION 1
  if (bonneReponse == true && vraiFauxCompteurQuestion==1) {
    reponseVraiCouleur=reponseJusteCouleur;
  } 
  if (mauvaiseReponse == true && vraiFauxCompteurQuestion==1) { 
    reponseFauxCouleur=reponseMauvaisCouleur;
  }

  // QUESTION 2
  if (bonneReponse == true && vraiFauxCompteurQuestion==2) {
    reponseFauxCouleur=reponseJusteCouleur;
  } 
  if (mauvaiseReponse == true && vraiFauxCompteurQuestion==2) { 
    reponseVraiCouleur=reponseMauvaisCouleur;
  }

  // QUESTION 3
  if (bonneReponse == true && vraiFauxCompteurQuestion==3) {
    reponseFauxCouleur=reponseJusteCouleur;
  } 
  if (mauvaiseReponse == true && vraiFauxCompteurQuestion==3) { 
    reponseVraiCouleur=reponseMauvaisCouleur;
  }

  // QUESTION 4
  if (bonneReponse == true && vraiFauxCompteurQuestion==4) {
    reponseVraiCouleur=reponseJusteCouleur;
  } 
  if (mauvaiseReponse == true && vraiFauxCompteurQuestion == 4) { 
    reponseFauxCouleur=reponseMauvaisCouleur;
  }

  // QUESTION 5
  if (bonneReponse == true && vraiFauxCompteurQuestion==5) {
    reponseVraiCouleur=reponseJusteCouleur;
  } 
  if (mauvaiseReponse == true && vraiFauxCompteurQuestion==5) { 
    reponseFauxCouleur=reponseMauvaisCouleur;
  }

  // QUESTION 6
  if (bonneReponse == true && vraiFauxCompteurQuestion==6) {
    reponseFauxCouleur=reponseJusteCouleur;
  } 
  if (mauvaiseReponse == true && vraiFauxCompteurQuestion==6) { 
    reponseVraiCouleur=reponseMauvaisCouleur;
  }

  // QUESTION 7 
  if (bonneReponse == true && vraiFauxCompteurQuestion==7) {
    reponseFauxCouleur=reponseJusteCouleur;
  } 
  if (mauvaiseReponse == true && vraiFauxCompteurQuestion==7) { 
    reponseVraiCouleur=reponseMauvaisCouleur;
  }

  // QUESTION 8
  if (bonneReponse == true && vraiFauxCompteurQuestion==8) {
    reponseVraiCouleur=reponseJusteCouleur;
  } 
  if (mauvaiseReponse == true && vraiFauxCompteurQuestion==8) { 
    reponseFauxCouleur=reponseMauvaisCouleur;
  }

  // QUESTION 9
  if (bonneReponse == true && vraiFauxCompteurQuestion==9) {
    reponseFauxCouleur=reponseJusteCouleur;
  } 
  if (mauvaiseReponse == true && vraiFauxCompteurQuestion==9) { 
    reponseVraiCouleur=reponseMauvaisCouleur;
  }

  // QUESTION 10
  if (bonneReponse == true && vraiFauxCompteurQuestion==10) {
    reponseVraiCouleur=reponseJusteCouleur;
  } 
  if (mauvaiseReponse == true && vraiFauxCompteurQuestion==10) { 
    reponseFauxCouleur=reponseMauvaisCouleur;
  }
}

void vraiFauxAffichageCorrection() {
  textSize(20);
  if (bonneReponse==true) {
    text("Bien joué c'était ça !", 50, 547);
  } else if (mauvaiseReponse==true) {
    if (vraiFauxCompteurQuestion==1) {
      text(vraiFauxCorrection1, 50, 547);
    }
    if (vraiFauxCompteurQuestion==2) {
      text(vraiFauxCorrection2, 50, 547);
    }
    if (vraiFauxCompteurQuestion==3) {
      text(vraiFauxCorrection3, 50, 547);
    }
    if (vraiFauxCompteurQuestion==4) {
      text(vraiFauxCorrection4, 50, 547);
    }
    if (vraiFauxCompteurQuestion==5) {
      text(vraiFauxCorrection5, 50, 547);
    }
    if (vraiFauxCompteurQuestion==6) {
      text(vraiFauxCorrection6, 50, 547);
    }
    if (vraiFauxCompteurQuestion==7) {
      text(vraiFauxCorrection7, 50, 547);
    }
    if (vraiFauxCompteurQuestion==8) {
      text(vraiFauxCorrection8, 50, 547);
    }
    if (vraiFauxCompteurQuestion==9) {
      text(vraiFauxCorrection9, 50, 547);
    }
    if (vraiFauxCompteurQuestion==10) {
      text(vraiFauxCorrection10, 50, 547);
    }
  }
}

void vraiFauxQuestionSuivanteOK() {
  if (vraiFauxQuestionSuivanteOK==true ) {
    vraiFauxQuestionSuivanteOK = false;
    questionRepondue = false;
    vraiFauxCompteurQuestion+=1;
    reponseVraiCouleur = reponseViergeCouleur;
    reponseFauxCouleur = reponseViergeCouleur;
    bonneReponse = false;
    mauvaiseReponse = false;
    print(vraiFauxCompteurQuestion);
  }
  if (vraiFauxCompteurQuestion == 0) {
    vraiFauxQuestionSuivanteOK = false;
    questionRepondue = false;
    reponseVraiCouleur = reponseViergeCouleur;
    reponseFauxCouleur = reponseViergeCouleur;
    bonneReponse = false;
    mauvaiseReponse = false;
  }
}

void vraiFauxEcranFin() {
  // PAGE FIN
  if (vraiFauxCompteurQuestion == 11) {
    argentGagne31=vraiFauxScore*50000;
    fill(255);
    rect(100, 150, 600, 200);
    rect(100, 375, 240, 130);
    rect(460, 375, 240, 130);
    fill(0);
    textSize(27);
    text("Tu t'es débrouillé tant bien que mal pour \nterminer ce Vrai/Faux, bravo ! \nVoici tes statistiques", 124, 220);
    text("TA NOTE \n" +vraiFauxScore+"/10", 150,420);
    text("ARGENT GAGNÉ \n" +argentGagne31 +"$", 480,420);
    fill(reponseViergeCouleur);
    rect(570, 520, 170, 50);
    fill(0);
    textSize(27);
    text(" → Garage", 590, 555);
  }
  if (niveauTermine31==true);
  affichageEcran31=false;
  affichageEcranPrincipal=true;
}
