int vraiFauxScore=0;
int vraiFauxCompteurQuestion = 0;
float argentGagne31 =0;
color reponseVraiCouleur, reponseFauxCouleur;
color reponseViergeCouleur = color(252, 243, 204);
color reponseJusteCouleur = color(62, 207, 62);
color reponseMauvaisCouleur = color(255, 48, 100);
String vraiFauxQuestion, vraiFauxCorrection;
boolean bonneReponse = false;
boolean mauvaiseReponse = false;
boolean questionRepondue = false;
boolean vraiFauxQuestionSuivanteOK = false;
JSONArray vraifauxJSON;

void miniJeu31() {
  vraiFauxJSON();
  afficherJeuVraiFaux();
  afficherQuestionCorrectionVraiFaux();
  vraiFauxQuestionSuivanteOK();
  couleurCorrection();
  vraiFauxEcranFin();
}

void mousePressed() {
  // CLIC VRAI JUSTE
  if ((vraiFauxCompteurQuestion==1 || vraiFauxCompteurQuestion==4 
    ||vraiFauxCompteurQuestion==5 ||vraiFauxCompteurQuestion==8 ||vraiFauxCompteurQuestion==10)
    && mouseX > 150 && mouseX < 350 &&  mouseY > 400 && mouseY < 500 && questionRepondue == false ) {
    bonneReponse = true;
    vraiFauxScore+=1;
    questionRepondue = true;
  }
  // CLIC FAUX MAUVAIS
  if ((vraiFauxCompteurQuestion==1 || vraiFauxCompteurQuestion==4 
    ||vraiFauxCompteurQuestion==5 ||vraiFauxCompteurQuestion==8 ||vraiFauxCompteurQuestion==10)
    && mouseX > 450 && mouseX < 650 &&  mouseY >  400 && mouseY < 500&& questionRepondue == false) {
    questionRepondue = true;
    mauvaiseReponse=true;
  }
  // CLIC FAUX JUSTE
  if ((vraiFauxCompteurQuestion==2 || vraiFauxCompteurQuestion==3 
    ||vraiFauxCompteurQuestion==6 || vraiFauxCompteurQuestion==7 ||vraiFauxCompteurQuestion==9) 
    && mouseX > 450 && mouseX < 650 &&  mouseY >  400 && mouseY < 500&& questionRepondue == false) {
    vraiFauxScore+=1;
    questionRepondue = true;
    bonneReponse = true;
  }
  // CLIC VRAI MAUVAIS
  if ((vraiFauxCompteurQuestion==2 || vraiFauxCompteurQuestion==3 
    ||vraiFauxCompteurQuestion==6 || vraiFauxCompteurQuestion==7 ||vraiFauxCompteurQuestion==9) 
    && mouseX > 150 && mouseX < 350 &&  mouseY > 400 && mouseY < 500 && questionRepondue == false ) {
    questionRepondue = true;
    mauvaiseReponse=true;
  }
  // TEST BOUTON SUIVANT
  if (vraiFauxCompteurQuestion!=11 && (questionRepondue==true || vraiFauxCompteurQuestion==0) 
    && mouseX > 570 && mouseX < 740 && mouseY > 520 && mouseY < 570) {
    vraiFauxQuestionSuivanteOK=true;
  }
  // TEST BOUTON GARAGE
  if (vraiFauxCompteurQuestion==11 && mouseX > 570 && mouseX < 740 && mouseY > 520 && mouseY < 570) {
    niveauTermine31=true;
  }
}

void vraiFauxJSON() {
  vraifauxJSON= loadJSONArray("vraifaux.json"); // On charge le JSON
  JSONArray donnees = vraifauxJSON.getJSONArray(0); // On récupère toutes les données du premier Array
  JSONObject objet = donnees.getJSONObject(vraiFauxCompteurQuestion); // On récupère les données de l'objet
  // portant le numéro de la question en cours
  vraiFauxQuestion = objet.getString("question"); // On récupère ainsi les questions avec la méthode getString()
  vraiFauxCorrection = objet.getString("correction"); // idem
}

void afficherJeuVraiFaux() {
  background(251, 210, 71);
  // PAGE ACCUEIL MINI JEU
  if (vraiFauxCompteurQuestion == 0) {
    niveauTermine31 = false;
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
    text("Let's Go !", 600, 555);
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
    if (questionRepondue==true) { // afficher le bouton suivant
      fill(reponseViergeCouleur);
      rect(570, 520, 170, 50);
      fill(0);
      textSize(27);
      text("Suivant !", 600, 555);
    }
    textSize(27);
    text(vraiFauxScore +"/10", 690, 70); // afficher le score
    text("Q°" + vraiFauxCompteurQuestion, 30, 70); // afficher le numéro de question
  }
}

void afficherQuestionCorrectionVraiFaux() {
  textSize(27);
  text(vraiFauxQuestion, 230, 190);
  textSize(20);
  if (bonneReponse==true) {
    text("Bien joué c'était ça !", 50, 547);
  } else if (mauvaiseReponse==true) {
    text(vraiFauxCorrection, 50, 547);
  }
}

void couleurCorrection() {
  // REPONSES VRAI JUSTES
  if (bonneReponse == true && (vraiFauxCompteurQuestion==1 || vraiFauxCompteurQuestion==4 
    ||vraiFauxCompteurQuestion==5 ||vraiFauxCompteurQuestion==8 ||vraiFauxCompteurQuestion==10)) {
    reponseVraiCouleur=reponseJusteCouleur;
  } 
  // REPONSES VRAI MAUVAISES
  if (mauvaiseReponse == true && (vraiFauxCompteurQuestion==1 || vraiFauxCompteurQuestion==4 
    ||vraiFauxCompteurQuestion==5 ||vraiFauxCompteurQuestion==8 ||vraiFauxCompteurQuestion==10)) { 
    reponseFauxCouleur=reponseMauvaisCouleur;
  }
  // REPONSES FAUX JUSTES
  if (bonneReponse == true && (vraiFauxCompteurQuestion==2 || vraiFauxCompteurQuestion==3 
    ||vraiFauxCompteurQuestion==6 || vraiFauxCompteurQuestion==7 ||vraiFauxCompteurQuestion==9)) {
    reponseFauxCouleur=reponseJusteCouleur;
  } 
  // REPONSES FAUX MAUVAISES
  if (mauvaiseReponse == true && (vraiFauxCompteurQuestion==2 || vraiFauxCompteurQuestion==3 
    ||vraiFauxCompteurQuestion==6 || vraiFauxCompteurQuestion==7 ||vraiFauxCompteurQuestion==9)) { 
    reponseVraiCouleur=reponseMauvaisCouleur;
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
    text("TA NOTE \n" +vraiFauxScore+"/10", 150, 420);
    text("ARGENT GAGNÉ \n" +argentGagne31 +"$", 480, 420);
    fill(reponseViergeCouleur);
    rect(570, 520, 170, 50);
    fill(0);
    textSize(27);
    text(" → Garage", 590, 555);
  }
  if (vraiFauxCompteurQuestion==11 && niveauTermine31==true);
  affichageEcran31=false;
  affichageEcranPrincipal=true;
}
