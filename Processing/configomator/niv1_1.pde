int vraiFauxScore=0;
int vraiFauxCompteurQuestion =0;
int argent11 =0;
color reponseVraiCouleur, reponseFauxCouleur;
color reponseJusteCouleur = color(8, 120, 38), reponseMauvaisCouleur = color(204, 31, 31), 
  neutre = color(234, 226, 183), hover=color(220, 220, 200);
String vraiFauxQuestion, vraiFauxCorrection,messageBravo;
boolean bonneReponse = false,mauvaiseReponse = false,
questionRepondue = false,bonusHarvard=false,vraiFauxQuestionSuivanteOK = false;
JSONArray vraifauxJSON,donneesBravo;
JSONObject objetBravo;

void setup11() {
  reglesImg[1]= loadImage("data11/regles11.png");
  niveauImg[1]= loadImage("data11/level11.png");
  finImg[1]= loadImage("data11/fin11.png");
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
    objetBravo = donneesBravo.getJSONObject((int)random(0, 5));
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
    objetBravo = donneesBravo.getJSONObject((int)random(0, 5));
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
  if (vraiFauxCompteurQuestion!=11&& (questionRepondue==true
    &&mouseX>674&&mouseX<774&&mouseY>400&&mouseY<500) || 
    (vraiFauxCompteurQuestion==0&&mouseX>430&&mouseX<680&&mouseY>450&&mouseY<530)) {
    vraiFauxQuestionSuivanteOK=true;
  }
  // TEST BOUTON GARAGE
  if (vraiFauxCompteurQuestion==11 &&mouseX>588&&mouseX<676&&mouseY>438&&mouseY<520) {
    niveauTermine[1]=true;
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
  // PAGE ACCUEIL MINI JEU
  if (vraiFauxCompteurQuestion == 0) {
    niveauTermine[1] = false;
    image(reglesImg[compteurGlobalNiveaux], 0, 0);
    textSize(27);
    textAlign(CENTER);
    fill(0);
    text("Dix affirmations, à toi de trouver si \nelles sont vraies ou fausses ! Plus \ntu as de réponses justes et plus \ntu gagnes d'argent.", width/2, 250);
    int letsgoHover=0;
    if (mouseX>430&&mouseX<680&&mouseY>450&&mouseY<530) {
      letsgoHover=10;
      fill(hover);
    } else {
      letsgoHover=30;
      fill(neutre);
    }
    rect(430, 450, 250, 80, letsgoHover);
    fill(0); // fill le texte en hover aussi /!\
    textAlign(CENTER);
    textSize(35);
    text("Let's Go !!", 557, 503);
  }
  // PAGE QUESTIONS
  if (vraiFauxCompteurQuestion >= 1 && vraiFauxCompteurQuestion <= 10) {
    image(niveauImg[1], 0, 0);
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
  if (bonneReponse==true&&messageBravo.equals("Harvard wants to know your position\nAllow - Deny")
    &&mouseX>325&&mouseX<485&&mouseY>365&&mouseY<395&&mousePressed==true) {
    bonusHarvard=true;
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
    image(finImg[compteurGlobalNiveaux], 0, 0);
    argent11=vraiFauxScore*5000;
    textSize(25);
    fill(0);
    text("Tu t'es débrouillé tant bien que mal pour \nterminer ce Vrai/Faux, bravo ! \nVoici tes statistiques", width/2, 195);
    textSize(27);
    textAlign(LEFT);
    text("Ta note :", 120, 405);
    textSize(15); 
    text("*Avoir réagi à la\nproposition de Harvard B-)", 137, 477);
    textSize(23);
    text("Bonus Harvard* :", 120, 450);
    if (bonusHarvard==true) {
      fill(reponseJusteCouleur);
      text("Oui", 334, 450);
    } else {
      fill(reponseMauvaisCouleur);
      text("Non", 334, 450);
    }
    textAlign(CENTER);
    textFont(pixel);
    textSize(32);
    fill(255, 215, 0);
    text(vraiFauxScore+"/10", 300, 405);
    textSize(50);
    text(argent11 +"$", 575, 400);

    int homeHover=20;
    if (mouseX>588&&mouseX<676&&mouseY>438&&mouseY<520) {
      homeHover=20;
      fill(hover);
    } else {
      homeHover=60;
      fill(neutre);
    }
    rect(588, 438, 88, 82, homeHover);
    fill(0);
    textSize(60);
    textFont(arial);
    textAlign(CENTER);
    text("⌂", 633, 490);
    textFont(meteora);
    if (vraiFauxCompteurQuestion==11 && niveauTermine[1]==true) {
      affichageEcran[1]=false;
      affichageEcranPrincipal=true;
      affichageEcranPrincipal();
    }
  }
}
