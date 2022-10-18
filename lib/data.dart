import 'classes/product.dart';

///Data from the storefront API by using "Insomnia" to access the data
class Data {
  List<Product> buildProductList() {
    return [
      Product(
        'Probiotic Gel Cream',
        'A light moisturizer designed to help renew your skin.',
        7,
        5.0,
        40,
        'https://cdn.shopify.com/s/files/1/0675/1184/5078/products/Probiotic-Gel-Cream-Tan-Listing_900x900_crop_center_076480d1-e491-4aa1-8893-aa75d0ec4146.jpg?v=1664558400',
      ),
      Product(
        'Creamy Foam Cleanser',
        'A lightweight foam cleanser to clear your skin and cleanse impurities.',
        146,
        5.0,
        32,
        'https://cdn.shopify.com/s/files/1/0675/1184/5078/products/CreamyFoamCleanser1_900x900_crop_center_8bbce594-b415-4e0e-9b4d-0bcd12653c0e.jpg?v=1664558609',
      ),
      Product(
          'Volume Mascara',
          'Add length and fullness with our new and improved Volume Mascara.',
          25,
          5.0,
          22,
          'https://cdn.shopify.com/s/files/1/0675/1184/5078/products/VolumeMascaraWhiteGlass1_900x900_crop_center_8f04cd59-7e79-429e-bd87-f3bf455c7486.jpg?v=1664558784'),
      Product(
        'Cleansing Balm',
        'Take your cleansing routine to the next level with Cleansing Balm.',
        184,
        4.99,
        38,
        'https://cdn.shopify.com/s/files/1/0675/1184/5078/products/CleansingBalm1_900x900_crop_center_d79270b6-0b04-4e4e-adfd-6b38c16f9518.jpg?v=1664558700',
      ),
    ];
  }
}
