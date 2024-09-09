import 'package:stor_app/helper/api.dart';
import 'package:stor_app/models/product_models.dart';

class UpdateProductService {
  Future<ProductModels> updateProduct(
      {required String title,
      required String price,
      required String description,
      required int id,
      required String image,
      required String category}) async {
    double parsedPrice;

    // محاولة تحويل السعر مع معالجة الأخطاء
    try {
      parsedPrice = double.parse(price);
    } catch (e) {
      throw Exception('Invalid price format');
    }
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': parsedPrice,
        'description': description,
        'category': category,
        'image': image,
      },
    );
    return ProductModels.fromJson(data);

    // Add product to database
  }
}
