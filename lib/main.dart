import 'package:dime_test_app/data.dart';
import 'package:dime_test_app/palette.dart';
import 'package:dime_test_app/widgets/star_rating.dart';
import 'package:flutter/material.dart';

import 'classes/cart.dart';
import 'widgets/bottom_drawer.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ///Root of the app, includes the title and palette
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dime Beauty Demo',
      theme: ThemeData(
        primarySwatch: Palette.kToDark,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

///Create cart, and keep track of discount
class _MyHomePageState extends State<MyHomePage> {
  Cart cart = Cart(0);

  setDiscount(Cart cart) {
    if (cart.currentPrice > 100) {
      cart.discount = cart.currentPrice * 0.1;
    }
    if (cart.currentPrice > 130) {
      cart.discount = cart.currentPrice * 0.15;
    }
    if (cart.currentPrice > 160) {
      cart.discount = cart.currentPrice * 0.2;
    }
    if (cart.currentPrice > 190) {
      cart.discount = cart.currentPrice * 0.25;
    }
  }

  @override
  Widget build(BuildContext context) {
    final productList = Data().buildProductList();
    setDiscount(cart);
    BDrawer bDrawer = BDrawer(cart);

    return Scaffold(
      ///Appbar for the title of the page, the back arrow doesn't currently do anything
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios_new,
          size: 24,
        ),
        title: const Text(
          'Add Product',
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        elevation: 0,
      ),

      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),

            ///Create grid of product cards
            child: GridView.builder(
              itemCount: productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 465 / 785,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, i) {
                ///Card includes important attributes of the product, including
                ///the button to add it to the bundle
                return Card(
                  elevation: 6,
                  clipBehavior: Clip.hardEdge,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        productList[i].photoURL,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 10, 8, 6),
                        child: Text(
                          productList[i].title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(7, 0, 8, 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            StarRating(
                              rating: productList[i].avgReview,
                              onRatingChanged: (double rating) {},
                              color: Palette.customBlack,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Text(
                                ' ${productList[i].reviews.toString()} Reviews',
                                style: const TextStyle(fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(9, 0, 8, 0),
                        child: Text(
                          '\$${productList[i].price.toInt().toString()}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                cart.currentPrice += productList[i].price;
                                setState(() {});
                                // print(cart.currentPrice);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Palette.customBlack,
                                foregroundColor: Colors.white,
                                minimumSize: Size.zero,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 7),
                              ),
                              child: const Text('Add to Bundle'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          ///Build the bottom drawer
          bDrawer.buildBottomDrawer(context),
        ],
      ),
    );
  }
}
