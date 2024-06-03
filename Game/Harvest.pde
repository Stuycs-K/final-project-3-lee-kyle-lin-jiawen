public class Harvest extends Item{
  public Harvest(String Name, int Cost){
    super(Name,Cost);
  }
  public Harvest(){
    this("Harvest",10);
  }
  public String getName() {
    return "Harvest";
  }
  
  public int getPrice() {
    return 10;
  }
}
