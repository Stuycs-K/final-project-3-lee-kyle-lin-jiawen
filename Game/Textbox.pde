public class Textbox{
  String current = "";
  public Textbox(){
  }
  public void display(){
    fill(0);
    text(current, 515, 650);
  }
  
  public void update(String text){
    current = text;
  }
}
