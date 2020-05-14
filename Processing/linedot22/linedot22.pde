int xCentreCarre, yCentreCarre;
int compteurNiveau=5;
int borneInfX, borneSupX, borneInfY, borneSupY;
int combo;
int xMoy, yMoy;
int intTpCase;
int[]  xJSON = new int[26],yJSON= new int[26];
int[][] compteurDepart = new int[6][4], compteurArrivee=new int[6][4];
String colID, liID, caseID;
String dernierMouvement;
color couleurTrait = color(255, 0, 0);
color[] couleur = {color(255, 0, 0), color(0, 255, 0), color(255, 255, 0), color(0, 0, 255)};
boolean colSelect=false, liSelect=false, carreSelect=false;
boolean mouseClicked=false;
boolean[] caseOccupee = new boolean[26];
boolean[] caseInterdite = new boolean[26];
boolean[] depart = new boolean[5];
boolean[] arrivee = new boolean[5];
JSONArray linedotJSON, donneesColonnes, donneesLignes, donneesCombo, donneesTP, donneesDepart, donneesArrivee;
JSONObject objetColonnes, objetLignes, objetCombo, objetTP, objetDepart,objetArrivee;

void setup() {
  size(800, 600);
  setup22();
}

void draw() {
  draw22();
  if (compteurNiveau==3) {
    //println("sauce");
  }
}

void keyPressed() {
  tracerTrait();
}

void mouseClicked() {
  mouseClicked=true;
}

void setup22() {
  background(45, 132, 138);
  linedotJSON = loadJSONArray("linedot.json");
  donneesColonnes = linedotJSON.getJSONArray(0);
  donneesLignes = linedotJSON.getJSONArray(1);
  donneesCombo = linedotJSON.getJSONArray(2);
  pointTP();
  ordrePoint();
}

void draw22() {
  if (compteurNiveau==0) {
    afficherEcranDebut21();
  }
  if (compteurNiveau>0&&compteurNiveau<6) {
    boutonEffacer();
    rejoins();
    afficherPoints();
    verificationPoint();
    fill(189, 227, 64);
    rect(40, 20, 67, 45);
    fill(0);
    text("Lvl."+compteurNiveau, 50, 50);
    testFil();
  }
  if (compteurNiveau==6) {
  }
}

void allArriveeFalse() {
  arrivee[0]=false;
  arrivee[1]=false;
  arrivee[2]=false;
  arrivee[3]=false;
}

void allDepartFalse() {
  depart[0]=true;
  depart[1]=false;
  depart[2]=false;
  depart[3]=false;
  xCentreCarre=xJSON[compteurDepart[compteurNiveau][0]];
  yCentreCarre=yJSON[compteurDepart[compteurNiveau][0]];
}

void afficherEcranDebut21() {
  background(45, 132, 138);
  fill(0);
  textSize(40);
  textAlign(CENTER);
  text("2-1", width/2, 100);
  textSize(60);
  text("Line Dot", width/2, 170);
  stroke(0);
  strokeWeight(6);
  fill(255);
  rect(100, 200, 600, 250);
  fill(0);
  textSize(27);
  textAlign(LEFT);
  text("Ici, tu dois relier des points de couleurs\nprésents sur le quadrillage. Interdit \nde repasser sur un trait déjà fait.\nUtilise les 4 flèches directionnelles du\nclavier pour te déplacer. ", 140, 250);
  fill(200, 200, 255);
  rect(620, 510, 160, 60);
  fill(0);
  text("Let's Go~", 640, 549);
  if (mousePressed&&mouseX>620&&mouseX<780&&mouseY>510&&mouseY<570) {
    compteurNiveau=1;
  }
}

void afficherQuadrillage() {
  fill(255);
  stroke(0);
  strokeWeight(3);
  rect(200, 100, 400, 400);
  for (int i=180; i<421; i=i+80) {
    line(200, i, 600, i);
  }
  for (int i=280; i<521; i=i+80) {
    line(i, 100, i, 500);
  }
}

void departNiveau() {
  couleurTrait=couleur[0];
  depart[0]=true;
  allDepartFalse();
  allArriveeFalse();
  if (compteurNiveau!=3) {
    xCentreCarre=240;
    yCentreCarre=140;
  } else {
    xCentreCarre=480;
    yCentreCarre=140;
  }
}

void boutonEffacer() {
  // BOX
  stroke(0);
  strokeWeight(2);
  fill(200, 200, 255);
  rect(620, 510, 160, 60);
  // TEXTE
  textSize(30);
  fill(0);
  if (arrivee[3]==false) {
    text("Rejouer..", 640, 550);
  } else {
    text("Suivant !", 640, 550);
  }


  // TEST
  if (mouseClicked==true) {
    if (mouseX>620&&mouseX<780&&mouseY>510&&mouseY<570) {
      afficherQuadrillage();
      dernierMouvement="";
      allDepartFalse();
      allArriveeFalse();
      if (arrivee[3]==false) {
        //print("Niveau reset ");
        background(155, 155, 0);
        afficherQuadrillage();
        afficherPoints();
        departNiveau();
        mouseClicked=false;
        // ARRIVEE
      } else {
        compteurNiveau++;
      }
    }
  }
}

// MESSAGE REJOINS
void rejoins() {
  fill(189, 227, 64);
  noStroke();
  rect(30, 367, 165, 55);
  fill(0);
  textSize(20);
  if (couleurTrait==couleur[0]) {
    fill(couleur[0]);
    text("rejoins le rouge", 40, 400);
  }
  if (couleurTrait==couleur[1]) {
    fill(couleur[1]);
    text("rejoins le vert", 40, 400);
  }
  if (couleurTrait==couleur[2]) {
    fill(couleur[2]);
    text("rejoins le jaune", 40, 400);
  }
  if (couleurTrait==couleur[3]) {
    fill(couleur[3]);
    text("rejoins le bleu", 40, 400);
  }
  if (arrivee[3]==true) {
    fill(0);
    text("finiiii", 60, 400);
  }
}
