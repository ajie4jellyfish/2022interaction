PImage imgFloor;
void setup() {
  size(1050, 784); //跟圖片一樣大
  imgFloor = loadImage("01.png");//讀入圖片
  myFindAllC();
}
void myFindAllC() {
  imgFloor.loadPixels();
  for (int i = 0; i<imgFloor.width*imgFloor.height; i++) {//找color(255,228,181)，劃出地圖
    if (red(imgFloor.pixels[i])>254 && green(imgFloor.pixels[i])>227 && blue(imgFloor.pixels[i])>180)imgFloor.pixels[i]=color(255, 228, 181);
    else imgFloor.pixels[i]=color(0);//其他填黑色
  }
  imgFloor.updatePixels();
}
int userX=100, userY=700, user2X=100, user2Y=600;//user跟user2的位置
float userVX=0, userVY=1, user2VX=0, user2VY=1;//user跟user2移動
void draw() {
  background(imgFloor);
  ellipse(userX, userY, 30, 30);//紅圈(弟弟)
  fill(#FC2950);
  if (userVX==1 || userVX==-1) {//紅左右
    for(int a = 0; a < 5; a++){
      for (int k =0; k<4; k++) {
        int i=calci(int(userX+userVX), userY-k );
        if (imgFloor.pixels[i]==color(0)) {
          userX += userVX;
          userY-=k;
          break;
        }
      }
    }
  }
  if( userVY>0){
    for (int k=1; k<=userVY; k++) {
      int i =calci(userX, int(userY+1) );
      if( imgFloor.pixels[i]==color(0) ){
        userY ++;
      }else flying=false;
    }
    userVY += 0.98;
  }else if( userVY<0 && flying){
    for (int k=1; k<=-userVY; k++) {
      int i = calci(userX, int(userY-1) );
      if(  imgFloor.pixels[i]==color(0) ){
        userY --;
      }
    }
    userVY += 0.98;
  }
  //if (userVY==1) {//紅向下
  //  int i=calci(userX, userY+1);
  //  if (imgFloor.pixels[i]==color(0)) userY++;
  //}else{//紅
  //  for (int k=1; k>0; k--) {
  //    int j =calci(userX, int(userY+userVY) );
  //    if (imgFloor.pixels[j]==color(0)) {
  //      userY+=userVY;
  //      break;
  //    }
  //  }
  //}
}
int calci(int x, int y) {
  return y*imgFloor.width + x;
}
boolean flying=false, flying2=false;
void keyPressed() {
  if (keyCode==RIGHT) userVX=1;
  if (keyCode==LEFT) userVX=-1;
  if (keyCode==UP && flying==false){
    userVY=-12;
    flying=true;
  }
}

void keyReleased() {
  if (keyCode==RIGHT || keyCode==LEFT) userVX=0;
  //if (keyCode==UP) userVY=1;
}
