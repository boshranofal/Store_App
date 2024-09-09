import 'package:flutter/material.dart';
import 'package:stor_app/models/product_models.dart';
import 'package:stor_app/services/get_all_product.dart';
import 'package:stor_app/widget/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to the cart screen
            },
          ),
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('New Trend',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: FutureBuilder<List<ProductModels>>(
          future: GetAllProduct().getAllProduct(),
          builder: (context, snapshot) {
            //print(snapshot.data!.length);
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              List<ProductModels> products = snapshot.data!;
              return GridView.builder(
                itemCount: products.length.toInt(),
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 90,
                ),
                itemBuilder: (context, index) {
                  return CustomCard(
                    product: products[index],
                  );
                },
              );
            } else if (snapshot.hasData && snapshot.data!.isEmpty) {
              return const Center(child: Text('No products available'));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          },
        ),
      ),
    );
  }
}
