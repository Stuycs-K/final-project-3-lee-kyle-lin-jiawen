
Player p1;
int speed = 10;
PImage img;
PImage img2;
float easing = 0.05;
void draw(){
  background(173,206,118);
  fill(255);
  square(0, -500, 1000);
  fill(255);
  square(0, -800, 1000);
  image(img, 100, 600);
  image(img2, 700, 100);
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
  size(1000,1000);
  p1 = new Player(width/2,height/2);
  img = loadImage("farmplot.png");
  img2 = loadImage("firsthouse.png");
}
