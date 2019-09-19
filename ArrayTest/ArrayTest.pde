float[] lines;
int j = 0, l = 255;

void setup() {
  size(600, 600); 
  lines = new float [width];

  for (int i = 0; i < lines.length; i ++) {
    lines[i] = random(0, height);
  }
  background(0);
}

void draw() {

  if (j < lines.length) {
    stroke(l);
    line(j, height, j, lines[j]);
    j++;
  } else {
    for ( int i = 0; i < lines.length; i++) {
      lines[i] = random( 0, height);
      j = 0;
      background(0);    
      l -= random(30, 70);
    }


    if (l > 0) {
      l = 255;
    }
  }
}
