int xCentreCarre, yCentreCarre;
int compteurNiveau=0;
int borneInfX, borneSupX, borneInfY, borneSupY;

String currentID;
String colID, liID, carreID;

color couleurTrait = color(0, 0, 255), couleurEffacer=color(100, 0, 0);
color rouge=color(255, 0, 0), vert=color(0, 255, 0), jaune=color(255, 220, 0), bleu=color(0, 0, 255);

boolean colSelect=false, liSelect=false, carreSelect=false;
boolean rougeDepart=false, vertDepart=false, jauneDepart=false, bleuDepart=false;
boolean rougeArrivee=false, vertArrivee=false, jauneArrivee=false, bleuArrivee=false;

boolean[] caseOccupee = new boolean[26];

JSONArray linedotJSON;

void setup() {
  size(800, 600);
  background(155,155,0);
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

void afficherEcranDebut21(){
  background(155, 155, 0);
  fill(0);
  textSize(40);
  textAlign(CENTER);
  text("2-1",width/2,100);
  textSize(60);
  text("Line Dot",width/2,170);
  stroke(0);
  strokeWeight(6);
  fill(255);
  rect(100,200,600,250);
  fill(0);
  textSize(27);
  textAlign(LEFT);
  text("Ici, tu dois relier des points de couleurs\nprésents sur le quadrillage. Interdit \nde repasser sur un trait déjà fait.\nUtilise les 4 flèches directionnelles du\nclavier pour te déplacer. ",140,250);
  fill(200, 200, 255);
  rect(620, 510, 160, 60);
  fill(0);
  text("Let's Go~",640,549);
  if(mousePressed&&mouseX>620&&mouseX<780&&mouseY>510&&mouseY<570){
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
  couleurTrait=rouge;
  rougeDepart=true;
  if (compteurNiveau==1||compteurNiveau==2) {
    xCentreCarre=240;
    yCentreCarre=140;
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
      bleuDepart=false;
      bleuArrivee=true;
      couleurTrait=color(0);
    }
  } 



  if (compteurNiveau==2) {
    if (xCentreCarre==400&&yCentreCarre==380&&couleurTrait==rouge) {
      rougeArrivee=true;
      xCentreCarre=480;
      yCentreCarre=140;
      rougeDepart=false;
      vertDepart=true;
      couleurTrait=vert;
    }
    if (xCentreCarre==560&&yCentreCarre==460&&couleurTrait==vert) {
      vertArrivee=true;
      xCentreCarre=240;
      yCentreCarre=220;
      vertDepart=false;
      jauneDepart=true;
      couleurTrait=jaune;
    }
    if (xCentreCarre==240&&yCentreCarre==460&&couleurTrait==jaune) {
      jauneArrivee=true;
      xCentreCarre=320;
      yCentreCarre=220;
      jauneDepart=false;
      bleuDepart=true;
      couleurTrait=bleu;
    }
    if (xCentreCarre==480&&yCentreCarre==220&&couleurTrait==bleu) {
      bleuArrivee=true;
      bleuDepart=false;
      bleuArrivee=true;
      couleurTrait=color(0);
    }
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
  if (key==CODED&&bleuArrivee==false) {
    strokeWeight(4);
    // TEST TRACER
    if (keyCode==UP&&yCentreCarre>140) {
      stroke(couleurTrait);
      line(xCentreCarre, yCentreCarre, xCentreCarre, yCentreCarre-80);
      println("up");
      yCentreCarre=yCentreCarre-80;
    }
    if (keyCode==DOWN&& yCentreCarre<=420) {
      stroke(couleurTrait);
      line(xCentreCarre, yCentreCarre, xCentreCarre, yCentreCarre+80);
      println("down");
      yCentreCarre=yCentreCarre+80;
    }
    if (keyCode==LEFT&&xCentreCarre>240) {
      stroke(couleurTrait);
      line(xCentreCarre, yCentreCarre, xCentreCarre-80, yCentreCarre);
      println("left");
      xCentreCarre=xCentreCarre-80;
    }
    if (keyCode==RIGHT&& xCentreCarre<=520) {
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
  if (bleuArrivee==false) {
    text("Rejouer..", 640, 550);
  } else {
    text("Suivant !", 640, 550);
  }

  // TEST
  if (mousePressed==true&&mouseX>620&&mouseX<780&&mouseY>510&&mouseY<570) {
    if (bleuArrivee==false) {
      print("Niveau reset ");
      background(155,155,0);
      afficherQuadrillage();
      afficherPoints();
      // POINT DE DEPART
      allDepartFalse();
      rougeDepart=true;
      departNiveau();
      // ARRIVEE
      if (compteurNiveau>0&&compteurNiveau<6) {
        allArriveeFalse();
      }
    } else {
      if (compteurNiveau==1) {
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

void allCaseOccupeeFalse() {
  for (int i =1; i<=25; i++) {
    caseOccupee[i]=false;
  }
}

void rejoins() {
  fill(189, 227, 64);
  noStroke();
  rect(30, 367, 165,55);
  fill(0);
  textSize(20);
  if (couleurTrait==rouge) {
    
    
    fill(0,200,205);
    strokeWeight(5);
    stroke(0);
    rect(40,3,190,55);
    fill(0);
    textSize(35);
    text("Niveau 1", 60,43);
    textSize(19);
    text("Consigne: relie le gros point rouge au petit à l'aide des flèches directionnelles.",40,85);
    strokeWeight(3);
    line(40,90,130,90);
  }
  if (couleurTrait==vert) {
    fill(vert);
    text("rejoins le vert", 55,70);
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
  JSONArray donneesColonnes = linedotJSON.getJSONArray(0);
  JSONArray donneesLignes = linedotJSON.getJSONArray(1);
  JSONArray donneesCombo = linedotJSON.getJSONArray(2);
  JSONObject objetColonnes = donneesColonnes.getJSONObject(1);
  JSONObject objetLignes = donneesLignes.getJSONObject(1);
  JSONObject objetCombo = donneesCombo.getJSONObject(0);
  borneInfX=objetColonnes.getInt("x1");
  borneSupX=objetColonnes.getInt("x2");
  colID= objetColonnes.getString("id");
  borneInfY=objetLignes.getInt("y1");
  borneSupY=objetLignes.getInt("y2");
  liID= objetLignes.getString("id");
  String caseID = colID+ " " + liID;
  int combo = objetCombo.getInt(caseID);
  int xMoy=(borneInfX+borneSupX)/2;
  int yMoy=(borneInfY+borneSupY)/2;
  if (xMoy==xCentreCarre&&yMoy==yCentreCarre) {
    caseOccupee[1]=true;
    print("case " +combo + " ");
    println(caseOccupee[combo]);
  }
}
