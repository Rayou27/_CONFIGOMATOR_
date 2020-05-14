void testFil() {
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
  for (int g=1; g<=5; g++) {
    //println("niveau "+g);
    for (int i=0; i<=3; i++) {
      objetDepart=donneesDepart.getJSONObject(g);
      compteurDepart[g][i]=objetDepart.getInt(str(i));
      objetArrivee=donneesArrivee.getJSONObject(g);
      compteurArrivee[g][i]=objetArrivee.getInt(str(i));
      //print(" depart : "+compteurDepart[g][i]+" arrivée : "+compteurArrivee[g][i]+"\n");
    }
  }
}
