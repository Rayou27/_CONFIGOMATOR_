int calculCompteurQuestion = 4;
float argentGagne41 =0;

color calculBonCouleur, calculMauvaisCouleur;
color reponseViergeCouleur = color(252, 243, 204);
color reponseJusteCouleur = color(62, 207, 62);
color reponseMauvaisCouleur = color(255, 48, 100);

String calculEnonce, calculSolution;

boolean reponseSaisie;
boolean calculBon, calculMauvais;
boolean calculSuivantOK;

JSONArray calculrapideJSON;

void setup(){
  size(800,600);
}

void draw(){
  miniJeu41();
}

void mousePressed(){
  // TEST BOUTON SUIVANT
  if (calculCompteurQuestion!=11 && (reponseSaisie==true || calculCompteurQuestion==0) 
    && mouseX > 0 && mouseX < 0 && mouseY > 0 && mouseY < 0) {
    calculSuivantOK=true;
  }
}

void miniJeu41(){
  calculrapideJSON();
}

void calculrapideJSON(){
  calculrapideJSON = loadJSONArray("calculrapide.json");
  JSONArray donnees = calculrapideJSON.getJSONArray(0);
  JSONObject objet = donnees.getJSONObject(calculCompteurQuestion);
  
  calculEnonce= objet.getString("enonce");
  calculSolution= objet.getString("solution");
}
