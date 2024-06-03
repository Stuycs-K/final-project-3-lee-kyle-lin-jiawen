public class Inventory{
   ArrayList<Item> playerInventory;
  
  public Inventory() {
    playerInventory = new ArrayList<Item>();
  }
  
  public void addItem(Item item) {

  }
  
  public void removeItem(String itemName, int quantity) {

  }
  
  public boolean inInventory(String itemName) {
    return true;
  }
  
  public Item getItem(int col) {
    return playerInventory.get(col);
  }
  

}
