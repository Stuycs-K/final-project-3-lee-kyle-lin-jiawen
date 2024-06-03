public class Crops{
    String cropName;
    int growthStatus;
    int currentGrowth;
    boolean canHarvest = false;
    public Crops(){
        String[] cropNames = {"Corn", "Wheat","Grain"};
        int[] growthStati = {1,2,3};
        int rand = (int)(Math.random()*3);
        this.cropName = cropNames[rand];
        this.growthStatus = growthStati[rand];
        this.currentGrowth = 0;
        this.canHarvest = false;
    }
    public Crops(String crop, int growth){
        this.cropName = crop;
        this.growthStatus = growth;
        this.currentGrowth = 0;
        this.canHarvest = false;
    }
    public String getCropName(){
        return this.cropName;
    }
    public int getGrowth(){
        return this.growthStatus;
    }
    public void setGrowth(){
      currentGrowth += 1;
      if (currentGrowth >= growthStatus){
         canHarvest = true;
      }
    }
    public void Harvest(){
      
    }

}
