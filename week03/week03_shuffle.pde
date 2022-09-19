void setup(){
 size(500,500); 
 PFont font=createFont("標楷體",40);
 textFont(font);
 myShuffle();
}
void myShuffle(){
  String[]flower = {"黑桃","紅心","方塊","梅花"};
  face1 = flower[int(random(4))]+int(random(13)+1);
  face2 = flower[int(random(4))]+int(random(13)+1);
  face3 = flower[int(random(4))]+int(random(13)+1);
  face4 = flower[int(random(4))]+int(random(13)+1); 
}
void mousePressed(){
 myShuffle(); 
}
String face1,face2,face3,face4;
void draw(){
  drawPokerCard(100,100,face1);
  drawPokerCard(130,150,face2);
  drawPokerCard(160,200,face3);
  drawPokerCard(190,250,face4);
}
void drawPokerCard(int x,int y,String face){
  int w=30;
  fill(255);
  rect(x-w/2,y-w/2,150+w,250+w,20);
  fill(#FAD7D7);
  rect(x,y,150,250,20); 
  //fill(0);
  if(face.indexOf("黑桃") == -1 && face.indexOf("梅花") == -1) fill(#FF0000);
  else fill(0);
  textSize(25);
  text(face,x+10,y+40);
}
