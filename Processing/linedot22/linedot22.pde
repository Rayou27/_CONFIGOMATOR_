int xCentreCarre, yCentreCarre;
int compteurNiveau=0;
int borneInfX, borneSupX, borneInfY, borneSupY;
int combo;
int xMoy, yMoy;
int intTpCase;
int[]  xJSON = new int[26],yJSON= new int[26];
String colID, liID, caseID;
String dernierMouvement;
color couleurTrait = color(0, 0, 255), couleurEffacer=color(100, 0, 0);
color rouge=color(255, 0, 0), vert=color(0, 255, 0), jaune=color(255, 220, 0), bleu=color(0, 0, 255);
boolean colSelect=false, liSelect=false, carreSelect=false;
boolean rougeDepart=false, vertDepart=false, jauneDepart=false, bleuDepart=false;
boolean rougeArrivee=false, vertArrivee=false, jauneArrivee=false, bleuArrivee=false, mouseClicked=false;
boolean[] caseOccupee = new boolean[26];
boolean[] caseInterdite = new boolean[26];
JSONArray linedotJSON, donneesColonnes, donneesLignes, donneesCombo, donneesTP;
JSONObject objetColonnes, objetLignes, objetCombo, objetTP;

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
void setup22() {
  
  background(155, 155, 0);
  linedotJSON = loadJSONArray("linedot.json");
  donneesColonnes = linedotJSON.getJSONArray(0);
  donneesLignes = linedotJSON.getJSONArray(1);
  donneesCombo = linedotJSON.getJSONArray(2);
  donneesTP= linedotJSON.getJSONArray(3);
  pointTP();
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
  rougeArrivee=false;
  vertArrivee=false;
  jauneArrivee=false;
  bleuArrivee=false;
}

void allDepartFalse() {
  rougeDepart=true;
  vertDepart=false;
  jauneDepart=false;
  bleuDepart=false;
}

void afficherEcranDebut21() {
  background(155, 155, 0);
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
  rect(200, 100, 400, 400);
  stroke(0);
  strokeWeight(2);
  for (int i=100; i<570; i=i+80) {
    line(200, i, 600, i);
  }
  for (int i=200; i<650; i=i+80) {
    line(i, 100, i, 500);
  }
}

void departNiveau() {
  couleurTrait=rouge;
  rougeDepart=true;
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

void mouseClicked() {
  mouseClicked=true;
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
  if (bleuArrivee==false) {
    text("Rejouer..", 640, 550);
  } else {
    text("Suivant !", 640, 550);
  }


  // TEST
  if (mouseClicked==true) {
    if (mouseX>620&&mouseX<780&&mouseY>510&&mouseY<570) {
      dernierMouvement="";
      allDepartFalse();
      allArriveeFalse();
      if (bleuArrivee==false) {
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
  if (couleurTrait==rouge) {
    fill(rouge);
    text("rejoins le rouge", 40, 400);
  }
  if (couleurTrait==vert) {
    fill(vert);
    text("rejoins le vert", 40, 400);
  }
  if (couleurTrait==jaune) {
    fill(jaune);
    text("rejoins le jaune", 40, 400);
  }
  if (couleurTrait==bleu) {
    fill(bleu);
    text("rejoins le bleu", 40, 400);
  }
  if (bleuArrivee==true) {
    fill(0);
    text("finiiii", 60, 400);
  }
}
