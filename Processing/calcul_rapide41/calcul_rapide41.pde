int calculCompteurQuestion = 4;
int calculScore=0;
int numeroCase = 5;

int[] borneInfX, borneSupX, borneInfY, borneSupY;
int[] pave123 = {7, 8, 9, 4, 5, 6, 1, 2, 3};
int[] pave8 = {6, 0, 3, 1, 5, 2, 4, 9, 7, 8};
int[] pave9 = {4, 7, 1, 9, 5, 2, 6, 8, 0, 3};
int[] pave101 = {9, 1, 5, 6, 3, 0, 8, 2, 7, 4};
int[] pave102 = {5, 2, 4, 6, 3, 1, 8, 7, 9, 0};
int[] pave103 = {0, 3, 2, 8, 4, 7, 5, 1, 9, 6};

float argentGagne41 =0;

color ecranCalculCouleur, calculBonCouleur, calculMauvaisCouleur;
color reponseViergeCouleur = color(252, 224, 129); // couleur jaune boutons
color reponseJusteCouleur = color(62, 207, 62); // couleur vert
color reponseMauvaisCouleur = color(255, 48, 100); // couleur rouge

String niveauEnCours = "4-1";
String calculEnonce, calculSolution;
String reponseEntree="7.";

boolean niveauTermine41 = false;
boolean testReponseSaisie = false;
boolean calculBon, calculMauvais;
boolean calculSuivantOK;

boolean[] currentCase = new boolean[13];
boolean[] boutonSelect = new boolean[12];

JSONArray calculrapideJSON;

void setup() {
  size(800, 600);
  background(237, 136, 59);
}

void draw() {
  miniJeu41();
}

void mousePressed() {
  mousePressed41();
}

void miniJeu41() {
  afficherJeuCalculRapide();
  calculSuivantOK();
  boutonDELOK();
  conversionBouton();
  //calculrapideJSON(); QUAND çA REMARCHERA...
}

void mousePressed41() {
  // TEST LANCER NIVEAU
  if (calculCompteurQuestion==0 && mouseX > 570 && mouseX < 740 && mouseY > 520 && mouseY < 570) {
    calculSuivantOK=true;
  }
  // TEST BOUTON SUIVANT
  if (calculCompteurQuestion!=11 && testReponseSaisie==true 
    && mouseX > 0 && mouseX < 0 && mouseY > 0 && mouseY < 0) {
    calculSuivantOK=true;
  }
  // TEST CASE 1
  if (mouseX>445 && mouseX<510 && mouseY>185 && mouseY<250) {
    currentCase[1]=true;
    println("case 1 cliquée");
  }
  // TEST CASE 2
  if (mouseX>545 && mouseX<610 && mouseY>185 && mouseY<250) {
    currentCase[2]=true;
    println("case 2 cliquée");
  }
  // TEST CASE 3
  if (mouseX>645 && mouseX<710 && mouseY>185 && mouseY<250) {
    currentCase[3]=true;
    println("case 3 cliquée");
  }
  // TEST CASE 4
  if (mouseX>445 && mouseX<510 && mouseY>275 && mouseY<340) {
    currentCase[4]=true;
    println("case 4 cliquée");
  }
  // TEST CASE 5
  if (mouseX>545 && mouseX<610 && mouseY>275 && mouseY<340) {
    currentCase[5]=true;
    println("case 5 cliquée");
  }
  // TEST CASE 6
  if (mouseX>645 && mouseX<710 && mouseY>275 && mouseY<340) {
    currentCase[6]=true;
    println("case 6 cliquée");
  }
  // TEST CASE 7
  if (mouseX>445 && mouseX<510 && mouseY>365 && mouseY<430) {
    currentCase[7]=true;
    println("case 7 cliquée");
  }
  // TEST CASE 8
  if (mouseX>545 && mouseX<610 && mouseY>365 && mouseY<430) {
    currentCase[8]=true;
    println("case 8 cliquée");
  }
  // TEST CASE 9
  if (mouseX>645 && mouseX<710 && mouseY>365 && mouseY<430) {
    currentCase[9]=true;
    println("case 9 cliquée");
  }
  // TEST CASE 10
  if (mouseX>445 && mouseX<510 && mouseY>455 && mouseY<520) {
    currentCase[10]=true;
    println("case 10 cliquée");
  }
  // TEST CASE 11
  if (mouseX>545 && mouseX<610 && mouseY>455 && mouseY<520) {
    currentCase[11]=true;
    println("case 11 cliquée");
  }
  // TEST CASE 12
  if (mouseX>645 && mouseX<710 && mouseY>455 && mouseY<520) {
    currentCase[12]=true;
    println("case 12 cliquée");
  }
}

void afficherJeuCalculRapide() {
  background(237, 136, 59);

  // PAGE ACCUEIL MINI JEU
  if (calculCompteurQuestion == 0) {
    niveauTermine41 = false;
    textSize(32);
    fill(0);
    text(niveauEnCours, 360, 70);
    textSize(40);
    text("LE CALCUL RAPIDE \n   niveau Term.S", 220, 140);
    fill(255);
    rect(100, 230, 600, 200);
    fill(0);
    textSize(27);
    text("10 énoncés de calcul, + ou - simples (lol) \nDonne ta réponse sur le pavé numérique \naffiché à l'écran et ce le plus vite posible !!", 124, 296);
    fill(reponseViergeCouleur);
    rect(570, 520, 170, 50);
    fill(0);
    textSize(27);
    text("Let's Go~", 600, 555);
  }

  // PAGE DE JEU - CALCULATOR
  if (calculCompteurQuestion>=1 && calculCompteurQuestion<=10) {
    // BOX (rectangles)
    fill(255);
    rect (400, 50, 350, 500); // fond calculatrice
    fill(200); // ajouter fill rouge vert
    rect(430, 85, 290, 80); // ecran calculatrice
    rect(40, 220, 330, 80); // rect enonce, dessous "résoudre"
    // TOUCHES DU PAVÉ    
    int compteurCarre = 0;
    int compteurCarreBorne = constrain(compteurCarre, 0, 9);
    for (int y=185; y<456; y+=90) {
      for (int x=445; x<646; x+=100) {
        fill(200);
        rect(x, y, 65, 65);
        fill(0);
        textSize(35);
        compteurCarreBorne=constrain(compteurCarre, 0, 9);
        compteurCarre=constrain(compteurCarre, 0, 12);
        compteurCarre+=1;
        compteurCarreBorne=compteurCarre;
        //print(compteurCarre);
        if (compteurCarre<=9) {
          if (calculCompteurQuestion<=3 ) {
            text(pave123[compteurCarreBorne-1], x+20, y+45);
          } 
          if (calculCompteurQuestion==4 || calculCompteurQuestion==5) {
            text(compteurCarre, x+20, y+45);
          } 

          if (calculCompteurQuestion==6 || calculCompteurQuestion==7) {
            text(10-compteurCarre, x+20, y+45);
          } 
          if (calculCompteurQuestion==8) {
            text(pave8[compteurCarreBorne-1], x+20, y+45);
          }
          if (calculCompteurQuestion==9) {
            text(pave9[compteurCarreBorne-1], x+20, y+45);
          }
        } 
        if (compteurCarre==10) {
          textSize(25);
          text("DEL", x+10, y+45);
        } 
        if (compteurCarre==11) {
          if (calculCompteurQuestion<8) {
            text("0", x+20, y+45);
          }
          if (calculCompteurQuestion==8) {
            text(pave8[9], x+20, y+45);
          }
          if (calculCompteurQuestion==9) {
            text(pave9[9], x+20, y+45);
          }
        } 
        if (compteurCarre==12) {
          if (calculCompteurQuestion<10) {
            textSize(25);
            text("OK", x+15, y+45);
          }
        }
      }
    }

    // TEXTE
    fill(0);
    textSize(40);
    text("CALCULATOR", 70, 100);
    textSize(27);
    text("Score : " + calculScore, 150, height-40); // afficher le score
    text("Q°" + calculCompteurQuestion, 30, height-40); // afficher le numéro de question
    text("Résoudre :", 45, 190);
    text("calculEnonce", 65, 270); // quand le JSON remarchera, enlever les ""
    textSize(50);
    text(reponseEntree, 670, 145);
  }
}

void verifCalculBon() {
  if (reponseEntree==calculSolution && testReponseSaisie==true) {
    ;
  }
}

void conversionBouton() {
  // NIV 1 2 3
  if (calculCompteurQuestion<=3) {
    for (int i=1; i<10; i++) {
      boutonSelect[i]=currentCase[pave123[i-1]];
    }
    boutonSelect[10]=currentCase[10];
    boutonSelect[0]=currentCase[11];
    boutonSelect[11]=currentCase[12];
  }
  // NIV 4 5
  if (calculCompteurQuestion==4 || calculCompteurQuestion==5) {
    for (int i=0; i<10; i++) {
      boutonSelect[i]=currentCase[i];
    }
    boutonSelect[10]=currentCase[10];
    boutonSelect[0]=currentCase[11];
    boutonSelect[11]=currentCase[12];
  }

  // NIV 6 7

  // NIV 8

  // NIV 9

  // NIV 10 omagad comment ça va être compliqué
}

void boutonDELOK() {
  if (boutonSelect[10]==true) {
    reponseEntree="0.";
  }
  if (boutonSelect[11]==true) {
    testReponseSaisie=true;
  }
}

void calculSuivantOK() { // FONCTIONNEL OK
  if (calculSuivantOK==true ) {
    calculSuivantOK = false;
    testReponseSaisie = false;
    calculCompteurQuestion+=1;
    ecranCalculCouleur = reponseViergeCouleur;
    calculBon = false;
    calculMauvais = false;
  }
  if (calculCompteurQuestion == 0) {
    calculSuivantOK = false;
    testReponseSaisie = false;
    ecranCalculCouleur = reponseViergeCouleur;
    calculBon = false;
    calculMauvais = false;
  }
}

void calculrapideJSON() {
  calculrapideJSON = loadJSONArray("calculrapide.json");
  JSONArray donneesEnonce = calculrapideJSON.getJSONArray(0);
  JSONObject objetEnonce = donneesEnonce.getJSONObject(calculCompteurQuestion);
  calculEnonce= objetEnonce.getString("enonce");
  calculSolution= objetEnonce.getString("solution");

  JSONArray donneesCase = calculrapideJSON.getJSONArray(1);
  JSONObject objetCase = donneesCase.getJSONObject(numeroCase);
  borneInfX[numeroCase-1] = objetCase.getInt("infx"); 
  borneSupX[numeroCase-1] = objetCase.getInt("supx");
  borneInfY[numeroCase-1] = objetCase.getInt("infy");
  borneSupY[numeroCase-1] = objetCase.getInt("supy");
  println(borneInfX[numeroCase-1]);
}
