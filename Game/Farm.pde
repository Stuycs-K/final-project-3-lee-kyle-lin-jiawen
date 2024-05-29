class Farm{
  Crops[][] farmLand;
  public Farm(){
    farmLand = new Crops[4][4];  
  }
  public String plantSeed(Crops Crop){
    int row = 0;
    int col = 0;
    if(plantSeedX() == -1){
      return "Farm is full, unable to plant more crops!";
    }
    else{
      row = plantSeedX();
    }
    if(plantSeedY() == -1){
      return "Farm is full, unable to plant more crops!";
    }
    else{
      col = plantSeedY();
    }
    farmLand[row][col] = Crop;
    return "Planted a " + Crop.getCropName() + "at location: ("+row+", " + col+")";
  }
  public int plantSeedX(){
    for(int i = 0; i < farmLand.length; i++){
      for(int j = 0; j < farmLand[0].length; j ++){
        if(farmLand[i][j] == null){
          return i;
        }
      }
    }
    return -1;
  }
  public int plantSeedY(){
    for(int i = 0; i < farmLand.length; i++){
      for(int j = 0; j < farmLand[0].length; j ++){
        if(farmLand[i][j] == null){
          return j;
        }
      }
    }
    return -1;
  }
    
  public String water(){
    String retVal = "";
    int xMouse = mouseX;
    int yMouse = mouseY;
    int x = 135;
    int y = 620;
    for(int i = 0; i < farm.getLength(); i ++){
      for(int j = 0; j < farm.getLength(); j ++){
        if(xMouse >=x && xMouse <= x+70 && yMouse >= y && yMouse <= y+50){
          farmLand[i][j].setGrowth();
          retVal = "You have watered the plant at: ("+i+", "+j+")";
        }
        x+=70;
      }
      x = 135;
      y+=50;
    }
    return retVal;
  }
  public void harvest(int row, int col){
    farmLand[row][col] = null;
    //need to add to invetory when inventory class is made
  }
  public int getLength(){
    return farmLand.length;
  }
  public Crops getCrop(int x, int y){
    return farmLand[x][y];
  }
}
