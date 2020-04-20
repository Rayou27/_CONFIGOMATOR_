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
  if (compteurGlobalNiveaux == 1 && partieLancee == true) {
    affichageEcranPrincipal = false;
    affichageEcran11 = true;
  }  
  if (compteurGlobalNiveaux == 2 && partieLancee == true) {
    affichageEcranPrincipal = false;
    affichageEcran12 = true;
  }
  if (compteurGlobalNiveaux == 3 && partieLancee == true) {
    affichageEcranPrincipal = false;
    affichageEcran21 = true;
  }
  if (compteurGlobalNiveaux == 4 && partieLancee == true) {
    affichageEcranPrincipal = false;
    affichageEcran22 = true;
  }  
  if (compteurGlobalNiveaux == 5 && partieLancee == true) {
    affichageEcranPrincipal = false;
    affichageEcran31 = true;
  }
  if (compteurGlobalNiveaux == 6 && partieLancee == true) {
    affichageEcranPrincipal = false;
    affichageEcran32 = true;
  }
  if (compteurGlobalNiveaux == 7 && partieLancee == true) {
    affichageEcranPrincipal = false;
    affichageEcran41 = true;
  }  
  if (compteurGlobalNiveaux == 8 && partieLancee == true) {
    affichageEcranPrincipal = false;
    affichageEcran42 = true;
  }  
}
