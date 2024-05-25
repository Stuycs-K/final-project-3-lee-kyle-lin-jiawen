public class Corn extends Crops{
    int coinCost;

    public Corn(String Name, int Growth){
        super(Name, Growth);
        this.coinCost = 30;
    }

    public Corn(){
        this("Corn", 10);
    }
    public String getCropName(){
        return "Corn";
    }
    public int getGrowth(){
        return 10;
    }
    public int getCost(){
        return 30;
    }


}
