class Player{
  int x;
  int y;
  boolean isMovingRight;
  boolean isMovingLeft;
  int speed;
  int targetX = x;
  int targetY = y;
  Player(int startingX, int startingY){
    x = startingX;
    y = startingY;
    isMovingRight = false;
    isMovingLeft = true;
    speed = 10;
  }
  public void setX(int x){
    this.x = x;
  }
  public void setY(int y){
    this.y=y;
  }
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
  void render(){
    square(x,y,50);
  }
  void move(){
    if (isMovingLeft == true){
      x-=speed;
    }
    if (isMovingRight == true){
      x+=speed;
    }
  }

}
