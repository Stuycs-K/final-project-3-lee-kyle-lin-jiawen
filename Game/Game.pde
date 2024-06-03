int circleX, circleY; 
int circleSize = 93;
color circleColor, circleHighlight;
boolean circleOver = false;
Player p1;
int speed = 10;
float easing = 0.05;
PImage img;
PImage img2;
PImage inventory;
PImage sky;
PImage grass;
PImage pond;
boolean seedMode = true;
boolean waterMode = false;
int water = 0;
//
//
//click on something to change mode, implement later
Crops selectedCrop = new Wheat();
//click to change crop, implement later
Farm farm = new Farm();
void draw(){
  background(173,206,118);
  image(grass, 0, 500);
  fill(155,103,60);//brown
  square(0, -500, 1000);
  fill(135, 206, 250);//blue
  square(0, -700, 1000);
  image(sky, 0, 0);
  image(img, 100, 600);
  //image(img, 550, 600); for when we get shop working
  image(img2, 700, 100);
  image(pond, -250, 250);
  image(inventory, 0,20);
  drawFarm();
  p1.render();
  //p1.move();
  p1.update();
  drawFarm();
  //
  update(mouseX, mouseY);
  if (circleOver) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
  stroke(0);
  ellipse(circleX, circleY, circleSize, circleSize);
}
void keyPressed(){
  seedMode= !(seedMode);
  waterMode = !(waterMode);
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
  textSize(30);
  fill(0);
  text("water: "+water, 750, 900);
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
  if (circleOver) {
    seedMode = !seedMode;
    waterMode = !waterMode;
    System.out.println("Seed Mode is: " + seedMode);
    System.out.println("Water Mode is: " + waterMode);
  }
}

void mouseClicked(){
  if(seedMode){
    if (mouseX > 100 && mouseX < 400 && mouseY > 600 && mouseY < 880){
      print(farm.plantSeed(selectedCrop));
      PImage planting = loadImage("planting.png");
      p1.changeSprite(planting);
      p1.render();
      drawFarm();
    }
  }
  if(waterMode){
    if (mouseX > 100 && mouseX < 400 && mouseY > 600 && mouseY < 880){
      if(water>0){
        water--;
        print(farm.water());
        PImage watering = loadImage("watering.png");
        p1.changeSprite(watering);
        p1.render();
        drawFarm();
      }
      else{
        print("There's no water in the bucket! Please fetch more water.");
      }
    }
  }
  else{
    p1.changeSprite(loadImage("player.png"));
  }
}

void setup(){
  size(1000,1000);
  p1 = new Player(width/2,height/2);
  img = loadImage("farm.png");
  img2 = loadImage("firsthouse.png");
  sky = loadImage("sky.jpg");
  inventory = loadImage("Inventory.png");
  sky.resize(1000, 300);
  grass = loadImage("grassbetter.png");
  grass.resize(1000, 500);
  pond = loadImage("pond.png");
  
  //
  circleColor = color(53, 95, 59);
  circleHighlight = color(204);
  circleX = 800;
  circleY = 800;
  ellipseMode(CENTER);
}
void update(int x, int y) {
  
  if (overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
    
  } 
  else{
    circleOver = false;
  }
}
boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
