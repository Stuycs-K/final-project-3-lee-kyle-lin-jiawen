class Player{
  float x;
  float y;
  boolean isMovingRight;
  boolean isMovingLeft;
  float speed;
  float targetX;
  float targetY;
  float easing = 0.05;
  PImage sprite = loadImage("player.png");
  Player(float startingX, float startingY){
    x = startingX;
    y = startingY;
    isMovingRight = false;
    isMovingLeft = true;
    speed = 10;
    this.targetX = startingX;
    this.targetY = startingY;
  }
  public void setX(float x){
    this.x = x;
  }
  public void setY(float y){
    this.y=y;
  }
  public float getX(){
    return x;
  }
  public float getY(){
    return y;
  }
  void render(){
    image(sprite, x,y);
  }
  void setTarget(float targetX, float targetY) {
    this.targetX = targetX-40;
    this.targetY = targetY-60;
  }
  void update() {
    
    x = lerp(x, targetX, easing);
    y = lerp(y, targetY, easing);
  }
  
  void changeSprite(PImage img){
    sprite = img;
  }

}
