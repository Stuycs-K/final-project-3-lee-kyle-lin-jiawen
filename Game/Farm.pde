class Farm{
  Crops[][] farmLand;
  
  public void plantSeed(Crops Crop, int row, int col){
    farmLand[row][col] = Crop;
  }
  public void water(int row, int col){
    farmLand[row][col].setGrowth();
  }
  public void harvest(int row, int col){
    farmLand[row][col] = null;
  }
}
