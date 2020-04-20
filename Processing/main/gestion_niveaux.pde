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
