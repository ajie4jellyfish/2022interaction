void setup(){
 size(500,500); 
}
int w=30;
void draw(){
  drawCard(100,100);
  drawCard(130,130);
  drawCard(160,160);
}
void drawCard(int x,int y){
  fill(255);
  rect(x-w/2,y-w/2,150+w,250+w,20);
  fill(#FAD7D7);
  rect(x,y,150,250,20); 
}
