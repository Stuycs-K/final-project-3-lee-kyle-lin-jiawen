public class Textbox{
  String current = "";
  public Textbox(){}
  public void display(){
    fill(0);
    text(current, 100, 900);
  }
  
  public void update(String text){
    current = text;
  }
}
