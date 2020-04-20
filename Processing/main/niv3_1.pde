/*float Timer=0;
int vraiFauxScore=0;
int vraiFauxCompteurQuestion=1;
int bonneReponse=0;
int mauvaiseReponse=0;



println (vraiFauxCompteurQuestion);
if (vraiFauxCompteurQuestion==1) {
  Question1();
} else if (vraiFauxCompteurQuestion==2) {
  Question2();
}
if (mauvaiseReponse==1) {
  Perdu();
} else if (mauvaiseReponse==3) {
  Question3();
} else if (vraiFauxCompteurQuestion==4) {
  Question4();
}
if (bonneReponse==1) {
  Juste();
}

void mouseReleased() {

  if ( vraiFauxCompteurQuestion==1 && mouseX > 0 && mouseX < 200 && mouseY > 200 && mouseY < 300 ) {
    mauvaiseReponse=1;
  } else if ( vraiFauxCompteurQuestion==1 && mouseX > 300 && mouseX < 500 && mouseY > 200 && mouseY < 300) {
    bonneReponse=1;
  }
}



void Question1() {
  background(0);
  fill(255);
  rect(0, 0, 500, 200);
  rect(0, 200, 200, 100);
  rect(300, 200, 200, 100);
  fill(0);
  textSize(20);
  text("question1", 0, 100);
  text("Vrai", 0, 270);
  text("Faux", 400, 270);
}

void Question2() {
  background(0);
  fill(255);
  rect(0, 0, 500, 200);
  rect(0, 200, 200, 100);
  rect(300, 200, 200, 100);
  fill(0);
  textSize(20);
  text("question2", 0, 100);
  text("Vrai", 0, 270);
  text("Faux", 400, 270);
}

void Question3() {
  background(0);
  fill(255);
  rect(0, 0, 500, 200);
  rect(0, 200, 200, 100);
  rect(300, 200, 200, 100);
  fill(0);
  textSize(20);
  text("question3", 0, 100);
  text("Vrai", 0, 270);
  text("Faux", 400, 270);
}

void Question4() {
  background(0);
  fill(255);
  rect(0, 0, 500, 200);
  rect(0, 200, 200, 100);
  rect(300, 200, 200, 100);
  fill(0);
  textSize(20);
  text("question4", 0, 100);
  text("Vrai", 0, 270);
  text("Faux", 400, 270);
}



void Juste() {

  background(117, 183, 3);
  Timer += 0.25;
  println(Timer);
  fill(0);
  textSize(50);
  text("Bonne réponse", width/2-100, height/2-100);
  if (Timer == 5) { 
    println("nul");
    Timer=0;

    vraiFauxCompteurQuestion= vraiFauxCompteurQuestion + 1;
    mauvaiseReponse=0;
  }
}


void Perdu() {
  background(0);
  Timer += 0.25;
  println(Timer);
  fill(204, 53, 30);
  textSize(50);
  text("Mauvaise Réponse", width/2-100, height/2);
  if (Timer == 5) { 
    println("nul");
    Timer=0;
    vraiFauxCompteurQuestion=1;
    mauvaiseReponse=0;
  }
}

*/
