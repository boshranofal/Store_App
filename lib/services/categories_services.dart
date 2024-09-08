import 'package:stor_app/helper/api.dart';
import 'package:stor_app/models/product_models.dart';

class CategoriesServices {
  Future<List<ProductModels>> getCategories({required String category}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$category');

    List<ProductModels> product = [];
    for (int i = 0; i < data.length; i++) {
      ProductModels products = ProductModels.fromJson(data[i]);
      product.add(products);
    }
    return product;
  }
}
