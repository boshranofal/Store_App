import 'package:stor_app/helper/api.dart';
import 'package:stor_app/models/product_models.dart';

class UpdateProduct {
  Future<ProductModels> updateProduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
      },
    );
    return ProductModels.fromJson(data);

    // Add product to database
  }
}
