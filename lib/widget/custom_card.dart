// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:stor_app/models/product_models.dart';
import 'package:stor_app/screans/update_product_page.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModels product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.updateProductPageId,
            arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                offset: const Offset(0, 3),
              )
            ]),
            child: Card(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title.substring(0, 6),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.favorite)
                    ],
                  ),
                ],
              ),
            )),
          ),
          Positioned(
            right: 20,
            child: Image.network(product.image,
                height: 80, width: 80, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
