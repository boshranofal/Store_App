import 'package:flutter/material.dart';
import 'package:stor_app/screans/home_page.dart';
import 'package:stor_app/screans/update_product_page.dart';

void main() {
  runApp(const StorApp());
}

class StorApp extends StatelessWidget {
  const StorApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.id: (context) => const HomePage(),
        UpdateProductPage.updateProductPageId: (context) => UpdateProductPage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
