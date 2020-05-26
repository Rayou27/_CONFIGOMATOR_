int vraiFauxScore=0;
int vraiFauxCompteurQuestion =0;
float argentGagne31 =0;
color reponseVraiCouleur, reponseFauxCouleur;
color reponseJusteCouleur = color(8, 120, 38);
color reponseMauvaisCouleur = color(204, 31, 31);
color neutre = color(234, 226, 183), hover=color(220, 220, 200);
String vraiFauxQuestion, vraiFauxCorrection;
String messageBravo;
boolean bonneReponse = false;
boolean mauvaiseReponse = false;
boolean questionRepondue = false;
boolean vraiFauxQuestionSuivanteOK = false;
JSONArray vraifauxJSON;
JSONArray donneesBravo;
PImage vraifauxNiveau;

void setup11() {
  vraifauxNiveau= loadImage("data11/Vrai ou Faux level.png");
  vraifauxJSON= loadJSONArray("data11/vraifaux.json"); // On charge le JSON
}

void draw11() {
  textAlign(LEFT);
  vraiFauxJSON();
  afficherJeuVraiFaux();
  afficherQuestionCorrectionVraiFaux();
  vraiFauxQuestionSuivanteOKFonction();
  couleurCorrection();
  vraiFauxEcranFin();
}

void mouseClicked11() {
  // CLIC VRAI JUSTE
  if ((vraiFauxCompteurQuestion==1 || vraiFauxCompteurQuestion==4 
    ||vraiFauxCompteurQuestion==5 ||vraiFauxCompteurQuestion==8 ||vraiFauxCompteurQuestion==10)
    && mouseX > 150 && mouseX < 380 &&  mouseY > 450 && mouseY < 530 && questionRepondue == false ) {
    bonneReponse = true;
    vraiFauxScore+=1;
    questionRepondue = true;
    JSONObject objetBravo = donneesBravo.getJSONObject((int)random(0, 5));
    messageBravo = objetBravo.getString("bravo");
  }
  // CLIC FAUX MAUVAIS
  if ((vraiFauxCompteurQuestion==1 || vraiFauxCompteurQuestion==4 
    ||vraiFauxCompteurQuestion==5 ||vraiFauxCompteurQuestion==8 ||vraiFauxCompteurQuestion==10)
    && mouseX > 420 && mouseX < 650 && mouseY > 450 && mouseY < 530&& questionRepondue == false) {
    questionRepondue = true;
    mauvaiseReponse=true;
  }
  // CLIC FAUX JUSTE
  if ((vraiFauxCompteurQuestion==2 || vraiFauxCompteurQuestion==3 
    ||vraiFauxCompteurQuestion==6 || vraiFauxCompteurQuestion==7 ||vraiFauxCompteurQuestion==9) 
    && mouseX > 420 && mouseX < 650 && mouseY > 450 && mouseY < 530&& questionRepondue == false) {
    vraiFauxScore+=1;
    questionRepondue = true;
    bonneReponse = true;
    JSONObject objetBravo = donneesBravo.getJSONObject((int)random(0, 5));
    messageBravo = objetBravo.getString("bravo");
  }
  // CLIC VRAI MAUVAIS
  if ((vraiFauxCompteurQuestion==2 || vraiFauxCompteurQuestion==3 
    ||vraiFauxCompteurQuestion==6 || vraiFauxCompteurQuestion==7 ||vraiFauxCompteurQuestion==9) 
    && mouseX > 150 && mouseX < 380 &&  mouseY > 450 && mouseY < 530 && questionRepondue == false ) {
    questionRepondue = true;
    mauvaiseReponse=true;
  }
  // TEST BOUTON SUIVANT
  if (vraiFauxCompteurQuestion!=11 && (questionRepondue==true || vraiFauxCompteurQuestion==0) 
    &&mouseX>674&&mouseX<774&&mouseY>400&&mouseY<500) {
    vraiFauxQuestionSuivanteOK=true;
  }
  // TEST BOUTON GARAGE
  if (vraiFauxCompteurQuestion==11 && mouseX > 570 && mouseX < 740 && mouseY > 520 && mouseY < 570) {
    niveauTermine[1]=true;
    print("banane");
  }
}

void vraiFauxJSON() {
  JSONArray donnees = vraifauxJSON.getJSONArray(0); // On récupère toutes les données du premier Array
  JSONObject objet = donnees.getJSONObject(vraiFauxCompteurQuestion); // On récupère les données de l'objet
  // portant le numéro de la question en cours
  vraiFauxQuestion = objet.getString("question"); // On récupère ainsi les questions avec la méthode getString()
  vraiFauxCorrection = objet.getString("correction"); // idem
  donneesBravo = vraifauxJSON.getJSONArray(1);
}

void afficherJeuVraiFaux() {
  background(251, 210, 71);
  // PAGE ACCUEIL MINI JEU
  if (vraiFauxCompteurQuestion == 0) {
    niveauTermine[1] = false;
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
    rect(570, 520, 170, 50);
    fill(0);
    textSize(27);
    text("Let's Go !", 600, 555);
  }
  // PAGE QUESTIONS
  if (vraiFauxCompteurQuestion >= 1 && vraiFauxCompteurQuestion <= 10) {
    image(vraifauxNiveau, 0, 0);
    stroke(91, 35, 51);
    strokeWeight(6);
    int vraiCorner=0, fauxCorner=0;
    if (questionRepondue==false) {
      if (mouseX > 150 && mouseX < 380 && mouseY > 450 && mouseY < 530) {
        vraiCorner=0;
        reponseVraiCouleur=hover;
      } else {
        vraiCorner = 60;
        reponseVraiCouleur=neutre;
      }
      if (mouseX > 420 && mouseX < 650 && mouseY > 450 && mouseY < 530) {
        fauxCorner=0;
        reponseFauxCouleur=hover;
      } else {
        fauxCorner=60;
        reponseFauxCouleur=neutre;
      }
    } else {
      fauxCorner=50;
      vraiCorner=60;
    }
    fill(reponseVraiCouleur);
    rect(150, 450, 230, 80, vraiCorner);
    fill(reponseFauxCouleur);
    rect(420, 450, 230, 80, fauxCorner);
    fill(0);
    textSize(40);
    textAlign(LEFT);
    text("VRAI", 200, 505);
    text("FAUX", 470, 505);
    if (questionRepondue==true) { // afficher le bouton suivant
      int suivHover=0;
      if (mouseX>674&&mouseX<774&&mouseY>400&&mouseY<500) {
        suivHover=10;
        fill(hover);
      } else {
        suivHover=30;
        fill(neutre);
      }
      rect(674, 400, 100, 100, suivHover);
      fill(0);
      
      String suiv;
      if (vraiFauxCompteurQuestion==10) {
        suiv="Fin";
        textSize(40);
      } else {
        suiv=">>";
        textSize(55);
      }
      text(suiv, 693, 467);
    }
    textAlign(CENTER);
    textFont(pixel);
    textSize(27);
    text(vraiFauxScore +"/10", 727, 300); // afficher le score
    textSize(47);
    text(vraiFauxCompteurQuestion, 82, 300); // afficher le numéro de question
  }
}

void afficherQuestionCorrectionVraiFaux() {
  textFont(meteora);
  textSize(27);
  textAlign(CENTER);
  text(vraiFauxQuestion, width/2, 190);
  textSize(20);
  if (bonneReponse==true) {
    fill(8, 120, 38);
    text(messageBravo, width/2, height/2+60);
  } else if (mauvaiseReponse==true) {
    textSize(16);
    fill(204, 31, 31);
    text(vraiFauxCorrection, width/2, height/2+60);
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

void vraiFauxQuestionSuivanteOKFonction() {
  if (vraiFauxQuestionSuivanteOK==true ) {
    vraiFauxQuestionSuivanteOK = false;
    questionRepondue = false;
    vraiFauxCompteurQuestion+=1;
    bonneReponse = false;
    mauvaiseReponse = false;
  }
  if (vraiFauxCompteurQuestion == 0) {
    vraiFauxQuestionSuivanteOK = false;
    questionRepondue = false;
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
    rect(570, 520, 170, 50);
    fill(0);
    textSize(27);
    text(" → Garage", 590, 555);
  }
  if (vraiFauxCompteurQuestion==11 && niveauTermine[1]==true) {
    affichageEcran[1]=false;
    affichageEcranPrincipal=true;
    affichageEcranPrincipal();
  }
}
