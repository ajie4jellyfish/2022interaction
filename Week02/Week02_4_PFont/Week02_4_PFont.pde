void setup(){
 size(500,500); 
 PFont font=createFont("標楷體",40);
 textFont(font);
}
int w=30;
void draw(){
  drawPokerCard(100,100,"黑桃4");
  drawPokerCard(130,150,"紅心5");
  drawPokerCard(160,200,"方塊7");
  drawPokerCard(190,250,"梅花K");
}
void drawPokerCard(int x,int y,String face){
  fill(255);
  rect(x-w/2,y-w/2,150+w,250+w,20);
  fill(#FAD7D7);
  rect(x,y,150,250,20); 
  fill(0);
  textSize(25);
  text(face,x+10,y+40);
}
