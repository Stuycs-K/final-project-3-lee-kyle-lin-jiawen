public class Harvest extends Item{
  public Harvest(String Name, int Cost){
    super(Name,Cost);
  }
  public Harvest(){
    this("Crop",10);
  }
  public String getName() {
    return "Crop";
  }
  
  public int getPrice() {
    return 10;
  }
}
