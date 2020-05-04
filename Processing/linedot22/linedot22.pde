int xCentreCarre, yCentreCarre;
int compteurNiveau=1;


String currentID;
String colID, liID, carreID;

color couleurTrait = color(0, 0, 255), couleurEffacer=color(100, 0, 0);
color rouge=color(255, 0, 0), vert=color(0, 255, 0), jaune=color(255, 220, 0), bleu=color(0, 0, 255);

boolean colSelect=false, liSelect=false, carreSelect=false;
boolean rougeDepart=false, vertDepart=false, jauneDepart=false, bleuDepart=false;
boolean rougeArrivee=false, vertArrivee=false, jauneArrivee=false, bleuArrivee=false;

JSONArray linedotJSON;

void setup() {
  size(800, 600);
  background(255);
  afficherQuadrillage();
  afficherPoints();
  departNiveau();
}

void draw() {
  background(255);
  boutonEffacer();
  afficherQuadrillage();
  afficherPoints();
  rejoins();
  verificationPoint();
}


void keyPressed() {
  tracerTrait();
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
    if (compteurNiveau==1) {
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
        ellipse(400, 380, d, d);
      } else {
        d=20;
        fill(rouge);
        ellipse(400, 380, d, d);
      }
      if (vertArrivee==true) {
        d=40;
        fill(vert);
        ellipse(560, 460, d, d);
      } else {
        d=20;
        fill(vert);
        ellipse(560, 460, d, d);
      }
      if (jauneArrivee==true) {
        d=40;
        fill(jaune);
        ellipse(560, 140, d, d);
      } else {
        d=20;
        fill(jaune);
        ellipse(560, 140, d, d);
      }
      if (bleuArrivee==true) {
        d=40;
        fill(bleu);
        ellipse(240, 460, d, d);
      } else {
        d=20;
        fill(bleu);
        ellipse(240, 460, d, d);
      }
    }
    if (compteurNiveau==2) {
      ;
    } 
    if (compteurNiveau==3) {
      ;
    } 
    if (compteurNiveau==4) {
      ;
    } 
    if (compteurNiveau==5) {
      ;
    }
  }
}

void departNiveau() {
  if (compteurNiveau==1) {
    rougeDepart=true;
    xCentreCarre=240;
    yCentreCarre=140;
    couleurTrait=rouge;
  }
}

void verificationPoint() {
  if (compteurNiveau==1) {
    if (xCentreCarre==400&&yCentreCarre==380&&couleurTrait==rouge) {
      rougeArrivee=true;
      xCentreCarre=320;
      yCentreCarre=140;
      rougeDepart=false;
      vertDepart=true;
      couleurTrait=vert;
    }
    if (xCentreCarre==560&&yCentreCarre==460&&couleurTrait==vert) {
      vertArrivee=true;
      xCentreCarre=400;
      yCentreCarre=140;
      vertDepart=false;
      jauneDepart=true;
      couleurTrait=jaune;
    }
    if (xCentreCarre==560&&yCentreCarre==140&&couleurTrait==jaune) {
      jauneArrivee=true;
      xCentreCarre=320;
      yCentreCarre=300;
      jauneDepart=false;
      bleuDepart=true;
      couleurTrait=bleu;
    }
    if (xCentreCarre==240&&yCentreCarre==460&&couleurTrait==bleu) {
      bleuArrivee=true;
      xCentreCarre=0; // attention
      yCentreCarre=0;
      bleuDepart=false;
      bleuArrivee=true;
      couleurTrait=color(0);
    }
  } 
  if (compteurNiveau==2) {
    ;
  } 
  if (compteurNiveau==3) {
    ;
  } 
  if (compteurNiveau==4) {
    ;
  } 
  if (compteurNiveau==5) {
    ;
  }
}

void tracerTrait() {
  if (key==CODED) {
    strokeWeight(4);
    // TEST TRACER
    if (keyCode==UP) {
      stroke(couleurTrait);
      line(xCentreCarre, yCentreCarre, xCentreCarre, yCentreCarre-80);
      println("up");
      yCentreCarre=yCentreCarre-80;
    }
    if (keyCode==DOWN) {
      stroke(couleurTrait);
      line(xCentreCarre, yCentreCarre, xCentreCarre, yCentreCarre+80);
      println("down");
      yCentreCarre=yCentreCarre+80;
    }
    if (keyCode==LEFT) {
      stroke(couleurTrait);
      line(xCentreCarre, yCentreCarre, xCentreCarre-80, yCentreCarre);
      println("left");
      xCentreCarre=xCentreCarre-80;
    }
    if (keyCode==RIGHT) {
      stroke(couleurTrait);
      line(xCentreCarre, yCentreCarre, xCentreCarre+80, yCentreCarre);
      xCentreCarre=xCentreCarre+80;
      println("right");
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
  text("Rejouer", 640, 550);

  // TEST
  if (mousePressed==true&&mouseX>620&&mouseX<780&&mouseY>510&&mouseY<570) {
    print("Niveau reset ");
    background(255);
    afficherQuadrillage();
    afficherPoints();
    // POINT DE DEPART
    if (compteurNiveau==1) {
      allDepartFalse();
      rougeDepart=true;
      departNiveau();
    }
    if (compteurNiveau==2) {
      ;
    } 
    if (compteurNiveau==3) {
      ;
    } 
    if (compteurNiveau==4) {
      ;
    } 
    if (compteurNiveau==5) {
      ;
    }
    // ARRIVEE
    if (compteurNiveau>0&&compteurNiveau<6) {
      allArriveeFalse();
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
  if (bleuArrivee==true){
    fill(0);
    text("finiiii", 60, 400);
  }
}
