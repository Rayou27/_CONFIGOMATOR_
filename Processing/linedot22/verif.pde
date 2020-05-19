void verificationPoint() {
  for (int i=0; i<=3; i++) {
    if (caseOccupee[billeArrivee[compteurNiveau][i]]==true&&couleurTrait==couleur[i]&&i<3) {
      arrivee[i]=true;
      xCentreCarre=xJSON[billeDepart[compteurNiveau][i+1]];
      yCentreCarre=yJSON[billeDepart[compteurNiveau][i+1]];
      depart[i]=false;
      dernierMouvement="";
      depart[i+1]=true;
      couleurTrait=couleur[i+1];
    }
    if (caseOccupee[billeArrivee[compteurNiveau][i]]==true&&couleurTrait==couleur[i]&&i==3) {
      depart[i]=false;
      arrivee[i]=true;
      couleurTrait=color(0);
    }
  }
}
