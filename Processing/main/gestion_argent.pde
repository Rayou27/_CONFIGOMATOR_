void uniteMonnaie() {
  if (capital > 0 && capital < 1000) { // moins de mille $
    capitalAffiche=capital;
  } 
  if (capital >=1000 && capital <1000000) { // passage au miller $ 
    uniteMonnaie = "k";
    capitalAffiche = capital/1000;
  }
  if (capital >=1000000 && capital <1000000000) { // passage au millon $
    uniteMonnaie = "M";
    capitalAffiche = capital/1000000;
  }
}
