///Cart keeps a running sum of costs to use for the bundle discounts
class Cart {
  double currentPrice;
  double discount = 0;

  ///Constructor
  Cart(this.currentPrice);
}
