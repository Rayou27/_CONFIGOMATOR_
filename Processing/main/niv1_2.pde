int compteurNiveau12 = 0;
int score32, argent32;
int typePaveMobile, compteurBonusChrono, chronoFinal;
int memoireChronoQuestion=millis(), chronoQuestion;
int memoireChronoPave=millis(), chronoPave;
int[] chronoReponse = new int[12];
int[] paveCroissant=new int[13], paveDecroissant = new int[13];
int[] currentPave = new int[13];
int[] borneInfX12= new int[13], borneSupX12= new int[13], borneInfY12= new int[13], borneSupY12= new int[13];
int[][] paveFixe = new int[3][13], paveMobile = new int[3][13];
color ecranCalculCouleur = color(200), boutonCouleur = color(252, 224, 129), 
  calculBonCouleur = color(0, 207, 0), calculMauvaisCouleur = color(255, 0, 0);
char good='✓', bad='X';
char[] answer = new char[12];
String resultat="";
String[] calculEnonce = new String[11], calculSolution = new String[11];
String[] borneID = new String[13];
boolean onlyOne=false;
boolean testReponseSaisie = false;
boolean calculSuivantOK;
boolean[] currentCase = new boolean[13];
JSONArray calculrapideJSON;

void setup12() {
  background(237, 136, 59);
  calculrapideJSON = loadJSONArray("data12/calculrapide.json");
  calculrapideJSON();
  paveJSON();
}

void draw12() {
  strokeWeight(1);
  conversionPave(); 
  afficherJeuCalculRapide();
  if (testReponseSaisie==false) {
    typePaveMobile();
  }
}

void mouseClicked12() {
  reponseEntree();
  // TEST LANCER NIVEAU
  if (compteurNiveau==0&&mouseX>570&&mouseX<740&&mouseY>520&&mouseY<570) {
    compteurNiveau=1;
    memoireChronoQuestion=millis();
  }
  // TEST BOUTON SUIVANT (à faire)
  if (compteurNiveau!=11 && testReponseSaisie==true 
    && mouseX > 210 && mouseX < 380 && mouseY > 450 && mouseY < 490&& testReponseSaisie==false) {
    calculSuivantOK=true;
  }
  for (int i=1; i<=12; i++) {
    if (mouseX>borneInfX12[i] && mouseX<borneSupX12[i] 
      && mouseY>borneInfY12[i] && mouseY<borneSupY12[i] 
      && testReponseSaisie==false) {
      currentCase[i]=true;
      //println("case " +borneID[i]+ " cliquée");
    }
  }
  if (mouseX>210&&mouseX<380&&mouseY>450&&mouseY<500) {
    calculSuivantOKFonction();
  }
  if (compteurNiveau==11&&onlyOne==false) {
    argent12Fonction();
    onlyOne=true;
  }
  reponseEntree();
  boutonDELOK();
}

void afficherJeuCalculRapide() {
  background(237, 136, 59);

  // PAGE ACCUEIL MINI JEU
  if (compteurNiveau == 0) {
    textSize(32);
    fill(0);
    text("Stage 1-2", 360, 70);
    textSize(40);
    text("LE CALCUL RAPIDE \n   niveau Term.S", 220, 140);
    fill(255);
    rect(100, 230, 600, 200);
    fill(0);
    textSize(27);
    text("10 énoncés de calcul, + ou - simples (lol) \nDonne ta réponse sur le pavé numérique \naffiché à l'écran et ce le plus vite posible !!", 124, 296);
    fill(boutonCouleur);
    rect(570, 520, 170, 50);
    fill(0);
    textSize(27);
    text("Let's Go~", 600, 555);
  }
  // PAGE DE JEU - CALCULATOR
  if (compteurNiveau>=1 && compteurNiveau<=10) {
    // BOX (rectangles)
    fill(255);
    rect (400, 50, 350, 500); // fond calculatrice
    fill(ecranCalculCouleur); // ajouter fill rouge vert
    rect(430, 85, 290, 80); // ecran calculatrice
    rect(40, 180, 330, 80); // rect enonce, dessous "résoudre"
    // TABLEAU SCORE
    fill(0);
    textSize(15);
    int i=1;
    i=constrain(i, 0, 8);
    for (int x=20; x<336; x+=35) {
      line(x, 320, x, 440);
      text(i, 47+x, 350);
      if (compteurNiveau>i) {
        text(answer[i], 47+x, 390);
        text(chronoReponse[i], 47+x, 430);
      }
      i++;
    }
    line(365, 320, 365, 440);
    for (int y=320; y<441; y+=40) {
      line(20, y, 400, y);
    }
    text("Lvl.", 27, 350);
    text("Ans.", 27, 390);
    text("Sec.", 27, 430);

    // TOUCHES DU PAVÉ    
    int compteurCarre = 0;
    for (int y=185; y<456; y+=90) {
      for (int x=445; x<646; x+=100) {
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
        compteurCarre+=1;
        String affichageCase;
        textAlign(CENTER);
        if (compteurNiveau>3&&compteurNiveau<8) {
          currentPave[10]=10;
          currentPave[12]=12;
        }
        switch(currentPave[compteurCarre]) {
        case 10:
          textSize(25);
          affichageCase=" DEL";
          break;
        case 12:
          textSize(25);
          affichageCase=" OK";
          break;
        default:
          textSize(35);
          affichageCase=str(currentPave[compteurCarre]);
        }
        text(affichageCase, x+32, y+45);
      }
      textAlign(LEFT);
    }
    // TEXTE
    fill(0);
    textSize(40);
    text("CALCULATOR", 70, 100);
    textSize(27);
    if (testReponseSaisie==false) {
      chronoQuestion=int((millis()-memoireChronoQuestion)/1000);
      fill(3*millis()/4%255, 0, 0);
    }
    text("Chrono : "+chronoQuestion+ " s", 50, 300); // afficher le chrono
    fill(0);
    text("Bonnes réponses : "+score32, 120, height-40); // afficher le score
    text("Q°" + compteurNiveau, 30, height-40); // afficher le numéro de question
    text("Résoudre :", 45, 150);
    text(calculEnonce[compteurNiveau], 65, 230); // affiche l'énoncé en fonction du niveau en cours
    textSize(50);
    text(resultat, 470, 145);
    // BOUTON SUIVANT
    if (testReponseSaisie==true) { // afficher le bouton suivant
      fill(boutonCouleur);
      rect(210, 450, 170, 50);
      fill(0);
      textSize(27);
      text("Suivant !", 240, 485);
    }
  }
  if (compteurNiveau==11) {
    stroke(0);
    strokeWeight(6);
    fill(255);
    rect(100, 50, 600, 150);
    rect(100, 230, 370, 250);
    rect(500, 360, 200, 120);
    fill(0);
    textSize(27);
    textAlign(LEFT);
    text("blabla bravo", 155, 95);
    fill(200, 200, 255);
    rect(620, 510, 160, 60);
    fill(0);
    text("->"+" Garage", 640, 549);
    text("Bonnnes réponses : "+score32, 130, 280);
    text("Bonus chrono : × "+compteurBonusChrono, 130, 330);
    String bonusEscargot="Non";
    if (chronoFinal>200) {
      bonusEscargot="Oui";
    }
    text("Bonus escargot* : "+bonusEscargot, 130, 380);
    text("TOTAL", 550, 400);
    text(argent32+" $", 550, 440);
    textSize(20);
    text("*Avoir passé plus de 200\nsecondes à répondre au total", 130, 430);
  }
}

void boutonDELOK() {
  int boutonOK, boutonDEL, numBas;
  switch(compteurNiveau) {
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
    chronoReponse[compteurNiveau]=chronoQuestion;
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
  compteurNiveau++;
  ecranCalculCouleur = color(200);
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
    argent32=10000;
  } else {
    argent32=0;
  }
  argent32+=20000+250*compteurBonusChrono*score32;
}

void conversionPave() {
  switch(compteurNiveau) {
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
  chronoPave=int((millis()-memoireChronoPave)/2000);
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
  //print("\nle résultat était " + calculSolution[compteurNiveau]+"\ntu as répondu " + resultat);
  if (resultat.equals(calculSolution[compteurNiveau])) {
    score32++;
    answer[compteurNiveau]=good;
    ecranCalculCouleur=calculBonCouleur;
    //println("\ndonc bonne réponse !!");
  } else {
    ecranCalculCouleur=calculMauvaisCouleur;
    answer[compteurNiveau]=bad;
    //println("\ndonc mauvaise réponse ...");
  }
}
