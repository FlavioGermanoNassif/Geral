PFont font;
float scl = 10;
int K = 0;
int sit = 0 ;
float p = 1, q = 0, r = 0;

boolean PM = true;
boolean Triangulo = true;


float 
  x1 = -2, x2 = 28, x3 = 13, 
  y1 = 0, y2 = 0, y3 = 26; 

void setup() {
  size(800, 800);
  //fullScreen();
  background(225);
  font = createFont("Arial", 10);

  stroke(200);
  strokeWeight(3);
  line(width /2, height, width /2, 0); 
  line(width, height/2, 0, height /2);

  int n = 100;
  int linXp = width/2;
  int linXn = width/2;
  int linYp = height/2;
  int linYn = height/2;

  if (Triangulo == false) {
    PM = false;
  }

  for (int i = 0; i < n; i++) {
    stroke(0, 0, 0, 50);
    line(width /2 - 5, linYp, width /2 + 5, linYp);
    linYp = linYp - 20;

    line(width /2 - 5, linYn, width /2 + 5, linYn);
    linYn = linYn + 20;

    line(linXp, height /2 - 5, linXp, height/2 + 5);
    linXp = linXp + 20;

    line(linXn, height /2 - 5, linXn, height/2 + 5);
    linXn = linXn - 20;

    String Yp = "" + linYp / scl;
    fill(100);
    textSize(8);
    text(Yp, width/ 2 + 7, height/2 - linYp);

    String Xn = "-" + (linXp - height/2)/scl;
    text(Xn, 0 + linXn - 8, height/2 + 20);
    String Xp = "" + (linXp - height/2)/scl;
    text(Xp, 0 + linXp - 8, height/2 + 20);
  }
}

void draw() {
  fill(255);
  stroke(0);
  strokeWeight(1);
  rect(10, 10, 150, 120);

  float Dab = dist(x1 * scl, -y1 * scl, x2 * scl, -y2 * scl);
  float Dac = dist(x1 * scl, -y1 * scl, x3 * scl, -y3 * scl);
  float Dbc = dist(x2 * scl, -y2 * scl, x3 * scl, -y3 * scl);
  int Dabc = (int) Dab;
  int Dacc = (int) Dac;
  int Dbcc = (int) Dbc;
  String eDab = "Dab =" +Dabc / scl;
  String eDac = "Dac =" +Dacc / scl;
  String eDbc = "Dbc =" +Dbcc / scl;

  fill(0);
  int L = 20;
  textSize(12);
  text(eDab, 12, L);
  L = L + 10;
  text(eDac, 12, L);
  L = L + 10;
  text(eDbc, 12, L);
  L = L + 10;

  if (Triangulo == true) {
    if (Dabc == Dacc && Dabc != Dbcc || Dabc == Dbcc && Dabc !=  Dacc || Dacc == Dbcc && Dacc != Dabc) {
      String Defin = "Triang isoceles";
      text(Defin, 12, L);
    } else if (Dabc == Dacc && Dacc == Dbcc) {
      String Defin = "Triang equilatero";
      text(Defin, 12, L);
    } else if (Dabc != Dacc && Dacc != Dbcc) {
      String Defin = "Triang escaleno";
      text(Defin, 12, L);
    }
  }


  pushMatrix();
  translate(width /2, height /2);

  float Bx =  ((x1 + x2 + x3)*scl)   /3;
  float By = -(scl *(y1 + y2 + y3))  /3;
  float pxAB =  (x1*scl   + x2*scl ) /2;
  float pyAB = -(y1 * scl + y2*scl ) /2;
  float pxAC =  (x1*scl   + x3*scl ) /2;
  float pyAC = -(y1 * scl + y3*scl ) /2;
  float pxBC =  (x3*scl   + x2*scl ) /2;
  float pyBC = -(y3 * scl + y2*scl ) /2;

  strokeWeight(7);
  stroke(255, 0, 0);
  point(x1 * scl, -y1 * scl);
  String cordA = "A " + "( " + x1 + " , "+ y1 + " )";
  fill(255, 0, 0);
  textSize(13);
  text(cordA, x1 * scl + 10, -y1 * scl);

  strokeWeight(7);
  stroke(0, 0, 255);
  point(x2 * scl, -y2 * scl); 
  String cordB = "B " + "( " + x2 + " , "+ y2 + " )";
  fill(0, 0, 255);
  textSize(13);
  text(cordB, x2 * scl + 10, -y2 * scl);

  strokeWeight(7);
  stroke(0, 120, 120);
  point(x3 * scl, -y3 * scl);
  String cordC = "C " + "( " + x3 + " , "+ y3 + " )";
  fill(0, 120, 120);
  textSize(13);
  text(cordC, x3 * scl + 10, -y3 * scl);

  if ( K == 0) {
    if (PM == true) {
      stroke(0, 0, 0, 180);    
      strokeWeight(5);

      point(pxAB, pyAB);
      point(pxAC, pyAC); 
      point(pxBC, pyBC);
      point(Bx, By);

      strokeWeight(1);

      line(x1 * scl, -y1 * scl, pxBC, pyBC);
      line(x2 * scl, -y2 * scl, pxAC, pyAC);
      line(x3 * scl, -y3 * scl, pxAB, pyAB);
    }
  }

  if (mousePressed) {
    if (Triangulo == true) {
      int Bxu = (int) Bx;
      int Byu = (int) By;

      //String EscrG = "G (" + Bxu / scl + " , " + Byu / scl + " )"; 
      //text(EscrG, Bxu / scl + 30, Byu);
      popMatrix();
      fill(0);
      String pAB = "PontoAB   (" + pxAB / scl + " , " + -pyAB  / scl + ")" ;
      String pAC = "PontoAC   (" + pxAC / scl + " , " + -pyAC  / scl + ")" ;
      String pBC = "PontoBC   (" + pxBC / scl + " , " + -pyBC  / scl + ")" ;
      String pB = "Baricentro (" + Bxu / scl  + " , " + -Byu   / scl + ")" ;
      textSize(12);
      text(pAB, 12, L + 12);
      text(pAC, 12, L + 24);
      text(pBC, 12, L + 36);
      text(pB, 12, L + 48);
      pushMatrix();
      translate(width /2, height /2);
    }
  }

  //if (sit == 0) {
  //  strokeWeight(1);
  //  float mab = ((x1 - x2) * scl) / ((y1 - y2) * scl);
  //  float mabt = -1 / mab;
  //  q = mabt * p;

  //  float mac = ((x1 - x3) * scl) / ((y1 - y3) * scl);
  //  float mact = -1 / mac;
  //  r = mact * p; 

  //    line(pxAB, pyAB, pxAB + q, pyAB - p);
  //    line(pxAC, pyAC, pxAC + r, pyAC - p);
  //  p++;
  //}

  if (K == 0) {
    if ( Triangulo == true) {
      stroke(0);
      strokeWeight(1);
      fill(216, 191, 216, 50);
      triangle(x1 * scl, -y1 * scl, x2 * scl, -y2 * scl, x3 * scl, -y3* scl);
    }
    K++;
  }
  popMatrix();
}
