int capital = 25;
String niveauEnCours = "1-1";

void setup() {
  // taille fenêtre
  size(800,600);
 
  // barre bleue haut
  fill(0,70,200);
  rect(0,0,800,70);
  
  // barre jaune gauche
  fill(250,200,0);
  rect(0,70,230,400);
  
  // barre blanche bas
  fill(255);
  rect(0,470,800,130);
  
  // contours
  noFill();
  stroke(0);
  strokeWeight(7);
  
  // contours pour bleu
  rect(2,2,138,70);
  rect(140,2,520,70);
  rect(660,2,136,70);
  
  // contour pour jaune
  rect(2,72,230,400);
  
  // contour pour blanc
  rect(2,472,794,124);
  
  // bordure droite
  line(796,72,796,470);
  
}
void draw() {
  afficherCapital();
  afficherNiveauEnCours();
  
}

void afficherCapital() {
  textSize(30);
  text(capital + " $", 40,50);
}

void afficherNiveauEnCours() {
    text(niveauEnCours, 700, 50);
}
