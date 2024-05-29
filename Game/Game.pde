
Player p1;
int speed = 10;
float easing = 0.05;
PImage img;
PImage img2;
boolean seedMode = true;
boolean waterMode = false;
//click on something to change mode, implement later
Crops selectedCrop = new Wheat();
//click to change crop, implement later
Farm farm = new Farm();
void draw(){
  background(173,206,118);
  fill(155,103,60);//brown
  square(0, -500, 1000);
  fill(135, 206, 250);//blue
  square(0, -700, 1000);
  image(img, 100, 600);
  //image(img, 550, 600); for when we get shop working
  image(img2, 700, 100);
  p1.render();
  //p1.move();
  p1.update();
  drawFarm();
}

void drawFarm(){
  int x = 135;
  int y = 620;
  PImage seed = loadImage("seeds.png");
  //mouseX > 100 && mouseX < 650 && mouseY > 600 && mouseY < 880
  for(int i = 0; i < farm.getLength(); i ++){
    for(int j = 0; j < farm.getLength(); j ++){
      if(farm.getCrop(i, j) != null){
        image(seed, x, y, 80, 80);
      }
      x+=70;
    }
    x = 135; 
    y+=50;
  }
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

void mouseClicked(){
  if(seedMode){
    if (mouseX > 100 && mouseX < 650 && mouseY > 600 && mouseY < 880){
      print("you've sucessfully planted a seed!"); // debugging statement
      farm.plantSeed(selectedCrop);
      drawFarm();
    }
  }
}

void setup(){
  size(1000,1000);
  p1 = new Player(width/2,height/2);
  img = loadImage("farmplot.png");
  img2 = loadImage("firsthouse.png");
}
