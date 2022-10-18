import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:dime_test_app/palette.dart';
import 'package:flutter/material.dart';

import '../classes/cart.dart';

///BDrawer implements the package bottom_drawer from https://pub.dev/packages/bottom_drawer
///This is mostly taken from the example on the pub.dev page
///The Bottom Drawer is built through three widgets, buildBottomDrawer,
///buildBottomDrawerHead, and buildBottomDrawerBody.
class BDrawer {
  final Cart cart;
  final double _headerHeight = 50.0;
  final double _bodyHeight = 225.0;
  final BottomDrawerController _controller = BottomDrawerController();

  ///Constructor
  BDrawer(this.cart);

  ///Combine the bottomDrawerHead and bottomDrawerBody
  Widget buildBottomDrawer(BuildContext context) {
    return BottomDrawer(
      header: _buildBottomDrawerHead(context),
      body: _buildBottomDrawerBody(context),
      headerHeight: _headerHeight,
      drawerHeight: _bodyHeight,
      color: Colors.transparent,
      controller: _controller,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          blurRadius: 60,
          spreadRadius: 5,
          offset: const Offset(2, -6), // changes position of shadow
        ),
      ],
    );
  }

  ///BottomDrawerHead create the tab that shows on the main page, with a message
  ///that alerts the user to how much more they need to spend and bundle to get
  ///even larger discounts
  Widget _buildBottomDrawerHead(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Palette.customBlack,
      ),
      height: _headerHeight,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              top: 10.0,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (cart.currentPrice < 100)
                      ? Text(
                          'Add \$${100 - cart.currentPrice.toInt()} to save 10%',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      : (cart.currentPrice < 130)
                          ? Text(
                              'Add \$${130 - cart.currentPrice.toInt()} to save 15%',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            )
                          : (cart.currentPrice < 160)
                              ? Text(
                                  'Add \$${160 - cart.currentPrice.toInt()} to save 20%',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
                              : (cart.currentPrice < 190)
                                  ? Text(
                                      'Add \$${190 - cart.currentPrice.toInt()} to save 25%',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    )
                                  : const Text(
                                      'You are saving 25%!',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///BottomDrawerBody shows a progress indicator as visualization for the user
  ///to see how close they are to a new discount tier
  ///Had to build this pretty custom, as I couldn't find any usable packages
  ///to copy the pattern given for the demo
  Widget _buildBottomDrawerBody(BuildContext context) {
    return Container(
      color: Palette.customLightGray,
      width: double.infinity,
      height: _bodyHeight,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    'Bundle Price',
                    style: TextStyle(fontSize: 16),
                  ),
                  Spacer(),
                  Text(
                    'Your Savings',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Text(
                      '\$${cart.currentPrice.toInt() - cart.discount.toInt()}',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    Text(
                      '\$${cart.discount.toInt().toString()}',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      clipBehavior: Clip.hardEdge,
                      child: LinearProgressIndicator(
                        value: cart.currentPrice / 200,
                        minHeight: 20,
                        color: Palette.customBlack,
                        backgroundColor: Palette.customLightPeach,
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(176, 0),
                      child: Container(
                        height: 20,
                        width: 1,
                        color: Palette.customBlack,
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(229, 0),
                      child: Container(
                        height: 20,
                        width: 1,
                        color: Palette.customBlack,
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(282, 0),
                      child: Container(
                        height: 20,
                        width: 1,
                        color: Palette.customBlack,
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(335, 0),
                      child: Container(
                        height: 20,
                        width: 1,
                        color: Palette.customBlack,
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(163, 25),
                      child: const Text(
                        '10%      15%      20%      25%',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
