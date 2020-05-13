void verificationPoint() {
  int[] compteurArrivee1={18, 25, 5, 21};
  if (compteurNiveau==1) {
    for (int i=0; i<=3; i++) {
      if (caseOccupee[compteurArrivee1[i]]==true&&couleurTrait==couleur[i]&&i<3) {
        arrivee[i]=true;
        xCentreCarre=xJSON[compteurDepart1[i+1]];
        yCentreCarre=yJSON[compteurDepart1[i+1]];
        depart[i]=false;
        depart[i+1]=true;
        couleurTrait=couleur[i+1];
      }
      if (caseOccupee[compteurArrivee1[i]]==true&&couleurTrait==couleur[i]&&i==3) {
        depart[i]=false;
        arrivee[i]=true;
        couleurTrait=color(0);
      }
    }
  }
}
