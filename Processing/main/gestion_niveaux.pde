void prochainNiveau() {
  if (compteurGlobalNiveaux == 2) { 
    niveauEnCours = "1-2";
  }
  if (compteurGlobalNiveaux == 3) { 
    niveauEnCours = "2-1";
  }
  if (compteurGlobalNiveaux == 4) { 
    niveauEnCours = "2-2";
  }
  if (compteurGlobalNiveaux == 5) { 
    niveauEnCours = "3-1";
  }
  if (compteurGlobalNiveaux == 6) { 
    niveauEnCours = "3-2";
  }
  if (compteurGlobalNiveaux == 7) { 
    niveauEnCours = "4-1";
  }
  if (compteurGlobalNiveaux == 8) { 
    niveauEnCours = "4-2";
  }
}

void affichageEcranNiveaux() {
  for (int i=1; i<=8; i++) {
    if (compteurGlobalNiveaux == i && partieLancee == true) {
      affichageEcranPrincipal = false;
      affichageEcran[i] = true;
    }
  }
  if (affichageEcran[3]==true) {
    draw21();
  }
  if (affichageEcran[4]==true) {
    draw22();
  }
  if (affichageEcran[5]==true) {
    miniJeu31();
  }
}
