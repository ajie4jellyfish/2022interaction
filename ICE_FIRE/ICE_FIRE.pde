PImage imgFloor;
void setup(){
 size(1050,784);
 imgFloor = loadImage("01.png");
 myFindAllC();
}
void myFindAllC(){
 imgFloor.loadPixels();
 for(int i = 0 ; i<imgFloor.width*imgFloor.height; i++){
  if(red(imgFloor.pixels[i])>254 && green(imgFloor.pixels[i])>227 && blue(imgFloor.pixels[i])>180)imgFloor.pixels[i]=color(255,228,181);
  else imgFloor.pixels[i]=color(0);
 }
 imgFloor.updatePixels();
}
int userX=100,userY=700;
int userVX=0,userVY=1;
void draw(){
 background(imgFloor); 
 ellipse(userX,userY,10,10);
 if (userVX==1 || userVX==-1){
  for(int k =0;k<4;k++){
   int i=calci(userX+userVX, userY-k );
   if(imgFloor.pixels[i]==color(0)){
    userX += userVX;
    userY-=k;
    break;
   }
  }
 }
 if(userVY==1){
  int i=calci(userX,userY+1);
  if(imgFloor.pixels[i]==color(0)) userY++;
 }
}
int calci(int x, int y){
 return y*imgFloor.width + x; 
}
void keyPressed(){
 if(keyCode==RIGHT) userVX=1;
 if(keyCode==LEFT) userVX=-1;
}

void keyReleased(){
  if(keyCode==RIGHT || keyCode==LEFT) userVX=0;
}
