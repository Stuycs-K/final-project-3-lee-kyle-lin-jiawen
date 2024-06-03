public class Item{
  String itemName;
  int itemPrice;
  
  public Item(String name, int price) {
    this.itemName = name;
    this.itemPrice = price;
  }
  
  public String getName() {
    return itemName;
  }
  
  public int getPrice() {
    return itemPrice;
  }
  
  
}
