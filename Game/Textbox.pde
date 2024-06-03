public class Textbox{
  String current = "";
  PImage box;
  public Textbox(){
  }
  public void display(){
    box = loadImage("dialouge.png");
    image(box, 100, 900);
    fill(0);
    text(current, 100, 900);
  }
  
  public void update(String text){
    current = text;
  }
}
