stor[] lines = new stor[600];

void setup() {
  size(800, 400);
  for (int i = 0; i < lines.length; i++) {
    lines[i] = new stor();
  }
}

void draw() {  
  background(210);  
  for (int i = 0; i < lines.length; i++) {
    lines[i].calc();
    lines[i].show();
  }
}
