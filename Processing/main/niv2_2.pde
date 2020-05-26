int compteurNiveau=0;
int compteurReplay22=0, argent22=0;
int xCentreCarre, yCentreCarre;
int borneInfX22, borneSupX22, borneInfY22, borneSupY22;
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
color boutonNeutre=color(200, 200, 255);
color couleurBouton;
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
  
void setup22() {
  background(45, 132, 138);
  linedotJSON = loadJSONArray("data22/linedot.json");
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

void keyPressed22() {
  tracerTrait();
  testFil();
  if (key==' ') {
    mouseClickedBoutonEffacer=true;
  }
}

void mouseClicked22() {
  if (mouseX>620&&mouseX<780&&mouseY>510&&mouseY<570) {
    mouseClickedBoutonEffacer=true;
  }
  for (int i=0; i<=3; i++) {
  }
}

void tracerTrait() {
  if (key==CODED&&arrivee[3]==false) {
    strokeWeight(6);
    // TEST TRACER
    // haut
    if (dernierMouvement!="DOWN" // pour empêcher de revenir sur ses pas
      &&keyCode==UP&&yCentreCarre>140 // pour dessiner seulement dans le carré blanc
      &&(get(xCentreCarre, yCentreCarre-80)==color(255) // que la destination du trait soit une case blanche...
      ||get(xCentreCarre, yCentreCarre-71)==couleurTrait) // ...ou le point d'arrivée de la couleur en question
      &&get(xCentreCarre, yCentreCarre-40)!=couleurMur) { // et qu'il n'y ait pas un mur sur le passage
      stroke(couleurTrait);
      line(xCentreCarre, yCentreCarre, xCentreCarre, yCentreCarre-80); // dessiner une ligne du point actuel vers 80px en haut
      //println("up");
      yCentreCarre=yCentreCarre-80; // mise à jour des coordonnées du point actuel
      dernierMouvement="UP"; // emêcher de faire le mouvement "down" au prochain mouvement, etc.
    }
    // BAS
    if (dernierMouvement!="UP"
      &&keyCode==DOWN&& yCentreCarre<=420
      &&(get(xCentreCarre, yCentreCarre+80)==color(255)
      ||get(xCentreCarre, yCentreCarre+71)==couleurTrait)
      &&get(xCentreCarre, yCentreCarre+40)!=couleurMur) {
      stroke(couleurTrait);
      line(xCentreCarre, yCentreCarre, xCentreCarre, yCentreCarre+80);
      //println("down");
      yCentreCarre=yCentreCarre+80;
      dernierMouvement="DOWN";
    } 
    // GAUCHE
    if (dernierMouvement!="RIGHT"
      &&keyCode==LEFT&&xCentreCarre>240
      &&(get(xCentreCarre-80, yCentreCarre)==color(255)
      ||get(xCentreCarre-71, yCentreCarre)==couleurTrait)
      &&get(xCentreCarre-40, yCentreCarre)!=couleurMur) {
      stroke(couleurTrait);
      line(xCentreCarre, yCentreCarre, xCentreCarre-80, yCentreCarre);
      //println("left");
      xCentreCarre=xCentreCarre-80;
      dernierMouvement="LEFT";
    }   
    // DROITE  
    if (dernierMouvement!="LEFT"
      &&keyCode==RIGHT&& xCentreCarre<=520
      &&(get(xCentreCarre+80, yCentreCarre)==color(255)
      ||get(xCentreCarre+71, yCentreCarre)==couleurTrait)
      &&get(xCentreCarre+40, yCentreCarre)!=couleurMur) {
      stroke(couleurTrait);
      line(xCentreCarre, yCentreCarre, xCentreCarre+80, yCentreCarre);
      xCentreCarre=xCentreCarre+80;
      //println("right");
      dernierMouvement="RIGHT";
    }
  }
}

void afficherEcranDebut22() {
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
  if (mouseClickedBoutonEffacer==true) {
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

void afficherMurs() {
  stroke(couleurMur);
  strokeWeight(10);
  for (int i=1; i<=nombreMurHorizontal[compteurNiveau]; i++) {

    line(
      xJSON[murHorizontal[compteurNiveau][i]]-40, 
      yJSON[murHorizontal[compteurNiveau][i]]+40, 
      xJSON[murHorizontal[compteurNiveau][i]]+40, 
      yJSON[murHorizontal[compteurNiveau][i]]+40);
  }
  for (int i=1; i<=nombreMurVertical[compteurNiveau]; i++) {
    line(
      xJSON[murVertical[compteurNiveau][i]]+40, 
      yJSON[murVertical[compteurNiveau][i]]-40, 
      xJSON[murVertical[compteurNiveau][i]]+40, 
      yJSON[murVertical[compteurNiveau][i]]+40);
  }
}

void afficherEcranFin22(){
  background(45, 132, 138);
  stroke(0);
  strokeWeight(6);
  fill(255);
  rect(100, 50, 600, 250);
  rect(100, 330, 370, 150);
  rect(500, 360, 200, 120);
  fill(0);
  textSize(27);
  textAlign(LEFT);
  text("Bravo, tu en as enfin fini avec cette\nbouillabaisse de fils colorés !!!\nVoyons l'argent que tu as remporté\ngrâce à cette épreuve...",150,120);
  fill(200, 200, 255);
  rect(620, 510, 160, 60);
  fill(0);
  text(fleche+" Garage", 640, 549);
  text("Nombre de replay : "+(compteurReplay22-11), 130, 380);
  text("1 replay = -750$ ", 130, 430);
  text("TOTAL", 550, 400);
  text(argent22+" $", 550, 440);
  textSize(20);
}

public int argent22() {
  argent22=0;
  argent22+=50000-750*(compteurReplay22-11);
  return argent22;
}

void afficherPoints() {
  smooth(8);
  if (compteurNiveau>0&&compteurNiveau<11) {
    // NIVEAU 1
    for (int i=0; i<4; i++) {
      // POINTS DE DEPART
      if (depart[i]==true) {
        stroke(0);
        strokeWeight(3);
        fill(couleur[i]);
        ellipse(xJSON[billeDepart[compteurNiveau][i]], yJSON[billeDepart[compteurNiveau][i]], 40, 40);
      } else {
        noStroke();
        fill(couleur[i]);
        ellipse(xJSON[billeDepart[compteurNiveau][i]], yJSON[billeDepart[compteurNiveau][i]], 40, 40);
      }
      // POINTS D'ARRIVEE
      int d;
      noStroke();
      if (arrivee[i]==true) {
        d=40;
        fill(couleur[i]);
        noStroke();
        ellipse(xJSON[billeArrivee[compteurNiveau][i]], yJSON[billeArrivee[compteurNiveau][i]], d, d);
        stroke(150);
        strokeWeight(4);
        noFill();
        ellipse(xJSON[billeDepart[compteurNiveau][i]], yJSON[billeDepart[compteurNiveau][i]], 40, 40);
      } else {
        d=20;
        fill(couleur[i]);
        noStroke();
        ellipse(xJSON[billeArrivee[compteurNiveau][i]], yJSON[billeArrivee[compteurNiveau][i]], d, d);
      }
    }
  }
  noSmooth();
}

void verificationPoint() {
  for (int i=0; i<=3; i++) {
    if (caseOccupee[billeArrivee[compteurNiveau][i]]==true&&couleurTrait==couleur[i]&&i<3) {
      arrivee[i]=true;
      xCentreCarre=xJSON[billeDepart[compteurNiveau][i+1]];
      yCentreCarre=yJSON[billeDepart[compteurNiveau][i+1]];
      depart[i]=false;
      dernierMouvement="";
      depart[i+1]=true;
      couleurTrait=couleur[i+1];
    }
    if (caseOccupee[billeArrivee[compteurNiveau][i]]==true&&couleurTrait==couleur[i]&&i==3) {
      depart[i]=false;
      arrivee[i]=true;
      couleurTrait=color(0);
    }
  }
}

void boutonEffacer() {
  // BOX
  stroke(0);
  strokeWeight(2);
  fill(couleurBouton);
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
    if (arrivee[3]==true) {
      compteurNiveau++;
    }
    background(45, 132, 138);
    for (int i=0; i<=3; i++) {
      depart[i]=false;
      arrivee[i]=false;
    }
    for (int i=1; i<=25; i++) {
      caseOccupee[i]=false;
    }
    couleurTrait=couleur[0];
    depart[0]=true;
    xCentreCarre=xJSON[billeDepart[compteurNiveau][0]];
    yCentreCarre=yJSON[billeDepart[compteurNiveau][0]];
    afficherQuadrillage();
    afficherMurs();
    afficherPoints();
    dernierMouvement="";
    compteurReplay22++;
    mouseClickedBoutonEffacer=false;
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
      couleurBouton=couleur[1];
    } else {
      couleurBouton=boutonNeutre;
    }
  }
}

void testFil() {
  donneesColonnes = linedotJSON.getJSONArray(0);
  donneesLignes = linedotJSON.getJSONArray(1);
  donneesCombo = linedotJSON.getJSONArray(2);
  for (int i=1; i<=5; i++) {
    for (int j=1; j<=5; j++) {
      objetColonnes = donneesColonnes.getJSONObject(j);
      objetLignes = donneesLignes.getJSONObject(i);
      objetCombo = donneesCombo.getJSONObject(0);
      borneInfX22=objetColonnes.getInt("x1");
      borneSupX22=objetColonnes.getInt("x2");
      colID= objetColonnes.getString("id");
      borneInfY22=objetLignes.getInt("y1");
      borneSupY22=objetLignes.getInt("y2");
      liID= objetLignes.getString("id");
      caseID = colID+ " " + liID;
      combo = objetCombo.getInt(caseID);
      xMoy=(borneInfX22+borneSupX22)/2;
      yMoy=(borneInfY22+borneSupY22)/2;
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
  for (int g=1; g<=10; g++) {
    //println("niveau "+g);
    for (int i=0; i<=3; i++) {
      objetDepart=donneesDepart.getJSONObject(g);
      billeDepart[g][i]=objetDepart.getInt(str(i));
      objetArrivee=donneesArrivee.getJSONObject(g);
      billeArrivee[g][i]=objetArrivee.getInt(str(i));
      //print(" depart : "+billeDepart[g][i]+" arrivée : "+billeArrivee[g][i]+"\n");
    }
  }
}

void ordreMur() {
  donneesNombreMur=linedotJSON.getJSONArray(6);
  objetNombreHorizontal=donneesNombreMur.getJSONObject(0);
  objetNombreVertical=donneesNombreMur.getJSONObject(1);
  donneesHorizontal=linedotJSON.getJSONArray(7);
  donneesVertical=linedotJSON.getJSONArray(8);
  for (int g=1; g<=10; g++) {
    nombreMurHorizontal[g]=objetNombreHorizontal.getInt(str(g));
    nombreMurVertical[g]=objetNombreVertical.getInt(str(g));
    /*println("Niveau : "+g+"\n\tNombre de murs : "+nombreMurHorizontal[g]
     +"(H) "+nombreMurVertical[g]+"(V)\n\tTotal : "+(nombreMurHorizontal[g]+nombreMurVertical[g]));*/
    for (int i=1; i<=nombreMurHorizontal[g]; i++) {
      objetHorizontal=donneesHorizontal.getJSONObject(g);
      murHorizontal[g][i]=objetHorizontal.getInt(str(i));
      //println("Niveau "+g+" Mur Horiz. n°"+i+" : case "+murHorizontal[g][i]);
    }
    for (int i=1; i<=nombreMurVertical[g]; i++) {
      objetVertical=donneesVertical.getJSONObject(g);
      murVertical[g][i]=objetVertical.getInt(str(i));
      //println("Niveau "+g+" Mur Vert. n°"+i+" : case "+murVertical[g][i]);
    }
  }
}
