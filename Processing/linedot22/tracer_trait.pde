void tracerTrait() {
  if (key==CODED&&bleuArrivee==false) {
    strokeWeight(4);
    
    // TEST TRACER
    
    
    // HAUT
    
    if (dernierMouvement!="DOWN"&&keyCode==UP&&yCentreCarre>140&&(get(xCentreCarre, yCentreCarre-80)==color(255)
      ||get(xCentreCarre, yCentreCarre-71)==couleurTrait)) {
      stroke(couleurTrait);
      line(xCentreCarre, yCentreCarre, xCentreCarre, yCentreCarre-80);
      println("up");
      yCentreCarre=yCentreCarre-80;
      dernierMouvement="UP";
    }
    
    
    // BAS
    
    if (dernierMouvement!="UP"&&keyCode==DOWN&& yCentreCarre<=420&&(get(xCentreCarre, yCentreCarre+80)==color(255)
      ||get(xCentreCarre, yCentreCarre+71)==couleurTrait)) {
      stroke(couleurTrait);
      line(xCentreCarre, yCentreCarre, xCentreCarre, yCentreCarre+80);
      println("down");
      yCentreCarre=yCentreCarre+80;
      dernierMouvement="DOWN";
    }
    
    
    
    // GAUCHE
    
    if (dernierMouvement!="RIGHT"&&keyCode==LEFT&&xCentreCarre>240&&(get(xCentreCarre-80, yCentreCarre)==color(255)
      ||get(xCentreCarre-71, yCentreCarre)==couleurTrait)) {
      stroke(couleurTrait);
      line(xCentreCarre, yCentreCarre, xCentreCarre-80, yCentreCarre);
      println("left");
      xCentreCarre=xCentreCarre-80;
      dernierMouvement="LEFT";
    }
    
    
    
   // DROITE 
   
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
