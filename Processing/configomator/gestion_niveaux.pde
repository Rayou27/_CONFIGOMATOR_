void prochainNiveau() {
  switch(compteurGlobalNiveaux) {
  case 1:
    niveauEnCours = "1-1";
    break;
  case 2:
    niveauEnCours = "1-2";
    break;
  case 3:
    niveauEnCours = "2-1";
    break;
  case 4:
    niveauEnCours = "2-2";
    break;
  }
}

void affichageEcranNiveaux() {
  for (int i=1; i<=4; i++) {
    if (compteurGlobalNiveaux == i && partieLancee == true) {
      affichageEcranPrincipal = false;
      affichageEcran[i] = true;
    }
  }
  if (affichageEcran[1]==true) {
    draw11();
    partieLancee=false;
  }
  if (affichageEcran[2]==true) {
    draw12();
    partieLancee=false;
  }
  if (affichageEcran[3]==true) {
    draw21();
    partieLancee=false;
  }
  if (affichageEcran[4]==true) {
    draw22();
    partieLancee=false;
  }
}
