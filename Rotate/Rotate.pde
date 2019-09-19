float alf = 0;
float n = 1;
void setup() {
  size(600, 600);
}

void draw() {

  pushMatrix();
  translate(width/2, height/2);
  alf = alf + n;
  rotate(degrees(alf));

  float fla = map(alf, 0, 255, 0, 255);
  if (alf > 360) {
    alf = 0;
  }

  fill(alf ,fla, random(0,255));
  ellipse(150, 150, width/8, height/8);
  rect(width/15, height/15, height/8,height/8);
  

  popMatrix();
}
