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
