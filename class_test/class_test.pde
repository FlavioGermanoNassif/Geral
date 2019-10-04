pont[] linha = new pont[15];

void setup() {
  size(500, 500);
  for(int i = 0; i < linha.length; i++){
    linha[i] = new pont();
  }
  
}

void draw() {
  background(225);
  for(int i = 0; i < linha.length; i++){
    linha[i].calc();
    linha[i].show();   
  }

}
