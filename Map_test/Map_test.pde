PFont basic;

void setup() {
  size(500, 500);
  basic = createFont("Arial", 20);
}

void draw() {
  background(0);
  noCursor();
  
  stroke(255);
  strokeWeight(4);
  point(mouseX, mouseY);
  
  String posX = "X : " + mouseX;
  String posY = "Y : " + mouseY;
  fill(255);
  text(posX, mouseX + 20, mouseY);
  text(posY, mouseX + 20, mouseY - 10);

  float newX = map(mouseX, 0, width, 0, width/2);
  float newY = map(mouseY, 0, height, 0, height/2);
  stroke(180);
  point(newX, newY);
  
  String posX2 = "X : " + newX;
  String posY2 = "Y : " + newY;
  text(posX2, newX + 20, newY);
  text(posY2, newX + 20, newY - 10);
  
  float newX3 = map(mouseX, 0, width, width, 0);
  float newY3 = map(mouseY, 0, height, height, 0);
  stroke(0,0,255);
  point(newX3, newY3);
  
  String posX3 = "X : " + newX3;
  String posY3 = "Y : " + newY3;
  fill(0,0,255);
  text(posX3, newX3 + 20, newY3);
  text(posY3, newX3 + 20, newY3 - 10);  
}
