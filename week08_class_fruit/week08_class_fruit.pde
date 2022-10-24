
class Fruit{
 float x,y,vx,vy;
 boolean flying;
 PApplet sketch;//讓random可以用
 Fruit(PApplet _sketch){
  sketch= _sketch;//讓random可以用
  reset();
 }
 void reset(){
  x=sketch.random(100.0,300.0);//讓random可以用
  y=300;
  vx=sketch.random(-2,+2);//讓random可以用
  vy=-13;
  flying = true;
 }
 void update(){
  x+=vx;
  y+=vy;
  vy+=0.98/3;
 }
}
Fruit fruit;
void set(){
 size(400,300);
 fruit=new Fruit(this);//讓random可以用
}
void draw(){
   background(255,255,0);
   ellipse(fruit.x,fruit.y,50,50); 
   fruit.update();
}
void keyPressed(){
 fruit.reset(); 
}
