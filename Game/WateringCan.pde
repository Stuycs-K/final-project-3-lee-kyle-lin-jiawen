public class WateringCan extends Item{
  public WateringCan(String Name, int Cost){
    super(Name,Cost);
  }
  public WateringCan(){
    this("Watering Can",50);
  }
  public String getName() {
    return "Watering Can";
  }
  
  public int getPrice() {
    return 50;
  }
}
