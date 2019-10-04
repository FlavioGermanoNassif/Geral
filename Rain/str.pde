class stor {

  float inY = random(-250, -50);
  float f = 0;
  
  float prof = random(0, 100);
  float inX = random(0, width);
  
  float tam;
  float vel;
  float velC;
  float posIni;
  float posFim;
  float lgot;

  void calc() {

    tam  = map(prof, 0, 100, 20, 10);
    vel  = map(prof, 0, 100, 1 , 20 );
    lgot = map(prof, 0, 100, 1, 3);

    posIni = inY + velC;
    posFim = inY + tam + velC;
  }

  void show() {
    velC = f*vel;
    strokeWeight(lgot);
    stroke(0, 0, 200);
    line(inX, posIni, inX, posFim );
    f++;

    if (posIni > height && posFim > height) {
      f = 0;
    }
  }
}
