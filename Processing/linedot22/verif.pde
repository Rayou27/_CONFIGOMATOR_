void verificationPoint() {
  
  
  
  
  
  // NIVEAU 1
  
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
  
  
  
  
  
  // NIVEAU 2
  
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
      bleuDepart=false;
      bleuArrivee=true;
      couleurTrait=color(0);
    }
  } 
  
  
  
  
  // NIVEAU 3
  
  if (compteurNiveau==3) {
    if (caseOccupee[21]==true&&couleurTrait==rouge) { 
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
  }
  
  
  
  
  
  // NIVEAU 4
  
  if (compteurNiveau==4) {
    ;
  } 
  
  
  
  
  
  // NIVEAU 5
  
  if (compteurNiveau==5) {
    ;
  }
}
