int f = 0;
int g = 0;
float k = 10;
int scl = 3;

PImage spr1;
PImage spr2;
PImage spr3;
PImage spr11;
PImage spr22;
PImage spr33;
void setup() {
  size(500, 200);
  frameRate(15);
  spr1 = loadImage("chara-1.png");
  spr2 = loadImage("chara-2.png");
  spr3 = loadImage("chara-3.png");
  spr11 = loadImage("chara-11.png");
  spr22 = loadImage("chara-22.png");
  spr33 = loadImage("chara-33.png");
}
void draw() {
  background(0);
pushMatrix();
scale(scl);
  if (g == 0) {
    if (f == 2) {
      image(spr3, k, 10);
    }
    if (f == 1) {
      image(spr2, k, 10);
    }
    if (f == 0) {
      image(spr1, k, 10);
    }
    if (f == 0 || f == 1) {
      f++;
    } else if (f == 2) {
      f = 0;
    }
  }
  if (g == 1) {
    if (f == 2) {
      image(spr33, k, 10);
    }
    if (f == 1) {
      image(spr22, k, 10);
    }
    if (f == 0) {
      image(spr11, k, 10);
    }
    if (f == 0 || f == 1) {
      f++;
    } else if (f == 2) {
      f = 0;
    }
  }
  if ( g == 0) {
    k = k+5;
    if (k > width/scl - 30) {
      g = 1;
    }
  } 
  if (g == 1) {
    k = k - 5;
    if (k == 10) {
      g = 0;
    }
  }
  popMatrix();
}
