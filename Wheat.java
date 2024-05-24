public class Wheat extends Crops{
    int coinCost;

    public Wheat(String Name, int Growth){
        super(Name, Growth);
        this.coinCost = 15;
    }

    public Wheat(){
        this("Wheat", 5);
    }
    public String getCropName(){
        return "Wheat";
    }
    public int getGrowth(){
        return 5;
    }
    public int getCost(){
        return 15;
    }


}