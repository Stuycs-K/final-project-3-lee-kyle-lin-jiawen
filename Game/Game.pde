import processing.sound.*;
SoundFile music;
int circleX, circleY; 
int circleSize = 43;
color circleColor, circleHighlight;
boolean circleOver = false;
int newCircleX, newCircleY; 
int newCircleSize = 43;
boolean newCircleOver = false;
Player p1;
int speed = 10;
float easing = 0.05;
PImage img;
PImage img2;
PImage npc;
PImage inventory;
PImage sky;
PImage grass;
PImage box;
PImage pond;
PImage gold;
PImage heart;
PImage shop;
PImage can;
PImage seedling;
PImage seed;
PImage playerSprite;
PImage dirt;
PImage waterbar;
boolean seedMode = false;
boolean waterMode = false;
int water = 20;
Harvest crop;
int hearts = 0;
Coins balance;
Inventory pinventory;
boolean shopMenuOpen = false;
Shop theShop;
Textbox textbox = new Textbox();
boolean hasCan = false;
boolean hasSeeds = false;
boolean Starting = true;
PImage title;
int ShopX, ShopY; 
int ShopSize = 43;
boolean ShopOver = false;
//
//
//click on something to change mode, implement later
Crops selectedCrop = new Wheat();
//click to change crop, implement later
Farm farm = new Farm();
void draw(){

  if (!Starting){
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
    image(dirt,0,-50);
    image(pond, -250, 250);
    image(inventory, 0,20);
    image(gold,670,-25);
    image(waterbar,670,15);
    shop.resize(300,200);
    image(shop,200,150);
    drawFarm();
    p1.render();
    //p1.move();
    p1.update();
    drawFarm();
    if(shopMenuOpen){
      textSize(30);
      fill(0);
      text("Press 1 to buy Water", 100, 140);
      text("Press 2 to buy Seeds", 400, 140);
    }
    if(pinventory.inInventory("Watering Can")){
      can.resize(60,60);
      image(can,10,30);
    }
    if(pinventory.inInventory("Seeds")){
      seedling.resize(30,30);
      image(seedling,70,45);
    }
    if(pinventory.inInventory("Harvest")){
      seed.resize(65,65);
      image(seed,100,27);
    }
    //
    update(mouseX, mouseY);
    if (circleOver) {
      fill(circleHighlight);
    } else {
      fill(circleColor);
    }
    stroke(0);
    //ellipse(newCircleX, newCircleY, circleSize, circleSize);
    box = loadImage("dialouge.png");
    box.resize(650,550);
    image(box, 410, 300);
    textbox.display();
    playerSprite = loadImage("player.png");
    playerSprite.resize(100, 150);
    image(playerSprite, 830, 620);

  }
  else{
    image(title,0,0);
  }
}
void keyPressed(){
  if (key == 's' || key == 'S') {
    shopMenuOpen = !shopMenuOpen;
  }
  if (key == '1' && shopMenuOpen) {
    theShop.buyItem("Watering Can");
    hasCan = true; 
  }
  if (key == '2' && shopMenuOpen) {
    theShop.buyItem("Seeds");
    hasSeeds = true;
  }
  if (key == '3' && shopMenuOpen) {
    if(pinventory.inInventory("Harvest")){
      textbox.update("You sold 1 crop\nand got 25 \ncoins!");
      balance.addCoins(-25);
      pinventory.removeItem("Harvest");
    }
    else{
      textbox.update("You don't have\ncrops, go grow\nsome.");
    }
  }
  if (key == 'w' || key == 'W') {
    seedMode= false;
    waterMode = true;
  }
  if (key == 'p' || key == 'P') {
    seedMode= true;
    waterMode = false;
  }

  if (key == 'e'){
    Starting = false;

  if (key == '0') {
    if(balance.getCoins() >= 100){
      if(hearts == 9){
        balance.addCoins(-100);
        hearts ++;
        textbox.update("You have 10\nhearts with her!\nYou are now friends.\nYou won the game!");
      }
      else{
        textbox.update("You gave her 100\n coins! She said\n 'Thanks, I guess.'");
        balance.addCoins(-100);
        hearts ++;
      } 
    }
    else{
      textbox.update("You are broke.");
    }

  }
}
void drawFarm(){
  int x = 135;
  int y = 620;
  //mouseX > 100 && mouseX < 650 && mouseY > 600 && mouseY < 880
  for(int i = 0; i < farm.getLength(); i ++){
    for(int j = 0; j < farm.getLength(); j ++){
      if(farm.getCrop(i, j) != null){
        if(farm.getCrop(i, j).canHarvest){
          textbox.update("Plant harvested!");
          farm.farmLand[i][j].canHarvest = false;
          farm.farmLand[i][j] = null;
          crop = new Harvest();
          pinventory.addItem(crop);
        }
        else{
          image(seed, x, y, 80, 80);
        }
      }
      x+=70;
    }
    x = 135; 
    y+=50;
  }
  textSize(30);
  fill(0);
  text(water, 765, 105);
  text(balance.getCoins(),760,60);
  text(hearts,760,110);
  text("Press S to Open Shop", 700, 950);
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
  if(mouseX >= 550 && mouseX <= 630 && mouseY >= 250 && mouseY <= 350){
    textbox.update("Press 0 to give her\n 100 coins");
    textbox.display();
  }
  if(mouseX <= 50 && mouseY >=350&&mouseY<=450){
    textbox.update("You got 1 water!");
    water ++;
  }
  if(seedMode){
    if(hasSeeds == false){
        textbox.update("You do not\n have seeds, \nplease buy some!");
      }
    else if (mouseX > 100 && mouseX < 400 && mouseY > 600 && mouseY < 880){
      textbox.update(farm.plantSeed(selectedCrop));
      PImage planting = loadImage("planting.png");
      p1.changeSprite(planting);
      p1.render();
      drawFarm();
    }
  }
  if(waterMode){
    if (mouseX > 100 && mouseX < 400 && mouseY > 600 && mouseY < 880){
      if(hasCan == false){
        textbox.update("You do not/n have a watering/n can, please buy /none!");
      }
      else if(water>0){
        water--;
        textbox.update(farm.water());
        PImage watering = loadImage("watering.png");
        p1.changeSprite(watering);
        p1.render();
        drawFarm();
      }
      else{
        textbox.update("There's no water\n in the bucket! Please\n fetch more water.");
      }
    }
  }
  //npc.resize(80, 100);
  //image(npc, 550, 250);
  else{
    p1.changeSprite(loadImage("player.png"));
  }
  if (circleOver) {
    //seedMode = !seedMode;
    waterMode = !waterMode;
    System.out.println("Seed Mode is: " + seedMode);
    System.out.println("Water Mode is: " + waterMode);
    textbox.update("Seed Mode is: " + seedMode+"\n"+"Water Mode is: " + waterMode);
  }
    if (newCircleOver) {
    seedMode = !seedMode;
    //waterMode = !waterMode;
    System.out.println("Seed Mode is: " + seedMode);
    System.out.println("Water Mode is: " + waterMode);
    textbox.update("Seed Mode is: " + seedMode+"\n"+"Water Mode is: " + waterMode);
  }
}

void setup(){
  size(1000,1000);
  music = new SoundFile(this, "Music.mp3");
  music.play();
  music.loop();
  p1 = new Player(width/2,height/2);
  img = loadImage("farm.png");
  img2 = loadImage("firsthouse.png");
  sky = loadImage("sky.jpg");
  inventory = loadImage("Inventory.png");
  sky.resize(1000, 300);
  grass = loadImage("grassbetter.png");
  grass.resize(1000, 500);
  pond = loadImage("pond.png");

  gold = loadImage("GoldBar.png");
  gold.resize(200,150);
  waterbar = loadImage("WaterBar.png");
  waterbar.resize(200,150);

  shop = loadImage("Cart.png");
  heart = loadImage("heart.png");
  seedling = loadImage("Seedling.png");
  can = loadImage("Water.png");
  seed = loadImage("seeds.png");
  dirt = loadImage("dirt.png");
  title = loadImage("Title.png");
  title.resize(1000,1000);
  //
  circleColor = color(53, 95, 59);
  circleHighlight = color(204);
  circleX = 40;
  circleY = 60;
  newCircleX = 85;
  newCircleY = 60;
  balance = new Coins(999);
  pinventory = new Inventory();
  theShop = new Shop(pinventory, balance);
  ellipseMode(CENTER);
  textbox.update("You want to\nbefriend Hailey.\nClick on her to see\nhow to gain her\nfriendship!");
  textbox.display();
  
}
void update(int x, int y) {
  
  if (overCircle(circleX, circleY, circleSize) && pinventory.inInventory("Watering Can") ) {
    circleOver = true;
  } 
  else if (overCircle(newCircleX,newCircleY,newCircleSize) && pinventory.inInventory("Seeds")){
    newCircleOver = true;
  }
  else{
    circleOver = false;
    newCircleOver = false;
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
