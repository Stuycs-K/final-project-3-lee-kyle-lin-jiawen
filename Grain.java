public class Grain extends Crops{
    int coinCost;

    public Grain(String Name, int Growth){
        super(Name, Growth);
        this.coinCost = 5;
    }

    public Grain(){
        this("Grain", 2);
    }
    public String getCropName(){
        return "Grain";
    }
    public int getGrowth(){
        return 2;
    }
    public int getCost(){
        return 5;
    }


}