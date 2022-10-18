///Product holds attributes of each product
class Product {
  final String title;
  final String description;
  final int reviews;
  final double avgReview;
  final double price;
  final String photoURL;

  ///Constructor
  Product(
    this.title,
    this.description,
    this.reviews,
    this.avgReview,
    this.price,
    this.photoURL,
  );
}
