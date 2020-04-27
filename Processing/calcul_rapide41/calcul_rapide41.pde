int calculCompteurQuestion = 8;
int calculScore=0;
int compteurCarre=0;
int[] random= new int[12];
int posAleat;
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
  //calculrapideJSON();
  afficherJeuCalculRapide();
  calculSuivantOK();
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
  if (calculCompteurQuestion>=1 && calculCompteurQuestion<=10) {
    // BOX (rectangles)
    fill(255);
    rect (400, 50, 350, 500);
    fill(200);
    rect(430, 85, 290, 80);  
    for (int y=185; y<530; y+=90) {
      for (int x=445; x<646; x+=100) {
        fill(200);
        rect(x, y, 65, 65);
        fill(0);
        textSize(35);
        compteurCarre=constrain(compteurCarre,0,12);
        compteurCarre+=1;
        if (compteurCarre<=9) {
          if (calculCompteurQuestion<=5 ) {
            text(compteurCarre, x+20, y+45);
          } 
          if (calculCompteurQuestion==6 || calculCompteurQuestion==7) {
            text(10-compteurCarre, x+20, y+45);
          } 
          if (calculCompteurQuestion==8 || calculCompteurQuestion==9) {
            random[compteurCarre]= (int)random(0, 12);
            posAleat = random[compteurCarre]-compteurCarre;
            text(posAleat, x+20, y+45);
          }
        } 
        if (compteurCarre==10) {
          textSize(25);
          text("DEL", x+10, y+45);
        } 
        if (compteurCarre==11) {
          text("0", x+20, y+45);
        } 
        if (compteurCarre==12) {
          textSize(25);
          text("OK", x+15, y+45);
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

/*void calculrapideJSON(){
 calculrapideJSON = loadJSONArray("calculrapide.json");
 JSONArray donnees = calculrapideJSON.getJSONArray(0);
 JSONObject objet = donnees.getJSONObject(calculCompteurQuestion);
 
 calculEnonce= objet.getString("enonce");
 calculSolution= objet.getString("solution");
 }*/
