public class Inventory{
   ArrayList<Item> playerInventory;
  
  public Inventory() {
    playerInventory = new ArrayList<Item>();
  }
  
  public void addItem(Item item) {
    if (playerInventory.size() < 9){
      playerInventory.add(item);
    }
  }
  
  public void removeItem(String itemName) {
    for(int i = 0; i < playerInventory.size(); i++){
      if (playerInventory.get(i).getName().equals(itemName)){
        playerInventory.remove(i);
    }
  }
  }
  public boolean inInventory(String itemName) {
    for(int i = 0; i < playerInventory.size(); i++){
      if (playerInventory.get(i).getName().equals(itemName)){
        return true;
    }
  }
    return false;
  }
  
  public Item getItem(int col) {
    return playerInventory.get(col);
  }

}
