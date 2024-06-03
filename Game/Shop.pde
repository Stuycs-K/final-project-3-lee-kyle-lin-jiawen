public class Shop {
  ArrayList<Item> shopItems;
  Inventory inventory;
  Coins balance;
  
  public Shop(Inventory inventory, Coins playerBalance) {
    this.inventory = inventory;
    this.balance =  playerBalance;
    shopItems = new ArrayList<Item>();
    WateringCan water = new WateringCan();
    Seeds seeds = new Seeds();
    shopItems.add(water);
    shopItems.add(seeds);
  }
  
  
  public void buyItem(String itemName) {
    for(int i = 0; i < shopItems.size(); i++){
      if (shopItems.get(i).getName().equals(itemName)){
        if (balance.getCoins() >= shopItems.get(i).getPrice()){
          inventory.addItem(shopItems.get(i));
          balance.addCoins(0-shopItems.get(i).getPrice());
          shopItems.remove(i);
        }
    }
  }
  }
  
}
