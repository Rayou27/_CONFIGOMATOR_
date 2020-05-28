int compteurNiveau22=0;
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
color couleurTrait = color(255, 0, 0), couleurMur=color(79, 43, 111), couleurQuadrillage=color(247, 229, 211);
color[] couleur = {color(255, 20, 20), color(0, 220, 0), color(255, 127, 17), color(0, 0, 220)};
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
  reglesImg[4]=loadImage("data22/regles22.png");
  niveauImg[4]=loadImage("data22/level22.png");
  finImg[4]=loadImage("data22/fin22.png");
  linedotJSON = loadJSONArray("data22/linedot.json");
  pointTP();
  ordrePoint();
  ordreMur();
}

void draw22() {
  if (compteurNiveau22==0) {
    afficherEcranDebut22();
  }
  if (compteurNiveau22>0&&compteurNiveau22<11) {
    verificationPoint();
    afficherPoints();
    boutonEffacer();
    afficherMurs();
    fill(162, 175, 200);
    stroke(0, 48, 73);
    strokeWeight(6);
    rect(39, 211, 119, 60, 60);
    rect(39, 311, 119, 60, 60);
    fill(0);
    textAlign(CENTER);
    textFont(pixel);
    textSize(50);
    text(compteurNiveau22, 99, 255);
    text(compteurReplay22-compteurNiveau22, 99, 355);
    rejoins();
  }
  if (compteurNiveau22==11) {
    argent22();
    afficherEcranFin22();
  }
}

void keyPressed22() {
  if (compteurGlobalNiveaux==4) {
    tracerTrait();
    testFil();
    if (key==' ') {
      mouseClickedBoutonEffacer=true;
    }
  }
}

void mouseClicked22() {
  if (mouseX>430&&mouseX<680&&mouseY>450&&mouseY<530&&compteurNiveau22==0) {
    compteurNiveau22=1;
    mouseClickedBoutonEffacer=true;
  }
  if (mouseX>63&&mouseX<133&&mouseY>430&&mouseY<500&&compteurNiveau22!=0&&compteurNiveau22!=11) {
    mouseClickedBoutonEffacer=true;
  }
  if(mouseX>588&&mouseX<676&&mouseY>438&&mouseY<520&&compteurNiveau22==11){
    niveauTermine[4]=true;
  }
}

void tracerTrait() {
  if (key==CODED&&arrivee[3]==false) {
    strokeWeight(6);
    // TEST TRACER
    // haut
    if (dernierMouvement!="DOWN" // pour empêcher de revenir sur ses pas
      &&keyCode==UP&&yCentreCarre>140 // pour dessiner seulement dans le carré blanc
      &&(get(xCentreCarre, yCentreCarre-80)==couleurQuadrillage // que la destination du trait soit une case blanche...
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
      &&(get(xCentreCarre, yCentreCarre+80)==couleurQuadrillage
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
      &&(get(xCentreCarre-80, yCentreCarre)==couleurQuadrillage
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
      &&(get(xCentreCarre+80, yCentreCarre)==couleurQuadrillage
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
  image(reglesImg[compteurGlobalNiveaux], 0, 0);
  textAlign(CENTER);
  textFont(meteora);
  fill(0);
  textSize(24);
  text("Ici, tu dois relier des points de couleurs\nprésents sur le quadrillage. Interdit \nde repasser sur un trait déjà fait.\nUtilise les quatre flèches directionnelles du\nclavier pour te déplacer.\nTu ne peux pas traverser les murs...", width/2, 220);
  int letsgoHover22=0;
  if (mouseX>430&&mouseX<680&&mouseY>450&&mouseY<530) {
    letsgoHover22=10;
    fill(hover);
  } else {
    letsgoHover22=30;
    fill(neutre);
  }
  stroke(0, 48, 73);
  strokeWeight(4);
  rect(430, 450, 250, 80, letsgoHover22);
  fill(0); // fill le texte en hover aussi /!\
  textSize(35);
  text("Let's Go !!", 557, 503);
}

void afficherQuadrillage() {
  image(niveauImg[compteurGlobalNiveaux], 0, 0);
  fill(247, 229, 211);
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
  for (int i=1; i<=nombreMurHorizontal[compteurNiveau22]; i++) {

    line(
      xJSON[murHorizontal[compteurNiveau22][i]]-40, 
      yJSON[murHorizontal[compteurNiveau22][i]]+40, 
      xJSON[murHorizontal[compteurNiveau22][i]]+40, 
      yJSON[murHorizontal[compteurNiveau22][i]]+40);
  }
  for (int i=1; i<=nombreMurVertical[compteurNiveau22]; i++) {
    line(
      xJSON[murVertical[compteurNiveau22][i]]+40, 
      yJSON[murVertical[compteurNiveau22][i]]-40, 
      xJSON[murVertical[compteurNiveau22][i]]+40, 
      yJSON[murVertical[compteurNiveau22][i]]+40);
  }
}

void afficherEcranFin22() {
  image(finImg[compteurGlobalNiveaux], 0, 0);
  fill(0);
  textFont(meteora);
  textSize(27);
  textAlign(CENTER);
  text("Bravo, tu en as enfin fini avec cette\nbouillabaisse de fils colorés !!!\nVoyons l'argent que tu as remporté\ngrâce à cette épreuve...", width/2, 185);
  textAlign(LEFT);
  textSize(22);
  text("Nombre de replay : ", 130, 405);
  text("  replay = ", 130, 470);
  textFont(pixel);
  textSize(50);
  textAlign(CENTER);
  text(argent22+" $", 575, 410);
  text(compteurReplay22, 250, 440);
  textSize(35);
  text(1, 135, 472);
  text("-750 $", 300, 472);
  int homeHover22=20;
  color neutre22=color(252, 191, 73), hover22=color(240, 159, 4);
  if (mouseX>588&&mouseX<676&&mouseY>438&&mouseY<520) {
    homeHover22=20;
    fill(hover22);
  } else {
    homeHover22=60;
    fill(neutre22);
  }
  stroke(0);
  strokeWeight(4);
  rect(588, 438, 88, 82, homeHover22);
  fill(0);
  textSize(60);
  textFont(arial);
  textAlign(CENTER);
  text("⌂", 633, 490);
  textFont(meteora);
  if (niveauTermine[4]==true) {
    affichageEcran[4]=false;
    affichageEcranPrincipal=true;
    affichageEcranPrincipal();
  }
}

public int argent22() {
  argent22=0;
  argent22+=50000-750*(compteurReplay22-11);
  return argent22;
}

void afficherPoints() {
  if (compteurNiveau22>0&&compteurNiveau22<11) {
    // NIVEAU 1
    for (int i=0; i<4; i++) {
      // POINTS DE DEPART
      if (depart[i]==true) {
        stroke(0);
        strokeWeight(3);
        fill(couleur[i]);
      } else {
        noStroke();
        fill(couleur[i]);
      }
      ellipse(xJSON[billeDepart[compteurNiveau22][i]], yJSON[billeDepart[compteurNiveau22][i]], 40, 40);
      // POINTS D'ARRIVEE
      int d;
      noStroke();
      if (arrivee[i]==true) {
        d=40;
        fill(couleur[i]);
        noStroke();
        ellipse(xJSON[billeArrivee[compteurNiveau22][i]], yJSON[billeArrivee[compteurNiveau22][i]], d, d);
        stroke(150);
        strokeWeight(4);
        noFill();
        ellipse(xJSON[billeDepart[compteurNiveau22][i]], yJSON[billeDepart[compteurNiveau22][i]], 40, 40);
      } else {
        d=20;
        fill(couleur[i]);
        noStroke();
        ellipse(xJSON[billeArrivee[compteurNiveau22][i]], yJSON[billeArrivee[compteurNiveau22][i]], d, d);
      }
    }
  }
}

void verificationPoint() {
  for (int i=0; i<=3; i++) {
    if (caseOccupee[billeArrivee[compteurNiveau22][i]]==true&&couleurTrait==couleur[i]&&i<3) {
      arrivee[i]=true;
      xCentreCarre=xJSON[billeDepart[compteurNiveau22][i+1]];
      yCentreCarre=yJSON[billeDepart[compteurNiveau22][i+1]];
      depart[i]=false;
      dernierMouvement="";
      depart[i+1]=true;
      couleurTrait=couleur[i+1];
    }
    if (caseOccupee[billeArrivee[compteurNiveau22][i]]==true&&couleurTrait==couleur[i]&&i==3) {
      depart[i]=false;
      arrivee[i]=true;
      couleurTrait=color(0);
    }
  }
}

void boutonEffacer() {
  // BOX
  noStroke();
  fill(173, 182, 196);
  rect(60, 427, 90, 80);
  int suivHover22=30;
  if (mouseX>63&&mouseX<133&&mouseY>430&&mouseY<500) {
    suivHover22=10;
    fill(hover);
  } else {
    suivHover22=30;
    fill(neutre);
  }
  stroke(0, 48, 73);
  strokeWeight(5);
  rect(63, 430, 70, 70, suivHover22);
  fill(0);
  String suiv22="";
  int x=99;
  textFont(meteora);
  if (arrivee[3]==true) {
    if (compteurNiveau22==10) {
      suiv22="Fin";
      textSize(27);
      x=99;
    } else {
      suiv22=">>";
      textSize(30);
      x=99;
    }
  } else {
    image(replay, 78, 448);
  }
  text(suiv22, x, 475);

  // FONCTIONNEL
  if (mouseClickedBoutonEffacer==true) {
    if (arrivee[3]==true) {
      compteurNiveau22++;
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
    xCentreCarre=xJSON[billeDepart[compteurNiveau22][0]];
    yCentreCarre=yJSON[billeDepart[compteurNiveau22][0]];
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
  noStroke();
  fill(173, 182, 196);
  rect(610, 130, 90, 327);
  for (int i=0; i<=3; i++) {
    if (couleurTrait==couleur[i]) {
      int y;
      switch(i) {
      case 0:
        y=180;
        break;
      case 1:
        y=270;
        break;
      case 2:
        y=360;
        break;        
      case 3:
        y=450;
        break;
      default:
        y=180;
        break;
      }
      textFont(arial);
      textSize(60);
      textAlign(LEFT);
      fill(couleur[i]);
      text(fleche, 630, y);
    }
    if (arrivee[3]==true) {
      image(valide, 700, 500, 50, 50);
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
