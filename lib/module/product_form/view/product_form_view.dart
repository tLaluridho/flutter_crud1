import 'package:flutter/material.dart';
import 'package:crud_flutter/core.dart';
import '../controller/product_form_controller.dart';

class ProductFormView extends StatefulWidget {
  final Map? item;
  const ProductFormView({
    Key? key,
    this.item,
  }) : super(key: key);

  Widget build(context, ProductFormController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "ProductForm",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(),
              child: TextFormField(
                initialValue: controller.productName,
                maxLength: 30,
                decoration: const InputDecoration(
                  labelText: 'Name Product',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  suffixIcon: Icon(
                    Icons.abc,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: "Tambahkan Product",
                ),
                onChanged: (value) => controller.productName = value,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(),
              child: TextFormField(
                initialValue: controller.price?.toString(),
                maxLength: 20,
                decoration: const InputDecoration(
                  labelText: 'Price',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: "Tambahkan Harga",
                ),
                onChanged: (value) =>
                    controller.price = double.tryParse(value) ?? 0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () => controller.save(),
              child: const Text(
                "save",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<ProductFormView> createState() => ProductFormController();
}
