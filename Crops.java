public class Crops{
    String cropName;
    int growthStatus;
    public Crops(){
        String[] cropNames = {"Corn", "Wheat","Grain"};
        int[] growthRates = {1,2,3};
        int rand = (int)(Math.random()*3);
        this.cropName = cropNames[rand];
        this.growthStatus = growthRates[rand];
    }
    public Crops(String crop, int growth){
        this.cropName = crop;
        this.growthStatus = growth;
    }
    public String getCropName(){
        return this.cropName;
    }
    public int getGrowth(){
        return this.growthStatus;
    }

}