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

}