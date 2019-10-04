class pont{
  float inX = width/2;
  float inY = height/2;
  float finX, finY;
  Boolean dir = true;;
  
  pont(){
    finX = random(0, width );
    finY = random(0, height);
  }
  
  void calc(){
   if (finX > width){
     dir = false;
   }else if (finX < 0 ){
     dir = true;
   }
   if (dir == true){
     finX += 2;
   } else if(dir == false){
     finX -= 2;
   } 
  }
  
  void show(){
    
   strokeWeight(2.5); 
   stroke(0);
   line(inX, inY, finX, finY);
   
      
  }
}
  
