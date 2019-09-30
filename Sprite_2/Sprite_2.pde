int f = 0; 
float  maxR = 1, maxG = 8, maxB = 1;
float  minR = 0, minG = 5, minB = 0;
float fire = 0;
float posXf1 = 0, 
  posYf1 = 10;
float posXf2 = 0, 
  posYf2 = 10;

float firewY1;
float firewY2;

Boolean ind = true;
Boolean fin = false;

float posR = 10;
float posG = 10;
float posB = 10;

float scl = 2;
float fatG = 0;

PImage sprR1;
PImage sprR2;
PImage sprR3;

PImage sprG1;
PImage sprG2;
PImage sprG3;

PImage sprB1;
PImage sprB2;
PImage sprB3;

PImage chegada;
PImage foguete;

void setup() {
  size(1200, 310);
  frameRate(15);
  sprR1 = loadImage("charaR-1.png");
  sprR2 = loadImage("charaR-2.png");
  sprR3 = loadImage("charaR-3.png");

  sprG1 = loadImage("charaG-1.png");
  sprG2 = loadImage("charaG-2.png");
  sprG3 = loadImage("charaG-3.png");

  sprB1 = loadImage("charaB-1.png");
  sprB2 = loadImage("charaB-2.png");
  sprB3 = loadImage("charaB-3.png");

  chegada = loadImage("nchegada.png");
  foguete = loadImage("firework.png");
}
void draw() {

  pushMatrix();
  scale(scl);

  float chegd = width/scl - 50;

  if (ind == true) {
    background(225);

    line(0, 50, chegd, 50);
    line(0, 100, chegd, 100);
    image(chegada, chegd, 0);
    if (f == 2) {
      image(sprR3, posR, 10);
      image(sprG3, posG, 60);
      image(sprB3, posB, 110);
    }
    if (f == 1) {
      image(sprR2, posR, 10);
      image(sprG2, posG, 60);
      image(sprB2, posB, 110);
    }
    if (f == 0) {
      image(sprR1, posR, 10);
      image(sprG1, posG, 60);
      image(sprB1, posB, 110);
    }
    if (f == 0 || f == 1) {
      f++;
    } else if (f == 2) {
      f = 0;
    }

    posR = posR + random(minR, maxR);
    if (maxR < 10) {
      maxR += 0.26;
      minR = minR + 0.05;
    }
    fatG = random (minG, maxG);
    posG = posG +fatG;
    maxG -= 0.45;

    posB = posB + random(-3, 12);
  }
  if (posR > chegd + 40|| posG > chegd + 40|| posB >chegd + 40) {
    ind = false;
  }

  if (ind == false) {
    background(225);
    stroke(0);
    fill(255, 197, 72);
    rectMode(CENTER);
    rect(width/ (2*scl), height/scl, 50, 230);

    fill(208, 205, 197);
    rect(width/ (2*scl) - 100, height/scl, 50, 180);

    fill(175, 140, 58);
    rect(width/ (2*scl) + 100, height/scl, 50, 130);

    int i = 0;
    if (posR > posB && posR > posG) {
      image( sprR1, width/(2*scl) - 15, 10); // vermelho ganhou
      i = 0;
    } else if (posG> posR && posG > posB) {
      image( sprG1, width/(2*scl) - 15, 10); // verde ganhou
      i = 1;
    } else if (posB > posR && posB > posG) {
      image( sprB1, width/(2*scl) - 15, 10); // azul ganhou
      i = 2;
    }

    if (i == 0 && posG > posB) {
      image( sprG1, width/(2*scl)-115, 35);
      image( sprB1, width/(2*scl)+85, 60);
    } else if (i == 0 && posB > posG) {
      image( sprB1, width/(2*scl)-115, 35);
      image( sprG1, width/(2*scl)+85, 60);
    }

    if (i == 1 && posR > posB) {
      image( sprR1, width/(2*scl)-115, 35);
      image( sprB1, width/(2*scl)+85, 60);
    } else if (i == 1 && posB > posR) {
      image( sprB1, width/(2*scl)-115, 35);
      image( sprR1, width/(2*scl)+85, 60);
    }

    if (i == 2 && posR > posG) {
      image( sprR1, width/(2*scl)-115, 35);
      image( sprG1, width/(2*scl)+85, 60);
    } else if (i == 2 && posG > posR) {
      image( sprG1, width/(2*scl)-115, 35);
      image( sprR1, width/(2*scl)+85, 60);
    }

    if (fire == 0) {
      firewY1 = height/scl - posYf1;
      firewY2 = height/scl - posYf2;
      image(foguete, posXf1 + width/(10*scl), firewY1);
      posYf1 += random(3, 5);
      posXf1 +=random(0.1, 0.7) ;
      image(foguete, posXf2 + (width*1.75)/(2*scl), firewY2);
      posYf2 +=random(3, 5);
      posXf2 -=random(0.1, 0.7);
    }
    if (firewY1 < -150 && firewY2 < -150) {
      posYf1 = 0;
      posYf2 = 0;
      posXf1 = 0;
      posXf2 = 0;
    }
  }
  popMatrix();
}
