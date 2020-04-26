int numeroCarre;
int numeroCouleur;
int comptCol, comptLi;
int borneInfX, borneSupX, borneInfY, borneSupY;
int xSouris, ySouris;

String currentID;
String colID, liID, carreID;

boolean colSelect=false, liSelect=false, carreSelect=false;

JSONArray linedotJSON;

void setup() {
  size(800, 600);
  background(255);
  
  linedotJSON = loadJSONArray("linedot.json");
  
  rect(200, 100, 400, 400);
  for (int i=100; i<570; i+=80) {
    line(200, i, 600, i);
  } 
  for (int i=200; i<650; i+=80) {
    line(i, 100, i, 500);
  }
}

void draw() {
  linedotJSON();
}

void keyPressed() {
  background(255);
  afficherQuadrillage();
}

void linedotJSON() {
  JSONArray donneesColonnes = linedotJSON.getJSONArray(0);
  JSONArray donneesLignes = linedotJSON.getJSONArray(1);
  JSONObject objetColonnes = donneesColonnes.getJSONObject(comptCol);
  JSONObject objetLignes = donneesLignes.getJSONObject(comptLi);  

  if (mousePressed==true) {
    xSouris = mouseX;
    ySouris = mouseY;
    while (colSelect==false) {
      for (comptCol=1; comptCol<6; comptCol++) {

        borneInfX=objetColonnes.getInt("x1");
        borneSupX=objetColonnes.getInt("x2");
        colID= objetColonnes.getString("id");
        if (xSouris>borneInfX && xSouris<borneSupX) {
          colSelect=true;
        }
      }
    }
    while (liSelect==false) {
      for (comptLi=1; comptLi<6; comptLi++) {
        borneInfX=objetColonnes.getInt("y1");
        borneSupX=objetColonnes.getInt("y2");
        liID= objetLignes.getString("id");
        if (ySouris>borneInfY && ySouris<borneSupY ) {
          liSelect=true;
        }
      }
      carreID= colID+liID; // combinaison string
      print(carreID);
    }
  }
}

void afficherQuadrillage() {
  rect(200, 100, 400, 400);
  for (int i=100; i<570; i=i+80) {
    line(200, i, 600, i);
  }

  for (int i=200; i<650; i=i+80) {
    line(i, 100, i, 500);
  }
}
