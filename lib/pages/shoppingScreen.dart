// ignore: file_names
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:app_cities_flutter/pages/productDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  late List<Map<String, dynamic>> formattedProducts;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    updateLocalization();
  }

  void updateLocalization() {
    final locale = Localizations.localeOf(context).toString();
    final currencySymbol = locale.startsWith('en') ? "\$" : "€";

    formattedProducts = products().map((product) {
      return {
        ...product,
        'formattedPrice': NumberFormat.currency(
          locale: locale,
          symbol: currencySymbol,
        ).format(product['price']),
        'formattedDate': DateFormat.yMMMMd(
          locale,
        ).format(product['dateAdded']),
      };
    }).toList();

    setState(() {});
  }

  List<Map<String, dynamic>> products() {
    final texts = AppLocalizations.of(context)!;
    return [
      {
        'name': texts.product_delhi,
        'price': 20.0,
        'dateAdded': DateTime(2024, 2, 17),
        'description': texts.product_description_delhi,
        'image': 'assets/product-delhi.jpg',
      },
      {
        'name': texts.product_london,
        'price': 18.0,
        'dateAdded': DateTime(2024, 2, 10),
        'description': texts.product_description_london,
        'image': 'assets/product-london.jpg',
      },
      {
        'name': texts.product_vancouver,
        'price': 8.0,
        'dateAdded': DateTime(2024, 3, 1),
        'description': texts.product_description_vancouver,
        'image': 'assets/product-vancouver.jpg',
      },
      {
        'name': texts.product_new_york,
        'price': 18.0,
        'dateAdded': DateTime(2024, 2, 28),
        'description': texts.product_description_new_york,
        'image': 'assets/product-newyork.jpg',
      },
      {
        'name': texts.product_tokyo,
        'price': 120.0,
        'dateAdded': DateTime(2024, 2, 5),
        'description': texts.product_description_tokyo,
        'image': 'assets/product-tokyo.jpg',
      },
      {
        'name': texts.product_paris,
        'price': 25.0,
        'dateAdded': DateTime(2024, 2, 17),
        'description': texts.product_description_paris,
        'image': 'assets/product-paris.jpg',
      },
      {
        'name': texts.product_sydney,
        'price': 30.0,
        'dateAdded': DateTime(2024, 2, 20),
        'description': texts.product_description_sydney,
        'image': 'assets/product-sydney.jpg',
      },
      {
        'name': texts.product_rio,
        'price': 40.0,
        'dateAdded': DateTime(2024, 2, 5),
        'description': texts.product_description_rio,
        'image': 'assets/product-rio.jpg',
      },
      {
        'name': texts.product_moscow,
        'price': 35.0,
        'dateAdded': DateTime(2024, 2, 15),
        'description': texts.product_description_moscow,
        'image': 'assets/product-moscow.jpg',
      },
      {
        'name': texts.product_cairo,
        'price': 28.0,
        'dateAdded': DateTime(2024, 2, 12),
        'description': texts.product_description_cairo,
        'image': 'assets/product-elcairo.jpg',
      },
      {
        'name': texts.product_barcelona,
        'price': 30.0,
        'dateAdded': DateTime(2024, 2, 8),
        'description': texts.product_description_barcelona,
        'image': 'assets/product-barcelona.jpg',
      },
      {
        'name': texts.product_berlin,
        'price': 10.0,
        'dateAdded': DateTime(2024, 2, 20),
        'description': texts.product_description_berlin,
        'image': 'assets/product-berlin.jpg',
      },
      {
        'name': texts.product_dubai,
        'price': 50.0,
        'dateAdded': DateTime(2024, 2, 12),
        'description': texts.product_description_dubai,
        'image': 'assets/product-dubai.jpg',
      },
      {
        'name': texts.product_rome,
        'price': 15.0,
        'dateAdded': DateTime(2024, 2, 10),
        'description': texts.product_description_rome,
        'image': 'assets/product-rome.jpg',
      },
      {
        'name': texts.product_beijing,
        'price': 22.0,
        'dateAdded': DateTime(2024, 2, 18),
        'description': texts.product_description_beijing,
        'image': 'assets/product-beijing.jpg',
      },
      {
        'name': texts.product_buenos_aires,
        'price': 85.0,
        'dateAdded': DateTime(2024, 2, 1),
        'description': texts.product_description_buenos_aires,
        'image': 'assets/product-buenosaires.jpg',
      },
      {
        'name': texts.product_los_angeles,
        'price': 25.0,
        'dateAdded': DateTime(2024, 2, 22),
        'description': texts.product_description_los_angeles,
        'image': 'assets/product-losangeles.jpg',
      },
      {
        'name': texts.product_bangkok,
        'price': 18.0,
        'dateAdded': DateTime(2024, 2, 9),
        'description': texts.product_description_bangkok,
        'image': 'assets/product-bangkok.jpg',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: formattedProducts.length,
        itemBuilder: (context, index) {
          final product = formattedProducts[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Hero(
                tag: product['image']!,
                child: Image.asset(
                  product['image']!,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                product['name']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${product['formattedPrice']}\n${product['formattedDate']}',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                      productName: product['name']!,
                      productImage: product['image']!,
                      productDescription: product['description']!,
                      productPrice: product['price'],
                      productDate: product['dateAdded'],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
