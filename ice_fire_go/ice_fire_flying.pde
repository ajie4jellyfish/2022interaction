PImage imgFloor;
void setup() {
  size(1050, 784); //跟圖片一樣大
  imgFloor = loadImage("01.png");//讀入圖片
  PFont font = createFont("標楷體", 30);
  textFont(font);
  textAlign(CENTER, CENTER);
  myFindAllC();
}
void myFindAllC() {
  imgFloor.loadPixels();
  for (int i = 0; i<imgFloor.width*imgFloor.height; i++) {//找color(255,228,181)，劃出地圖
    if (red(imgFloor.pixels[i])>254 && green(imgFloor.pixels[i])>227 && blue(imgFloor.pixels[i])>180)imgFloor.pixels[i]=color(255, 228, 181);
    else if (red(imgFloor.pixels[i])>114 && green(imgFloor.pixels[i])>254 && blue(imgFloor.pixels[i])>218)imgFloor.pixels[i]=color(115, 255, 219);//岩漿
    else if (red(imgFloor.pixels[i])>254 && green(imgFloor.pixels[i])>170 && blue(imgFloor.pixels[i])>6)imgFloor.pixels[i]=color(255, 171, 7);//水
    else if (red(imgFloor.pixels[i])>116 && green(imgFloor.pixels[i])>249 && blue(imgFloor.pixels[i])>96)imgFloor.pixels[i]=color(117, 250, 97);//綠水
    else if (red(imgFloor.pixels[i])>188 && green(imgFloor.pixels[i])<23 && blue(imgFloor.pixels[i])<30)imgFloor.pixels[i]=color(189, 22, 29);//紅門
    else if (red(imgFloor.pixels[i])<14 && green(imgFloor.pixels[i])<71 && blue(imgFloor.pixels[i])>178)imgFloor.pixels[i]=color(13, 70, 179);//藍門
    else imgFloor.pixels[i]=color(0);//其他填黑色
  }
  imgFloor.updatePixels();
}
int userX=100, userY=700, user2X=100, user2Y=600;//user跟user2的位置
float userVX=0, userVY=1, user2VX=0, user2VY=1;//user跟user2移動
int squ=280 ,squ2=95;
void draw() {
  background(imgFloor);
  //stroke(255,0,0);
  strokeWeight(3);
  //line(840,90,915,165);
  back();
  Red();
  Blue();
  door(); 
  if(user2X>930 && user2Y<200 && userX>930 && userY<200){ 
    over_game(100,300,800,300,150,500,400,"通關成功");
    over_game(440,530,120,50,30,500,550,"按R重新");
  }
}
void door(){
  stroke(100,63,250);
  noFill();
  rect(900,70,90,95);
}
void over_game(int x,int y,int z,int q,int s,int w,int h,String over){
  stroke(100,63,250);
  fill(#FFEFE0);
  rect(x,y,z,q);
  //rect(450,530,100,50);
  fill(0);
  textSize(s);
  text(over,w,h);
}
void Blue(){
  stroke(0,0,255);
  fill(#82D5F2);
  ellipse(user2X, user2Y, 30, 30);
  rect(480,squ,30,20);
  if (user2VX==1 || user2VX==-1) {//藍左右
    for(int b = 0; b < 6; b++){
      for (int z = 0; z < 4 ; z++) {
        int i=calci(int(user2X+user2VX), user2Y-z );
        if (imgFloor.pixels[i]==color(0)) {
          user2X += user2VX;
          user2Y -= z;
          break;
        }
      }
    }
  }
  if( user2VY>0){//藍跳
    for (int k=1; k<=user2VY; k++) {
      int i =calci(user2X, int(user2Y+1) );
      if( imgFloor.pixels[i]==color(0) ){
        user2Y ++;
      }else flying2=false;
    }
    user2VY += 0.98;
  }else if( user2VY<0 && flying2){
    for (int k=1; k<=-user2VY; k++) {
      int i = calci(user2X, int(user2Y-1) );
      if(  imgFloor.pixels[i]==color(0) ){
        user2Y --;
      }
    }
    user2VY += 0.98;
  }
  if(squ==290){//藍機關
    if(userX>160 && userX<215 && userY > 253 && userY<330){
      userY=254;
    }
  }
  if(user2X < 520 && user2X > 480 && user2Y >200 && user2Y<330){
    squ=290;
    stroke(100,63,250);
    fill(#B7A7FA);
    rect(168,253,40,40);//170
  }else{
    squ=280;
  }
}
void Red(){
  stroke(255,0,0);
  fill(255,188,204);
  ellipse(userX, userY, 30, 30);//紅圈(弟弟)
  rect( 300,squ2,30,20);
  if (userVX==1 || userVX==-1) {//紅左右
    for(int a = 0; a < 6; a++){
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
  if(userX>300 && userX<340 && userY>90 && userY<130){//按下機關
   squ2=110; 
   stroke(100,63,250);
   fill(#B7A7FA);
   rect(168,253,40,40);
  }else{
     squ2=95;
  }
  if(squ2==110){
    if(user2X>160 && user2X<215 && user2Y > 253 && user2Y<330){
      user2Y=254;
    }
  }
}
void back(){//藍碰岩漿/紅碰水/藍或紅碰綠水，都重新
  if(userX>705 && userX<815 && userY>745){//紅碰水
    userX=100;
    userY=700;
  }
  if(userX>650 && userX<765 && userY>580 && userY<610){//紅碰綠水
    userX=100;
    userY=700;
  }
  if(user2X>650 && user2X<765 && user2Y>580 && user2Y<610){//藍碰綠水
    user2X=100;
    user2Y=600;
  }
  if(user2X>490 && user2X<610 && user2Y>745){//藍碰岩漿
    user2X=100;
    user2Y=600;
  }
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
  if (keyCode=='D') user2VX=1;
  if (keyCode=='A') user2VX=-1;
  if (keyCode=='W' && flying2==false){
    user2VY=-12;
    flying2=true;
  }
  if (keyCode=='R'){    
    setup();
    draw();
  }
}

void keyReleased() {
  if (keyCode==RIGHT || keyCode==LEFT) userVX=0;
  if (keyCode=='D' || keyCode=='A') user2VX=0;
}
