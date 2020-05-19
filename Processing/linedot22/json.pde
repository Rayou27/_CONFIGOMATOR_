void testFil() {
  donneesColonnes = linedotJSON.getJSONArray(0);
  donneesLignes = linedotJSON.getJSONArray(1);
  donneesCombo = linedotJSON.getJSONArray(2);
  for (int i=1; i<=5; i++) {
    for (int j=1; j<=5; j++) {
      objetColonnes = donneesColonnes.getJSONObject(j);
      objetLignes = donneesLignes.getJSONObject(i);
      objetCombo = donneesCombo.getJSONObject(0);
      borneInfX=objetColonnes.getInt("x1");
      borneSupX=objetColonnes.getInt("x2");
      colID= objetColonnes.getString("id");
      borneInfY=objetLignes.getInt("y1");
      borneSupY=objetLignes.getInt("y2");
      liID= objetLignes.getString("id");
      caseID = colID+ " " + liID;
      combo = objetCombo.getInt(caseID);
      xMoy=(borneInfX+borneSupX)/2;
      yMoy=(borneInfY+borneSupY)/2;
      if (xMoy==xCentreCarre&&yMoy==yCentreCarre) {
        caseOccupee[combo]=true;
        /*print("case " +combo + " ");
         println(caseOccupee[combo]);*/
      }
    }
  }
}

void pointTP() {
  donneesTP= linedotJSON.getJSONArray(3);
  for (int i=1; i<=25; i++) {
    objetTP=donneesTP.getJSONObject(i);
    xJSON[i]=objetTP.getInt("xCentre");
    yJSON[i]=objetTP.getInt("yCentre");
    //println("Carré "+i+"\t x: "+xJSON[i]+"\t y :"+yJSON[i]);
  }
}

void ordrePoint() {
  donneesDepart=linedotJSON.getJSONArray(4);
  donneesArrivee=linedotJSON.getJSONArray(5);
  for (int g=1; g<=10; g++) {
    //println("niveau "+g);
    for (int i=0; i<=3; i++) {
      objetDepart=donneesDepart.getJSONObject(g);
      billeDepart[g][i]=objetDepart.getInt(str(i));
      objetArrivee=donneesArrivee.getJSONObject(g);
      billeArrivee[g][i]=objetArrivee.getInt(str(i));
      //print(" depart : "+billeDepart[g][i]+" arrivée : "+billeArrivee[g][i]+"\n");
    }
  }
}

void ordreMur() {
  donneesNombreMur=linedotJSON.getJSONArray(6);
  objetNombreHorizontal=donneesNombreMur.getJSONObject(0);
  objetNombreVertical=donneesNombreMur.getJSONObject(1);
  donneesHorizontal=linedotJSON.getJSONArray(7);
  donneesVertical=linedotJSON.getJSONArray(8);
  for (int g=1; g<=10; g++) {
    nombreMurHorizontal[g]=objetNombreHorizontal.getInt(str(g));
    nombreMurVertical[g]=objetNombreVertical.getInt(str(g));
    /*println("Niveau : "+g+"\n\tNombre de murs : "+nombreMurHorizontal[g]
     +"(H) "+nombreMurVertical[g]+"(V)\n\tTotal : "+(nombreMurHorizontal[g]+nombreMurVertical[g]));*/
    for (int i=1; i<=nombreMurHorizontal[g]; i++) {
      objetHorizontal=donneesHorizontal.getJSONObject(g);
      murHorizontal[g][i]=objetHorizontal.getInt(str(i));
      //println("Niveau "+g+" Mur Horiz. n°"+i+" : case "+murHorizontal[g][i]);
    }
    for (int i=1; i<=nombreMurVertical[g]; i++) {
      objetVertical=donneesVertical.getJSONObject(g);
      murVertical[g][i]=objetVertical.getInt(str(i));
      //println("Niveau "+g+" Mur Vert. n°"+i+" : case "+murVertical[g][i]);
    }
  }
}
