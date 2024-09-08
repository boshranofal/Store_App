import 'package:stor_app/helper/api.dart';
import 'package:stor_app/models/product_models.dart';

class GetAllProduct {
  Future<List<ProductModels>> getAllProduct() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModels> product = [];
    for (int i = 0; i < data.length; i++) {
      ProductModels products = ProductModels.fromJson(data[i]);
      product.add(products);
    }
    return product;
  }
}
