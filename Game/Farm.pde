class Farm{
  Crops[][] farmLand;
  public Farm(){
    farmLand = new Crops[4][4];  
  }
  public String plantSeed(Crops Crop){
    String retVal = "";
    int xMouse = mouseX;
    int yMouse = mouseY;
    int x = 135;
    int y = 620;
    for(int i = 0; i < farm.getLength(); i ++){
      for(int j = 0; j < farm.getLength(); j ++){
        if(xMouse >=x && xMouse <= x+70 && yMouse >= y && yMouse <= y+50){
          if(farmLand[i][j] == null){
            farmLand[i][j] = Crop;
            retVal = "You have planted a "+Crop.getCropName()+" at: ("+i+", "+j+")";
          }
          else{
            retVal = "You already have a plant here! Cannot plant more.";
          }
        }
        x+=70;
      }
      x = 135;
      y+=50;
    }
    return retVal;
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
          if(farmLand[i][j] != null){
            farmLand[i][j].setGrowth();
            retVal = "You have watered the plant at: ("+i+", "+j+")";
          }
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
