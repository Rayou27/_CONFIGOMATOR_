int compteurGlobalNiveaux = 5;
float capital = 27;
float capitalAffiche = 27;
String niveauEnCours = "1-1";
String uniteMonnaie = "";
boolean affichageEcranPrincipal = true;
boolean partieLancee = false;
boolean affichageEcran11 = false, affichageEcran12 = false, 
  affichageEcran21 = false, affichageEcran22 = false, 
  affichageEcran31 = false, affichageEcran32 = false, 
  affichageEcran41 = false, affichageEcran42 = false;
PImage persoConfigo;

void setup() {
  // taille fenêtre
  size(800, 600);

  // CHARGER IMAGES
  persoConfigo = loadImage("persoConfigo.png");

  // 3-1 QUESTIONS
  vraiFauxQuestion1="Une carte mère ne peut \ncontenir qu’un seul \nprocesseur.";
  vraiFauxQuestion2="Le nombre de barrettes de \nRAM est forcément pair.";
  vraiFauxQuestion3="C’est la carte mère qui \neffectue les calculs.";
  vraiFauxQuestion4="Il existe des processeurs \nqui ne nécessitent pas de \ncarte graphique.";
  vraiFauxQuestion5="La carte graphique permet \nde produire l’image \naffichée sur l’écran.";
  vraiFauxQuestion6="Le processeur refroidit \ntellement en effectuant les \ncalculs qu’il lui faut un \nradiateur pour le chauffer.";
  vraiFauxQuestion7="Un PC peut fonctionner \nsans processeur.";
  vraiFauxQuestion8="Les disques durs \npermettent le stockage \ndes données.";
  vraiFauxQuestion9="La mémoire vive permet le \nstockage de données plus \nrapides.";
  vraiFauxQuestion10="Un PC peut ne pas \ncontenir de boîtier.";
  vraiFauxCorrection1="correction du 1";
  vraiFauxCorrection2="correction du 2";
  vraiFauxCorrection3="correction du 3";
  vraiFauxCorrection4="correction du 4";
  vraiFauxCorrection5="correction du 5";
  vraiFauxCorrection6="correction du 6";
  vraiFauxCorrection7="correction du 7";
  vraiFauxCorrection8="correction du 8";
  vraiFauxCorrection9="correction du 9";
  vraiFauxCorrection10="correction du 10";
}

void draw() {
  affichageEcranPrincipal();
  affichageEcranNiveaux();
  testPartieLancee();

  prochainNiveau();

  uniteMonnaie();

  affichageEcran31();
}

void affichageEcranPrincipal() {
  if (affichageEcranPrincipal == true) {

    // barre bleue haut
    fill(0, 70, 200);
    rect(0, 0, 800, 70);

    // barre jaune gauche
    fill(250, 200, 0);
    rect(0, 70, 230, 400);

    // barre blanche bas
    fill(255);
    rect(0, 470, 800, 130);

    // bouton jouer
    fill(255, 0, 0);
    rect(330, 370, 350, 80);

    // CONTOURS
    noFill();
    stroke(0);
    strokeWeight(7);

    // contours pour bleu
    rect(2, 2, 178, 70); // gauche
    rect(180, 2, 480, 70); // milieu
    rect(660, 2, 136, 70); // droite

    // contour pour jaune
    rect(2, 72, 230, 400);

    // contour pour blanc
    rect(2, 472, 794, 124);

    // bordure droite
    line(796, 72, 796, 470); // compléter la bordure

    // contour pour rouge
    rect(330, 370, 350, 80);

    // nom du jeu
    fill(255);
    textSize(30);
    text("_CONFIGOMATOR_", 284, 47);

    // texte jouer
    textSize(50);
    text("JOUER", 430, 427);

    // AFFICHAGE INFOS
    afficherCapital();
    afficherNiveauEnCours();
    afficherTexteBulle(); // encore à faire

    // IMAGES
    image(persoConfigo, 30, 440);
  }
}

void afficherCapital() {    // affiche en temps réel l'argent possédé
  fill(255);
  textSize(30);
  text(nf(capitalAffiche, 0, 1) + " " + uniteMonnaie + "$", 30, 50);
}

void afficherNiveauEnCours() { // affiche en temps réel le niveau en cours
  fill(255);
  textSize(30);
  text(niveauEnCours, 700, 50);
}

void afficherTexteBulle() { // en chantier
  fill(0);
  textSize(20);
  text("Bienvenue sur le jeu _CONFIGOMATOR_ ! \nClique sur le  bouton jouer pour relever le premier défi :)", 
    185, 527);
}

void testPartieLancee() {
  if (mouseX >= 330 && mouseX <= 680 && mouseY >= 370 && mouseY <= 450 
    && affichageEcranPrincipal == true && mousePressed==true) {
    partieLancee = true ;
    print(25);
  }
}
