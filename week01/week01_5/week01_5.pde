void setup(){
  size(500,500);
  background(#FFFCE8);
  stroke(0,0,0);
}
void draw(){
  if(mousePressed){
   line(mouseX,mouseY, pmouseX,pmouseY);
  }
}
void keyPressed(){
 if(key =='1') stroke(#FF5876);
 if(key =='2') stroke(#FF8758);
 if(key =='3') stroke(#FAED72);
 if(key =='4') stroke(#72FA99);
 if(key =='5') stroke(#8FFCF2);
 if(key =='6') stroke(#6BA1FC);
 if(key =='7') stroke(#986BFC);
}
