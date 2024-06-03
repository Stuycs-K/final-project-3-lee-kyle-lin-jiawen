public class Coins{
  int myCoins;
  public Coins(int coins){
    this.myCoins = coins;
  }
  public int getCoins(){
    return myCoins;
  }
  public void addCoins(int change){
    myCoins += change;
  }
}
