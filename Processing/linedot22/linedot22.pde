int xCentreCarre, yCentreCarre;
int compteurNiveau=1;
int borneInfX, borneSupX, borneInfY, borneSupY;
int combo;
int xMoy, yMoy;
int intTpCase;
int[]  xJSON = new int[26], yJSON= new int[26];
int[][] compteurDepart = new int[6][4], compteurArrivee=new int[6][4];
String colID, liID, caseID;
String dernierMouvement;
color couleurTrait = color(255, 0, 0);
color[] couleur = {color(255, 20, 20), color(0, 220, 0), color(255, 220, 0), color(0, 0, 220)};
boolean colSelect=false, liSelect=false, carreSelect=false;
boolean mouseClickedBoutonEffacer=false;
boolean[] caseOccupee = new boolean[26];
boolean[] caseInterdite = new boolean[26];
boolean[] depart = new boolean[5];
boolean[] arrivee = new boolean[5];
JSONArray linedotJSON, donneesColonnes, donneesLignes, donneesCombo, donneesTP, donneesDepart, donneesArrivee;
JSONObject objetColonnes, objetLignes, objetCombo, objetTP, objetDepart, objetArrivee;

void setup() {
  size(800, 600);
  setup22();
}
void draw() {
  draw22();
}
void keyPressed() {
  tracerTrait();
}
void mouseClicked() {
  if (mouseX>620&&mouseX<780&&mouseY>510&&mouseY<570) {
    mouseClickedBoutonEffacer=true;
  }

  for (int i=0; i<=3; i++) {
    println("Arrivée "+i+" "+arrivee[i]);
  }
  println("");
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
    //if (mouseClickedBoutonEffacer==false) {
    verificationPoint();
    afficherPoints();
    testFil();
    //}
    boutonEffacer();
    fill(255);
    noStroke();
    rect(40, 20, 80, 45);
    fill(0);
    textSize(25);
    text("Lvl."+compteurNiveau, 55, 50);
    rejoins();
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
  // FONCTIONNEL
  if (mouseClickedBoutonEffacer==true) {
    for (int i=0; i<=4; i++) {
      depart[i]=false;
      arrivee[i]=false;
    }
    afficherQuadrillage();
    departNiveau();
    mouseClickedBoutonEffacer=false;
  }
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
  xCentreCarre=xJSON[compteurDepart[compteurNiveau][0]];
  yCentreCarre=yJSON[compteurDepart[compteurNiveau][0]];
}

void afficherPoints() {
  if (compteurNiveau>0&&compteurNiveau<6) {
    // NIVEAU 1
    for (int i=0; i<4; i++) {
      // POINTS DE DEPART
      if (depart[i]==true) {
        stroke(0);
        strokeWeight(3);
        fill(couleur[i]);
        ellipse(xJSON[compteurDepart[compteurNiveau][i]], yJSON[compteurDepart[compteurNiveau][i]], 40, 40);
      } else {
        noStroke();
        fill(couleur[i]);
        ellipse(xJSON[compteurDepart[compteurNiveau][i]], yJSON[compteurDepart[compteurNiveau][i]], 40, 40);
      }
      // POINTS D'ARRIVEE
      int d;
      noStroke();
      if (arrivee[i]==true) {
        d=40;
        fill(couleur[i]);
        noStroke();
        ellipse(xJSON[compteurArrivee[compteurNiveau][i]], yJSON[compteurArrivee[compteurNiveau][i]], d, d);
        stroke(150);
        strokeWeight(4);
        noFill();
        ellipse(xJSON[compteurDepart[compteurNiveau][i]], yJSON[compteurDepart[compteurNiveau][i]], 40, 40);
      } else {
        d=20;
        fill(couleur[i]);
        noStroke();
        ellipse(xJSON[compteurArrivee[compteurNiveau][i]], yJSON[compteurArrivee[compteurNiveau][i]], d, d);
      }
    }
  }
}

void tracerTrait() {
  if (key==CODED&&arrivee[3]==false) {
    strokeWeight(6);
    // TEST TRACER
    // HAUT
    if (dernierMouvement!="DOWN"&&keyCode==UP&&yCentreCarre>140&&(get(xCentreCarre, yCentreCarre-80)==color(255)
      ||get(xCentreCarre, yCentreCarre-71)==couleurTrait)) {
      stroke(couleurTrait);
      line(xCentreCarre, yCentreCarre, xCentreCarre, yCentreCarre-80);
      println("up");
      yCentreCarre=yCentreCarre-80;
      dernierMouvement="UP";
    }
    // BAS
    if (dernierMouvement!="UP"&&keyCode==DOWN&& yCentreCarre<=420&&(get(xCentreCarre, yCentreCarre+80)==color(255)
      ||get(xCentreCarre, yCentreCarre+71)==couleurTrait)) {
      stroke(couleurTrait);
      line(xCentreCarre, yCentreCarre, xCentreCarre, yCentreCarre+80);
      println("down");
      yCentreCarre=yCentreCarre+80;
      dernierMouvement="DOWN";
    } 
    // GAUCHE
    if (dernierMouvement!="RIGHT"&&keyCode==LEFT&&xCentreCarre>240&&(get(xCentreCarre-80, yCentreCarre)==color(255)
      ||get(xCentreCarre-71, yCentreCarre)==couleurTrait)) {
      stroke(couleurTrait);
      line(xCentreCarre, yCentreCarre, xCentreCarre-80, yCentreCarre);
      println("left");
      xCentreCarre=xCentreCarre-80;
      dernierMouvement="LEFT";
    }   
    // DROITE  
    if (dernierMouvement!="LEFT"&&keyCode==RIGHT&& xCentreCarre<=520&&(get(xCentreCarre+80, yCentreCarre)==color(255)
      ||get(xCentreCarre+71, yCentreCarre)==couleurTrait)) {
      stroke(couleurTrait);
      line(xCentreCarre, yCentreCarre, xCentreCarre+80, yCentreCarre);
      xCentreCarre=xCentreCarre+80;
      println("right");
      dernierMouvement="RIGHT";
    }
  }
}

// MESSAGE REJOINS
void rejoins() {
  fill(255);
  noStroke();
  rect(30, 367, 165, 55);
  fill(0);
  textSize(20);
  String nomCouleur="rouge";
  String[] baseCouleur={"rouge", "vert", "jaune", "bleu"};
  for (int i=0; i<=3; i++) {
    if (couleurTrait==couleur[i]) {
      nomCouleur=baseCouleur[i];
      textSize(13);
      fill(couleur[i]);
      text("Rejoins la couleur "+nomCouleur, 40, 400);
    }
    if (arrivee[3]==true) {
      fill(0);
      text("finiiii", 60, 400);
    }
  }
}

void verificationPoint() {
  for (int i=0; i<=3; i++) {
    if (caseOccupee[compteurArrivee[compteurNiveau][i]]==true&&couleurTrait==couleur[i]&&i<3) {
      arrivee[i]=true;
      xCentreCarre=xJSON[compteurDepart[compteurNiveau][i+1]];
      yCentreCarre=yJSON[compteurDepart[compteurNiveau][i+1]];
      depart[i]=false;
      depart[i+1]=true;
      couleurTrait=couleur[i+1];
    }
    if (caseOccupee[compteurArrivee[compteurNiveau][i]]==true&&couleurTrait==couleur[i]&&i==3) {
      depart[i]=false;
      arrivee[i]=true;
      couleurTrait=color(0);
    }
  }
}

void testFil() {

  for (int i=1; i<=5; i++) {
    for (int j=1; j<=5; j++) {
      objetColonnes = donneesColonnes.getJSONObject(j);
      objetLignes = donneesLignes.getJSONObject(i);
      objetCombo = donneesCombo.getJSONObject(0);
      borneInfX=objetColonnes.getInt("x1");
      borneSupX=objetColonnes.getInt("x2");
      colID= objetColonnes.getString("id");
      borneInfY=objetLignes.getInt("y1");
      borneSupY=objetLignes.getInt("y2");
      liID= objetLignes.getString("id");
      caseID = colID+ " " + liID;
      combo = objetCombo.getInt(caseID);
      xMoy=(borneInfX+borneSupX)/2;
      yMoy=(borneInfY+borneSupY)/2;
      if (xMoy==xCentreCarre&&yMoy==yCentreCarre) {
        caseOccupee[combo]=true;
        /*print("case " +combo + " ");
         println(caseOccupee[combo]);*/
      }
    }
  }
}
void pointTP() {
  donneesTP= linedotJSON.getJSONArray(3);
  for (int i=1; i<=25; i++) {
    objetTP=donneesTP.getJSONObject(i);
    xJSON[i]=objetTP.getInt("xCentre");
    yJSON[i]=objetTP.getInt("yCentre");
    //println("Carré "+i+"\t x: "+xJSON[i]+"\t y :"+yJSON[i]);
  }
}

void ordrePoint() {
  donneesDepart=linedotJSON.getJSONArray(4);
  donneesArrivee=linedotJSON.getJSONArray(5);
  for (int g=1; g<=5; g++) {
    //println("niveau "+g);
    for (int i=0; i<=3; i++) {
      objetDepart=donneesDepart.getJSONObject(g);
      compteurDepart[g][i]=objetDepart.getInt(str(i));
      objetArrivee=donneesArrivee.getJSONObject(g);
      compteurArrivee[g][i]=objetArrivee.getInt(str(i));
      //print(" depart : "+compteurDepart[g][i]+" arrivée : "+compteurArrivee[g][i]+"\n");
    }
  }
}
