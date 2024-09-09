import 'package:stor_app/helper/api.dart';
import 'package:stor_app/models/product_models.dart';

class GetAllProduct {
  Future<List<ProductModels>> getAllProduct() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModels> products = [];
    for (int i = 0; i < data.length; i++) {
      products.add(
        ProductModels.fromJson(
          data[i],
        ),
      );
    }

    return products;
  }
}
