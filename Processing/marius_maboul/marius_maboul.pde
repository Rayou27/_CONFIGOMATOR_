int mx, my;

color bordure = color(0);
color chemin = color(255);
color colorPicker;

boolean bordureTouchee=false;
boolean partiePerdue=true;

PImage premiereMap;


void setup() {
  size(800, 600);
  background(155, 155, 0);
  premiereMap = loadImage("Frame 1.png");
  mx = constrain(mx, 400, 760);
}


void draw() {
  afficher41();
  recupPixel();
  testBordure();
  etatNiveau();
  bille();
}

void afficher41() {
  background(155, 155, 0);
  image(premiereMap, 400, 0);
}

void bille() {
  noCursor();
  if (bordureTouchee!=true) {
    if (mouseX>400&&mouseX<760) {
      mx=mouseX;
      my=mouseY;
    }
    fill(255, 0, 0);
    ellipse(mx, my, 5, 5);
  }
}
void recupPixel() {
  colorPicker=premiereMap.get(mx-400, my);
}

void testBordure() {
  if (colorPicker==bordure) {
    bordureTouchee=true;
  }
}

void etatNiveau() {
  if (bordureTouchee==true) {
    textSize(30);
    text("perdu", 50, 50);
    bordureTouchee=false;
    partiePerdue=true;
  }
}
