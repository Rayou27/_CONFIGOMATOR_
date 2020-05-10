int xCentreCarre, yCentreCarre;
int compteurNiveau=0;
int borneInfX, borneSupX, borneInfY, borneSupY;
int combo;
int xMoy, yMoy;
int intTpCase;

String colID, liID, caseID;
String dernierMouvement;

color couleurTrait = color(0, 0, 255), couleurEffacer=color(100, 0, 0);
color rouge=color(255, 0, 0), vert=color(0, 255, 0), jaune=color(255, 220, 0), bleu=color(0, 0, 255);

boolean colSelect=false, liSelect=false, carreSelect=false;
boolean rougeDepart=false, vertDepart=false, jauneDepart=false, bleuDepart=false;
boolean rougeArrivee=false, vertArrivee=false, jauneArrivee=false, bleuArrivee=false;

boolean[] caseOccupee = new boolean[26];
boolean[] caseInterdite = new boolean[26];

JSONArray linedotJSON;
JSONArray donneesColonnes;
JSONArray donneesLignes;
JSONArray donneesCombo;
JSONObject objetColonnes;
JSONObject objetLignes;
JSONObject objetCombo;

void setup() {
  size(800, 600);
  background(155, 155, 0);
  if (compteurNiveau>0&&compteurNiveau<6) {
    setup22();
  }
  linedotJSON = loadJSONArray("linedot.json");
}

void draw() {
  draw22();
}


void keyPressed() {
  tracerTrait();
}
void setup22() {
  afficherQuadrillage();
  afficherPoints();
  departNiveau();
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

void afficherPoints() {
  if (compteurNiveau>0&&compteurNiveau<6) {
    // NIVEAU 1
    if (compteurNiveau==1) {
      // POINTS DE DEPART
      if (rougeDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(rouge);
        ellipse(240, 140, 40, 40); // départ rouge
      } else {
        noStroke();
        fill(rouge);
        ellipse(240, 140, 40, 40); // départ rouge
      }
      if (vertDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(vert);
        ellipse(320, 140, 40, 40);
      } else {
        noStroke();
        fill(vert);
        ellipse(320, 140, 40, 40);
      }
      if (jauneDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(jaune);
        ellipse(400, 140, 40, 40);
      } else {
        noStroke();
        fill(jaune);
        ellipse(400, 140, 40, 40);
      }
      if (bleuDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(bleu);
        ellipse(320, 300, 40, 40);
      } else {
        noStroke();
        fill(bleu);
        ellipse(320, 300, 40, 40);
      }
      // POINTS D'ARRIVEE
      int d;
      noStroke();
      if (rougeArrivee==true) {
        d=40;
        fill(rouge);
        noStroke();
        ellipse(400, 380, d, d); // arrivée rouge
        stroke(150);
        strokeWeight(4);
        ellipse(240, 140, 40, 40); // départ rouge
      } else {
        d=20;
        fill(rouge);
        noStroke();
        ellipse(400, 380, d, d); // arrivée rouge
      }
      if (vertArrivee==true) {
        d=40;
        fill(vert);
        noStroke();
        ellipse(560, 460, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(320, 140, 40, 40);
      } else {
        d=20;
        fill(vert);
        noStroke();
        ellipse(560, 460, d, d);
      }
      if (jauneArrivee==true) {
        d=40;
        fill(jaune);
        noStroke();
        ellipse(560, 140, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(400, 140, 40, 40);
      } else {
        d=20;
        fill(jaune);
        noStroke();
        ellipse(560, 140, d, d);
      }
      if (bleuArrivee==true) {
        d=40;
        fill(bleu);
        noStroke();
        ellipse(240, 460, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(320, 300, 40, 40);
      } else {
        d=20;
        fill(bleu);
        noStroke();
        ellipse(240, 460, d, d);
      }
    }
    // NIVEAU 2
if (compteurNiveau==2) {
      // POINTS DE DEPART
      if (rougeDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(rouge);
        ellipse(240, 140, 40, 40);
      } else {
        noStroke();
        fill(rouge);
        ellipse(240, 140, 40, 40);
      }
      if (vertDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(vert);
        ellipse(480, 140, 40, 40);
      } else {
        noStroke();
        fill(vert);
        ellipse(480, 140, 40, 40);
      }
      if (jauneDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(jaune);
        ellipse(240, 220, 40, 40);
      } else {
        noStroke();
        fill(jaune);
        ellipse(240, 220, 40, 40);
      }
      if (bleuDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(bleu);
        ellipse(320, 220, 40, 40);
      } else {
        noStroke();
        fill(bleu);
        ellipse(320, 220, 40, 40);
      }
      // POINTS D'ARRIVEE
      int d;
      noStroke();
      if (rougeArrivee==true) {
        d=40;
        fill(rouge);
        noStroke();
        ellipse(400, 380, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(240, 140, 40, 40);
      } else {
        d=20;
        fill(rouge);
        noStroke();
        ellipse(400, 380, d, d);
      }
      if (vertArrivee==true) {
        d=40;
        fill(vert);
        noStroke();
        ellipse(560, 460, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(480, 140, 40, 40);
      } else {
        d=20;
        fill(vert);
        noStroke();
        ellipse(560, 460, d, d);
      }
      if (jauneArrivee==true) {
        d=40;
        fill(jaune);
        noStroke();
        ellipse(240, 460, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(240, 220, 40, 40);
      } else {
        d=20;
        fill(jaune);
        noStroke();
        ellipse(240, 460, d, d);
      }
      if (bleuArrivee==true) {
        d=40;
        fill(bleu);
        noStroke();
        ellipse(480, 220, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(320, 220, 40, 40);
      } else {
        d=20;
        fill(bleu);
        noStroke();
        ellipse(480, 220, d, d);
      }
    } 
    if (compteurNiveau==3) {
      if (rougeDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(rouge);
        ellipse(480, 140, 40, 40); // départ
      } else {
        noStroke();
        fill(rouge);
        ellipse(480, 140, 40, 40); // départ
      }
      if (vertDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(vert);
        ellipse(560, 140, 40, 40);
      } else {
        noStroke();
        fill(vert);
        ellipse(560, 140, 40, 40);
      }
      if (jauneDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(jaune);
        ellipse(320, 220, 40, 40);
      } else {
        noStroke();
        fill(jaune);
        ellipse(320, 220, 40, 40);
      }
      if (bleuDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(bleu);
        ellipse(400, 380, 40, 40);
      } else {
        noStroke();
        fill(bleu);
        ellipse(400, 380, 40, 40);
      }
      // POINTS D'ARRIVEE
      int d;
      noStroke();
      if (rougeArrivee==true) {
        d=40;
        fill(rouge);
        noStroke();
        ellipse(240, 460, d, d); // arrivée
        stroke(150);
        strokeWeight(4);
        ellipse(480, 140, 40, 40); // départ
      } else {
        d=20;
        fill(rouge);
        noStroke();
        ellipse(240, 460, d, d); // arrivée
      }
      if (vertArrivee==true) {
        d=40;
        fill(vert);
        noStroke();
        ellipse(480, 460, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(560, 140, 40, 40);
      } else {
        d=20;
        fill(vert);
        noStroke();
        ellipse(480, 460, d, d);
      }
      if (jauneArrivee==true) {
        d=40;
        fill(jaune);
        noStroke();
        ellipse(480, 220, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(320, 220, 40, 40);
      } else {
        d=20;
        fill(jaune);
        noStroke();
        ellipse(480, 220, d, d);
      }
      if (bleuArrivee==true) {
        d=40;
        fill(bleu);
        noStroke();
        ellipse(560, 460, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(400, 380, 40, 40);
      } else {
        d=20;
        fill(bleu);
        noStroke();
        ellipse(560, 460, d, d);
      }
    }
  }  
  if (compteurNiveau==4) {
    if (rougeDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(rouge);
        ellipse(240, 140, 40, 40); // départ rouge
      } else {
        noStroke();
        fill(rouge);
        ellipse(240, 140, 40, 40); // départ rouge
      }
      if (vertDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(vert);
        ellipse(240, 220, 40, 40);
      } else {
        noStroke();
        fill(vert);
        ellipse(240, 220, 40, 40);
      }
      if (jauneDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(jaune);
        ellipse(480, 220, 40, 40);
      } else {
        noStroke();
        fill(jaune);
        ellipse(480, 220, 40, 40);
      }
      if (bleuDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(bleu);
        ellipse(400, 300, 40, 40);
      } else {
        noStroke();
        fill(bleu);
        ellipse(400, 300, 40, 40);
      }
      // POINTS D'ARRIVEE
      int d;
      noStroke();
      if (rougeArrivee==true) {
        d=40;
        fill(rouge);
        noStroke();
        ellipse(320, 300, d, d); // arrivée rouge
        stroke(150);
        strokeWeight(4);
        ellipse(240, 140, 40, 40); // départ rouge
      } else {
        d=20;
        fill(rouge);
        noStroke();
        ellipse(320, 300, d, d); // arrivée rouge
      }
      if (vertArrivee==true) {
        d=40;
        fill(vert);
        noStroke();
        ellipse(400, 460, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(240, 220, 40, 40);
      } else {
        d=20;
        fill(vert);
        noStroke();
        ellipse(400, 460, d, d);
      }
      if (jauneArrivee==true) {
        d=40;
        fill(jaune);
        noStroke();
        ellipse(320, 380, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(480, 220, 40, 40);
      } else {
        d=20;
        fill(jaune);
        noStroke();
        ellipse(320, 380, d, d);
      }
      if (bleuArrivee==true) {
        d=40;
        fill(bleu);
        noStroke();
        ellipse(480, 460, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(400, 300, 40, 40);
      } else {
        d=20;
        fill(bleu);
        noStroke();
        ellipse(480, 460, d, d);
      }
  } 
  if (compteurNiveau==5) {
    if (rougeDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(rouge);
        ellipse(240, 140, 40, 40); // départ rouge
      } else {
        noStroke();
        fill(rouge);
        ellipse(240, 140, 40, 40); // départ rouge
      }
      if (vertDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(vert);
        ellipse(240, 220, 40, 40);
      } else {
        noStroke();
        fill(vert);
        ellipse(240, 220, 40, 40);
      }
      if (jauneDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(jaune);
        ellipse(320, 220, 40, 40);
      } else {
        noStroke();
        fill(jaune);
        ellipse(320, 220, 40, 40);
      }
      if (bleuDepart==true) {
        stroke(0);
        strokeWeight(3);
        fill(bleu);
        ellipse(240, 300, 40, 40);
      } else {
        noStroke();
        fill(bleu);
        ellipse(380, 300, 40, 40);
      }
      // POINTS D'ARRIVEE
      int d;
      noStroke();
      if (rougeArrivee==true) {
        d=40;
        fill(rouge);
        noStroke();
        ellipse(480, 380, d, d); // arrivée rouge
        stroke(150);
        strokeWeight(4);
        ellipse(240, 140, 40, 40); // départ rouge
      } else {
        d=20;
        fill(rouge);
        noStroke();
        ellipse(480, 380, d, d); // arrivée rouge
      }
      if (vertArrivee==true) {
        d=40;
        fill(vert);
        noStroke();
        ellipse(320, 380, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(240, 220, 40, 40);
      } else {
        d=20;
        fill(vert);
        noStroke();
        ellipse(320, 380, d, d);
      }
      if (jauneArrivee==true) {
        d=40;
        fill(jaune);
        noStroke();
        ellipse(560, 460, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(320, 220, 40, 40);
      } else {
        d=20;
        fill(jaune);
        noStroke();
        ellipse(560, 460, d, d);
      }
      if (bleuArrivee==true) {
        d=40;
        fill(bleu);
        noStroke();
        ellipse(320, 460, d, d);
        stroke(150);
        strokeWeight(4);
        ellipse(240, 380, 40, 40);
      } else {
        d=20;
        fill(bleu);
        noStroke();
        ellipse(320, 460, d, d);
      }
  }
}

void departNiveau() {
  couleurTrait=rouge;
  rougeDepart=true;
  if (compteurNiveau==1||compteurNiveau==2) {
    xCentreCarre=240;
    yCentreCarre=140;
  }
  if (compteurNiveau==3) {
    xCentreCarre=480;
    yCentreCarre=140;
  }
  
}

void verificationPoint() {
  if (compteurNiveau==1) {
    if (caseOccupee[18]==true&&couleurTrait==rouge) {
      rougeArrivee=true;
      xCentreCarre=320;
      yCentreCarre=140;
      rougeDepart=false;
      vertDepart=true;
      couleurTrait=vert;
    }
    if (caseOccupee[25]==true&&couleurTrait==vert) {
      vertArrivee=true;
      xCentreCarre=400;
      yCentreCarre=140;
      vertDepart=false;
      jauneDepart=true;
      couleurTrait=jaune;
    }
    if (caseOccupee[5]==true&&couleurTrait==jaune) {
      jauneArrivee=true;
      xCentreCarre=320;
      yCentreCarre=300;
      jauneDepart=false;
      bleuDepart=true;
      couleurTrait=bleu;
    }
    if (caseOccupee[21]==true&&couleurTrait==bleu) {
      bleuDepart=false;
      bleuArrivee=true;
      couleurTrait=color(0);
    }
  } 
  if (compteurNiveau==2) {
    if (caseOccupee[18]==true&&couleurTrait==rouge) { // si arrivée rouge
      rougeArrivee=true;
      xCentreCarre=480; // départ vert
      yCentreCarre=140;
      rougeDepart=false;
      vertDepart=true;
      couleurTrait=vert;
    }
    if (caseOccupee[25]==true&&couleurTrait==vert) {
      vertArrivee=true;
      xCentreCarre=240;
      yCentreCarre=220;
      vertDepart=false;
      jauneDepart=true;
      couleurTrait=jaune;
    }
    if (caseOccupee[21]==true&&couleurTrait==jaune) {
      jauneArrivee=true;
      xCentreCarre=320;
      yCentreCarre=220;
      jauneDepart=false;
      bleuDepart=true;
      couleurTrait=bleu;
    }
    if (caseOccupee[9]==true&&couleurTrait==bleu) {
      bleuArrivee=true;
      bleuDepart=false;
      bleuArrivee=true;
      couleurTrait=color(0);
    }
  } 

  if (compteurNiveau==3) {
    if (caseOccupee[21]==true&&couleurTrait==rouge) { // si arrivée rouge
      rougeArrivee=true;
      xCentreCarre=560; // départ vert
      yCentreCarre=140;
      rougeDepart=false;
      vertDepart=true;
      couleurTrait=vert;
    }
    if (caseOccupee[24]==true&&couleurTrait==vert) {
      vertArrivee=true;
      xCentreCarre=320;
      yCentreCarre=220;
      vertDepart=false;
      jauneDepart=true;
      couleurTrait=jaune;
    }
    if (caseOccupee[9]==true&&couleurTrait==jaune) {
      jauneArrivee=true;
      xCentreCarre=400;
      yCentreCarre=380;
      jauneDepart=false;
      bleuDepart=true;
      couleurTrait=bleu;
    }
    if (caseOccupee[25]==true&&couleurTrait==bleu) {
      bleuArrivee=true;
      bleuDepart=false;
      couleurTrait=color(0);
    }  
    
    
    if (compteurNiveau==4) {
      if (caseOccupee[12]==true&&couleurTrait==rouge) { // si arrivée rouge
      rougeArrivee=true;
      xCentreCarre=240; // départ vert
      yCentreCarre=220;
      rougeDepart=false;
      vertDepart=true;
      couleurTrait=vert;
    }
    if (caseOccupee[23]==true&&couleurTrait==vert) {
      vertArrivee=true;
      xCentreCarre=480;
      yCentreCarre=220;
      vertDepart=false;
      jauneDepart=true;
      couleurTrait=jaune;
    }
    if (caseOccupee[17]==true&&couleurTrait==jaune) {
      jauneArrivee=true;
      xCentreCarre=400;
      yCentreCarre=300;
      jauneDepart=false;
      bleuDepart=true;
      couleurTrait=bleu;
    }
    if (caseOccupee[24]==true&&couleurTrait==bleu) {
      bleuArrivee=true;
      bleuDepart=false;
      couleurTrait=color(0);
    }  
    } 
    if (compteurNiveau==5) {
      if (caseOccupee[19]==true&&couleurTrait==rouge) { // si arrivée rouge
      rougeArrivee=true;
      xCentreCarre=240; // départ vert
      yCentreCarre=220;
      rougeDepart=false;
      vertDepart=true;
      couleurTrait=vert;
    }
    if (caseOccupee[17]==true&&couleurTrait==vert) {
      vertArrivee=true;
      xCentreCarre=320;
      yCentreCarre=220;
      vertDepart=false;
      jauneDepart=true;
      couleurTrait=jaune;
    }
    if (caseOccupee[25]==true&&couleurTrait==jaune) {
      jauneArrivee=true;
      xCentreCarre=240;
      yCentreCarre=380;
      jauneDepart=false;
      bleuDepart=true;
      couleurTrait=bleu;
    }
    if (caseOccupee[22]==true&&couleurTrait==bleu) {
      bleuArrivee=true;
      bleuDepart=false;
      couleurTrait=color(0);
    }  
    
    }
  }
}
void tracerTrait() {
  if (key==CODED&&bleuArrivee==false) {
    strokeWeight(4);
    // TEST TRACER
    if (dernierMouvement!="DOWN"&&keyCode==UP&&yCentreCarre>140&&(get(xCentreCarre, yCentreCarre-80)==color(255)
      ||get(xCentreCarre, yCentreCarre-71)==couleurTrait)) {
      stroke(couleurTrait);
      line(xCentreCarre, yCentreCarre, xCentreCarre, yCentreCarre-80);
      println("up");
      yCentreCarre=yCentreCarre-80;
      dernierMouvement="UP";
    }
    if (dernierMouvement!="UP"&&keyCode==DOWN&& yCentreCarre<=420&&(get(xCentreCarre, yCentreCarre+80)==color(255)
      ||get(xCentreCarre, yCentreCarre+71)==couleurTrait)) {
      stroke(couleurTrait);
      line(xCentreCarre, yCentreCarre, xCentreCarre, yCentreCarre+80);
      println("down");
      yCentreCarre=yCentreCarre+80;
      dernierMouvement="DOWN";
    }
    if (dernierMouvement!="RIGHT"&&keyCode==LEFT&&xCentreCarre>240&&(get(xCentreCarre-80, yCentreCarre)==color(255)
      ||get(xCentreCarre-71, yCentreCarre)==couleurTrait)) {
      stroke(couleurTrait);
      line(xCentreCarre, yCentreCarre, xCentreCarre-80, yCentreCarre);
      println("left");
      xCentreCarre=xCentreCarre-80;
      dernierMouvement="LEFT";
    }
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
  if (mousePressed==true&&mouseX>620&&mouseX<780&&mouseY>510&&mouseY<570) {
    dernierMouvement="";
    if (bleuArrivee==false) {
      print("Niveau reset ");
      background(155, 155, 0);
      afficherQuadrillage();
      allDepartFalse();
      allArriveeFalse();
      
      afficherPoints();
      // POINT DE DEPART
      rougeDepart=true;
      departNiveau();
      // ARRIVEE
      if (compteurNiveau>0&&compteurNiveau<6) {
        allArriveeFalse();
      }
    } else {
      if (compteurNiveau==1) {
        bleuArrivee=false;
        compteurNiveau=2;
        bleuArrivee=false;
      }
    }
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

void testFil() {
  donneesColonnes = linedotJSON.getJSONArray(0);
  donneesLignes = linedotJSON.getJSONArray(1);
  donneesCombo = linedotJSON.getJSONArray(2);
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
        print("case " +combo + " ");
        println(caseOccupee[combo]);
      }
    }
  }
}
