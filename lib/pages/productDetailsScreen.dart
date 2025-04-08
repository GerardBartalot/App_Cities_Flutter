// ignore: file_names
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productName;
  final String productImage;
  final String productDescription;
  final double productPrice;
  final DateTime? productDate;

  const ProductDetailsScreen({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productDescription,
    required this.productPrice,
    required this.productDate,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late String formattedPrice;
  late String formattedDate;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateLocalization();
  }

  void _updateLocalization() {
    final locale = Localizations.localeOf(context).toString();

    // Formatear el precio con la moneda correcta
    final currencySymbol = locale.startsWith('en') ? "\$" : "€";
    formattedPrice = NumberFormat.currency(
      locale: locale,
      symbol: currencySymbol,
    ).format(widget.productPrice);

    // Formatear la fecha con el idioma correcto
    formattedDate = DateFormat.yMMMMd(
      locale,
    ).format(widget.productDate ?? DateTime.now());

    // Forzar reconstrucción de la UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final texts = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  border: Border.all(color: Colors.black, width: 1.0),
                ),
                child: Text(
                  widget.productName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 2.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Hero(
                  tag: widget.productImage,
                  child: Image.asset(
                    widget.productImage,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  widget.productDescription,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, height: 1.5),
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                formattedPrice,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                formattedDate,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 70, 69, 69),
                ),
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () => _showDeleteDialog(context, texts),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 210, 38, 25),
                ),
                child: Text(
                  texts.deleteProduct,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, AppLocalizations texts) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(texts.confirmDeletion),
          content: Text(texts.confirmDeleteProduct),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(texts.cancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context, widget.productName);
              },
              child: Text(
                texts.delete,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
