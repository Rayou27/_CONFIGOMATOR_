int compteurNiveau=0;
int compteurReplay22=0, argent22=0;
int xCentreCarre, yCentreCarre;
int borneInfX, borneSupX, borneInfY, borneSupY;
int combo, xMoy, yMoy;
int[]  xJSON = new int[26], yJSON= new int[26];
int[] nombreMurHorizontal = new int[12], nombreMurVertical = new int[12];
int[][] billeDepart = new int[12][4], billeArrivee=new int[12][4];
int[][] murHorizontal = new int[12][21], murVertical=new int[12][26];
char fleche ='→';
String colID, liID, caseID;
String dernierMouvement;
color couleurTrait = color(255, 0, 0), couleurMur=color(79, 43, 111);
color[] couleur = {color(255, 20, 20), color(0, 220, 0), color(255, 220, 0), color(0, 0, 220)};
boolean colSelect=false, liSelect=false, carreSelect=false;
boolean mouseClickedBoutonEffacer=false;
boolean[] caseOccupee = new boolean[26];
boolean[] depart = new boolean[4], arrivee = new boolean[4];
JSONArray linedotJSON, donneesColonnes, donneesLignes, donneesCombo, 
  donneesTP, donneesDepart, donneesArrivee, 
  donneesNombreMur, donneesHorizontal, donneesVertical;
JSONObject objetColonnes, objetLignes, objetCombo, 
  objetTP, objetDepart, objetArrivee, 
  objetHorizontal, objetVertical, objetNombreHorizontal, objetNombreVertical;

void setup() {
  size(800, 600);
  setup22();
}
void draw() {
  draw22();
}
void keyPressed() {
  keyPressed22();
}
void mouseClicked() {
  if (mouseX>620&&mouseX<780&&mouseY>510&&mouseY<570) {
    mouseClickedBoutonEffacer=true;
  }

  for (int i=0; i<=3; i++) {
  }
}

void setup22() {
  background(45, 132, 138);
  linedotJSON = loadJSONArray("linedot.json");
  pointTP();
  ordrePoint();
  ordreMur();
}

void draw22() {
  if (compteurNiveau==0) {
    afficherEcranDebut22();
  }
  if (compteurNiveau>0&&compteurNiveau<11) {
    verificationPoint();
    afficherPoints();
    boutonEffacer();
    afficherMurs();
    
    fill(255);
    noStroke();
    rect(40, 20, 90, 45);
    fill(0);
    textSize(25);
    text("Lvl."+compteurNiveau, 55, 50);
    rejoins();
  }
  if (compteurNiveau==11) {
    argent22();
    afficherEcranFin22();
  }
}

void keyPressed22(){
  tracerTrait();
  testFil();
}
