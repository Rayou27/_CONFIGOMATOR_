int compteurNiveau12 = 0;
int score12, argent12;
int typePaveMobile, compteurBonusChrono, chronoFinal;
int memoireChronoQuestion=millis(), chronoQuestion;
int memoireChronoPave=millis(), chronoPave;
int[] chronoReponse = new int[12];
int[] paveCroissant=new int[13], paveDecroissant = new int[13];
int[] currentPave = new int[13];
int[] borneInfX12= new int[13], borneSupX12= new int[13], borneInfY12= new int[13], borneSupY12= new int[13];
int[][] paveFixe = new int[3][13], paveMobile = new int[3][13];
color ecranCalculCouleur = color(255, 218, 169), boutonCouleur = color(252, 224, 129), 
  calculBonCouleur = color(0, 207, 0), calculMauvaisCouleur = color(255, 0, 0);
char good='V', bad='X';
char[] answer = new char[12];
String resultat="";
String[] calculEnonce = new String[11], calculSolution = new String[11];
String[] borneID = new String[13];
boolean onlyOne=false;
boolean testReponseSaisie = false;
boolean[] currentCase = new boolean[13];
JSONArray calculrapideJSON;

void setup12() {
  calculrapideJSON = loadJSONArray("data12/calculrapide.json");
  reglesImg[2]=loadImage("data12/regles12.png");
  niveauImg[2]=loadImage("data12/level12.png");
  finImg[2]=loadImage("data12/fin12.png");
  calculrapideJSON();
  paveJSON();
  for (int i=1; i<=12; i++) {
    currentCase[i]=false;
  }
}

void draw12() {
  conversionPave(); 
  afficherJeuCalculRapide();
  if (testReponseSaisie==false) {
    typePaveMobile();
  }
}

void mouseClicked12() {
  reponseEntree();
  // TEST LANCER NIVEAU
  if (compteurNiveau12==0&&mouseX>430&&mouseX<680&&mouseY>450&&mouseY<530) {
    compteurNiveau12=1;
    memoireChronoQuestion=millis();
  }
  // TEST BOUTON SUIVANT
  if (compteurNiveau12!=11 && testReponseSaisie==true 
    &&mouseX>365&&mouseX<435&&mouseY>250&&mouseY<320) {
    calculSuivantOKFonction();
  }
  for (int i=1; i<=12; i++) {
    if (mouseX>borneInfX12[i] && mouseX<borneSupX12[i] 
      && mouseY>borneInfY12[i] && mouseY<borneSupY12[i] 
      && testReponseSaisie==false) {
      currentCase[i]=true;
      //println("case " +borneID[i]+ " cliquée");
    }
  }
  if (compteurNiveau12==11&&onlyOne==false) {
    argent12Fonction();
    onlyOne=true;
  }
  if(compteurNiveau12==11&&mouseX>588&&mouseX<676&&mouseY>438&&mouseY<520){
    niveauTermine[2]=true;
  }
  reponseEntree();
  boutonDELOK();
}

void afficherJeuCalculRapide() {
  // PAGE ACCUEIL MINI JEU
  if (compteurNiveau12 == 0) {
    image(reglesImg[compteurGlobalNiveaux], 0, 0);
    textAlign(CENTER);
    textFont(meteora);
    textSize(27);
    text("Dix énoncés de calcul, + ou - simples \n(lol). Donne ta réponse sur le pavé \nnumérique affiché à l'écran et ce le \nplus vite posible !!", width/2, 250);
    int letsgoHover12=0;
    if (mouseX>430&&mouseX<680&&mouseY>450&&mouseY<530) {
      letsgoHover12=10;
      fill(hover);
    } else {
      letsgoHover12=30;
      fill(neutre);
    }
    stroke(0, 48, 73);
    strokeWeight(4);
    rect(430, 450, 250, 80, letsgoHover12);
    fill(0); // fill le texte en hover aussi /!\
    textSize(35);
    text("Let's Go !!", 557, 503);
  }  
  // PAGE DE JEU - CALCULATOR
  if (compteurNiveau12>=1 && compteurNiveau12<=10) {
    image(niveauImg[compteurGlobalNiveaux], 0, 0);
    // TABLEAU SCORE
    fill(0);
    textFont(pixel);
    textSize(25);
    int i=1;
    i=constrain(i, 0, 8);
    for (int x=20; x<336; x+=34) {
      if (compteurNiveau12>i-1) {
        text(answer[i], 60+x, 475);
        if (chronoReponse[i]!=0) {
          text(chronoReponse[i], 60+x, 522);
        }
      }
      i++;
    }
    // ECRAN
    stroke(0, 48, 73);
    strokeWeight(4);
    fill(ecranCalculCouleur);
    if (answer[compteurNiveau12]=='V') {
      fill(calculBonCouleur);
    }
    if (answer[compteurNiveau12]=='X') {
      fill(calculMauvaisCouleur);
    }
    rect(477, 126, 265, 90, 30); // rectangle résultat
    // TOUCHES DU PAVÉ    
    int compteurCarre = 0;
    for (int y=225; y<496; y+=90) {
      for (int x=479; x<680; x+=100) {
        fill(190);
        rect(x, y, 65, 65);
        if (mouseX<x+65&&mouseX>x&&mouseY>y&&mouseY<y+65) {
          fill(140);
          rect(x, y, 65, 65);
          if (mousePressed==true) {
            fill(boutonCouleur);
            rect(x, y, 65, 65);
          }
        }
        fill(0);
        compteurCarre++;
        String affichageCase;
        textAlign(CENTER);
        if (compteurNiveau12>3&&compteurNiveau12<8) {
          currentPave[10]=10;
          currentPave[12]=12;
        }
        textFont(pixel);
        switch(currentPave[compteurCarre]) {
        case 10:
          textSize(35);
          affichageCase=" DEL";
          break;
        case 12:
          textSize(35);
          affichageCase=" OK";
          break;
        default:
          textSize(45);
          affichageCase=str(currentPave[compteurCarre]);
        }
        text(affichageCase, x+32, y+45);
      }
      textAlign(LEFT);
    }
    // TEXTE
    fill(0);
    textFont(pixel);
    if (testReponseSaisie==false) {
      chronoQuestion=int((millis()-memoireChronoQuestion)/1000);
      fill(100, 3*millis()/4%200, millis()/4%200);
    }
    text("Chrono : "+chronoQuestion+ " s", 90, 300); // afficher le chrono
    fill(0);
    textSize(40);
    text(score12, 350, height-32);
    text(compteurNiveau12, 102, height-32); // afficher le numéro de question
    textAlign(CENTER);
    switch(compteurNiveau12) {
    case 4:
      textSize(40);
      break;
    case 10:
      textSize(35);
      break;
    default:
      textSize(50);
      break;
    }
    text(calculEnonce[compteurNiveau12], 225, 220); // affiche l'énoncé en fonction du niveau en cours
    textAlign(LEFT);
    textSize(55);
    text(resultat, 510, 187);
    // BOUTON SUIVANT
    if (testReponseSaisie==true) { // afficher le bouton suivant
      int suivHover=0;
      if (mouseX>365&&mouseX<435&&mouseY>250&&mouseY<320) {
        suivHover=10;
        fill(hover);
      } else {
        suivHover=30;
        fill(neutre);
      }
      stroke(0, 48, 73);
      strokeWeight(5);
      rect(365, 250, 70, 70, suivHover);
      fill(0);
      String suiv;
      int x=383;
      textFont(meteora);
      if (compteurNiveau12==10) {
        suiv="Fin";
        textSize(27);
        x=375;
      } else {
        suiv=">>";
        textSize(30);
        x=383;
      }
      text(suiv, x, 295);
    }
  } 
  if (compteurNiveau12==11) {
    image(finImg[compteurGlobalNiveaux], 0, 0);
    textFont(meteora);
    textAlign(CENTER);
    fill(0);
    textSize(24);
    text("Apparement le calcul c'est ton truc... \nTu as réussi, bravo ! Voici tes statistiques", width/2, 190);
    textAlign(LEFT);
    fill(0);
    textSize(22);
    text("Bonnes réponses : ", 130, 345);
    text("Bonus chrono : x ", 130, 390);   
    text("Bonus escargot* : ", 130, 435);
    textSize(15);
    text("*Avoir passé plus de\nsecondes à répondre au total", 140, 470); 
    textSize(23);
    String bonusEscargot="Non";
    fill(reponseMauvaisCouleur);
    if (chronoFinal>200) {
      bonusEscargot="Oui";
      fill(reponseJusteCouleur);
    }
    text(bonusEscargot, 130+textWidth("Bonus escargot* :"), 435);
    textFont(pixel);
    textAlign(LEFT);
    textSize(50);
    textAlign(CENTER);
    fill(0, 48, 73);
    text(argent12+" $", 575, 380);
    fill(0);
    textSize(40);
    textAlign(LEFT);
    text(score12, 360, 347);
    text(compteurBonusChrono, 335, 392); 
    textSize(22);
    text("200", 313, 470);
    int homeHover12=20;
    color neutre12=color(252,191,73),hover12=color(240,159,4);
    if (mouseX>588&&mouseX<676&&mouseY>438&&mouseY<520) {
      homeHover12=20;
      fill(hover12);
    } else {
      homeHover12=60;
      fill(neutre12);
    }
    rect(588, 438, 88, 82, homeHover12);
    fill(0);
    textSize(60);
    textFont(arial);
    textAlign(CENTER);
    text("⌂", 633, 490);
    textFont(meteora);
    if (niveauTermine[2]==true) {
      affichageEcran[2]=false;
      affichageEcranPrincipal=true;
      affichageEcranPrincipal();
    }
  }
}

void boutonDELOK() {
  int boutonOK, boutonDEL, numBas;
  switch(compteurNiveau12) {
  case 8:
    boutonOK=11;
    boutonDEL=10;
    numBas=12;
    break;
  case 9:
    boutonOK=10;
    boutonDEL=12;
    numBas=11;
    break;
  case 10:
    switch(typePaveMobile) {
    case 0:
      boutonOK=10;
      boutonDEL=12;
      numBas=11;
      break;
    case 1:
      boutonOK=11;
      boutonDEL=12;
      numBas=10;
      break;
    case 2:
      boutonOK=12;
      boutonDEL=11;
      numBas=10;
      break;
    default:
      boutonOK=1;
      boutonDEL=2;
      numBas=3;
      break;
    }
    break;
  default:
    boutonDEL=10;
    boutonOK=12;
    numBas=11;
    break;
  }
  if (currentCase[boutonOK]==true) {
    testReponseSaisie=true;
    verifCalculBon();
    chronoReponse[compteurNiveau12]=chronoQuestion;
    currentCase[boutonOK]=false;
  }
  if (currentCase[boutonDEL]==true) {
    resultat="";
    currentCase[boutonDEL]=false;
  }
  if (currentCase[numBas]==true) {
    resultat+=currentPave[numBas];
    currentCase[numBas]=false;
  }
}

void calculSuivantOKFonction() {
  testReponseSaisie = false;
  compteurNiveau12++;
  ecranCalculCouleur = color(255, 218, 169);
  resultat="";
  memoireChronoQuestion=millis();
}

void argent12Fonction() {
  // BONUS UNDER-SEVEN
  for (int i=1; i<=10; i++) {
    if (answer[i]==good&&chronoReponse[i]<=7) {
      compteurBonusChrono+=3;
    }
    if (answer[i]==good&&chronoReponse[i]>=8&&chronoReponse[i]<=10) {
      compteurBonusChrono+=2;
    }
    if (answer[i]==good&&chronoReponse[i]>=11) {
      compteurBonusChrono++;
    }
  }
  chronoFinal=0;
  for (int i=1; i<=10; i++) {
    chronoFinal+=chronoReponse[i];
  }
  if (chronoFinal>200) {
    argent12=10000;
  } else {
    argent12=0;
  }
  argent12+=20000+250*compteurBonusChrono*score12;
}

void conversionPave() {
  switch(compteurNiveau12) {
    // PAVES FIXES
  case 1:
  case 2:
  case 3:
    currentPave=paveFixe[0];
    break;
  case 8:
    currentPave=paveFixe[1];
    break;
  case 9:
    currentPave=paveFixe[2];
    break;
    // PAVE CROISSANT
  case 4:
  case 5:
    currentPave=paveCroissant;
    break;
    // PAVE DECROISSANT
  case 6:
  case 7:
    currentPave=paveDecroissant;
    break;
  case 10:
    currentPave=paveMobile[typePaveMobile];
    break;
  }
}

void calculrapideJSON() {
  JSONArray donneesEnonce = calculrapideJSON.getJSONArray(0);
  JSONObject objetEnonce;
  for (int i=1; i<=10; i++) {
    objetEnonce = donneesEnonce.getJSONObject(i);
    calculEnonce[i]= objetEnonce.getString("enonce");
    calculSolution[i]= objetEnonce.getString("solution");
    //println("énoncé : "+calculEnonce[i]+"\t\t\t\t solution : "+calculSolution[i]);
  }
  JSONArray donneesCase = calculrapideJSON.getJSONArray(1);
  JSONObject objetCase;
  //println("");
  for (int i=1; i<=12; i++) {
    objetCase= donneesCase.getJSONObject(i);  
    borneInfX12[i] = objetCase.getInt("infx"); 
    borneSupX12[i] = objetCase.getInt("supx");
    borneInfY12[i] = objetCase.getInt("infy");
    borneSupY12[i] = objetCase.getInt("supy");
    borneID[i] = objetCase.getString("id");
    //println("Carré "+borneID[i]+ " " +"infx :"+borneInfX12[i]+"   supx :"+borneSupX12[i]+"   infy :"+borneInfY12[i]+"   supy :"+borneSupY12[i]);
  }
}

void paveJSON() {
  //println("\nType Croissant : ");
  for (int i=1; i<=9; i++) {
    paveCroissant[i]=i;
    //print(paveCroissant[i]+", ");
  }
  //println("");
  //println("\nType Décroissant : ");
  for (int i=1; i<=9; i++) {
    paveDecroissant[i]=10-i;
    //print(paveDecroissant[i]+", ");
  }
  //println("");
  JSONArray donneesPaveFixe = calculrapideJSON.getJSONArray(2);
  JSONObject objetPaveFixe;
  for (int i=0; i<=2; i++) {
    objetPaveFixe=donneesPaveFixe.getJSONObject(i);
    //println("\nType Fixe : "+ i);
    for (int j=1; j<=12; j++) {
      paveFixe[i][j]=objetPaveFixe.getInt(str(j));
      //print(paveFixe[i][j]+", ");
    }
  }
  //println("");
  JSONArray donneesPaveMobile = calculrapideJSON.getJSONArray(3);
  JSONObject objetPaveMobile;
  for (int i=0; i<=2; i++) {
    objetPaveMobile=donneesPaveMobile.getJSONObject(i);
    //println("\nType Mobile : "+ i);
    for (int j=1; j<=12; j++) {
      paveMobile[i][j]=objetPaveMobile.getInt(str(j));
      //print(paveMobile[i][j]+", ");
    }
  }
}


void typePaveMobile() {
  chronoPave=int((millis()-memoireChronoPave)/1500);
  switch(chronoPave) {
  case 0:
    typePaveMobile=0;
    break;
  case 1:
    typePaveMobile=1;
    break;
  case 2:
    typePaveMobile=2;
    break;
  case 3:
    memoireChronoPave=millis();
    break;
  default:
    typePaveMobile=0;
    break;
  }
}

void reponseEntree() {
  for (int numero = 0; numero<=9; numero++) {
    if (currentCase[numero]==true&&resultat.length()<7) {
      resultat+=currentPave[numero];
      currentCase[numero]=false;
    }
  }
}

void verifCalculBon() {
  //print("\nle résultat était " + calculSolution[compteurNiveau12]+"\ntu as répondu " + resultat);
  if (resultat.equals(calculSolution[compteurNiveau12])) {
    score12++;
    answer[compteurNiveau12]=good;
    ecranCalculCouleur=calculBonCouleur;
    //println("\ndonc bonne réponse !!");
  } else {
    ecranCalculCouleur=calculMauvaisCouleur;
    answer[compteurNiveau12]=bad;
    //println("\ndonc mauvaise réponse ...");
  }
}
