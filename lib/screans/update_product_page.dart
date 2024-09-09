import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stor_app/models/product_models.dart';
import 'package:stor_app/services/update_product_service.dart';
import 'package:stor_app/widget/custom_button.dart';
import 'package:stor_app/widget/custom_text_filed.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String updateProductPageId = 'updateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productname, description, image;

  double? price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModels product =
        ModalRoute.of(context)!.settings.arguments as ProductModels;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update Product',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(children: [
            CustomTextFiled(
              onChanged: (value) {
                productname = value;
              },
              hintText: 'Product Name',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFiled(
              onChanged: (value) {
                description = value;
              },
              hintText: 'description',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFiled(
              input: TextInputType.number,
              onChanged: (value) {
                price = double.parse(value);
              },
              hintText: 'price',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFiled(
              onChanged: (value) {
                image = value;
              },
              hintText: 'image',
            ),
            const SizedBox(
              height: 45,
            ),
            CustomButton(
                text: 'Update Product',
                onPressed: () async {
                  setState(() {});
                  isLoading = true;
                  updateProductMethod(product);
                  try {
                    print('Product Updated Successfully');
                  } catch (e) {
                    print(e);
                  }

                  setState(() {});
                  isLoading = false;
                }),
          ]),
        ),
      ),
    );
  }

  Future<void> updateProductMethod(ProductModels product) async {
    await UpdateProductService().updateProduct(
      id: product.id,
      title: productname == null ? product.title : productname!,
      price: price == null ? product.price.toString() : price!.toString(),
      description: description == null ? product.description : description!,
      image: image == null ? product.image : image!,
      category: product.category,
    );
  }
}
