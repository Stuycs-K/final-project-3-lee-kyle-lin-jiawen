public class Seeds extends Item{
  public Seeds(String Name, int Cost){
    super(Name,Cost);
  }
  public Seeds(){
    this("Seeds",10);
  }
  public String getName() {
    return "Seeds";
  }
  
  public int getPrice() {
    return 10;
  }
}
