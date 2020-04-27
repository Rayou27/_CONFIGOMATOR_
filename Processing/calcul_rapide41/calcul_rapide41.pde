int calculCompteurQuestion = 0;
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

boolean niveauTermine41 = false;
boolean reponseSaisie = false;
boolean calculBon, calculMauvais;
boolean calculSuivantOK;

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
  //calculrapideJSON(); QUAND çA REMARCHERA...
}

void mousePressed41() {
  // TEST LANCER NIVEAU
  if (calculCompteurQuestion==0 && mouseX > 570 && mouseX < 740 && mouseY > 520 && mouseY < 570) {
    calculSuivantOK=true;
  }
  // TEST BOUTON SUIVANT
  if (calculCompteurQuestion!=11 && reponseSaisie==true 
    && mouseX > 0 && mouseX < 0 && mouseY > 0 && mouseY < 0) {
    calculSuivantOK=true;
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
          if (calculCompteurQuestion>=4 && calculCompteurQuestion<=5) {
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
  }
}

void calculSuivantOK() { // FONCTIONNEL OK
  if (calculSuivantOK==true ) {
    calculSuivantOK = false;
    reponseSaisie = false;
    calculCompteurQuestion+=1;
    ecranCalculCouleur = reponseViergeCouleur;
    calculBon = false;
    calculMauvais = false;
  }
  if (calculCompteurQuestion == 0) {
    calculSuivantOK = false;
    reponseSaisie = false;
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
