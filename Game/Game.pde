
Player p1;
int speed = 10;
float easing = 0.05;
void draw(){
  background(255);
  p1.render();
  //p1.move();
  p1.update();
}

void mousePressed() {
  //p1.setX(mouseX);
  //while (p1.getX() < mouseX){
    //p1.setX(p1.getX()+speed);
    //delay(10);
  //}
  //while (p1.getX() > mouseX){
    //p1.setX(p1.getX()-speed);
    //delay(10);
  //}
  //p1.setY(mouseY);
  p1.setTarget(mouseX, mouseY);
}

void setup(){
  size(800,800);
  p1 = new Player(width/2,height/2);
  
}
