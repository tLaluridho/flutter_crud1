import 'package:crud_flutter/state_util.dart';
import 'package:flutter/material.dart';
import 'package:crud_flutter/core.dart';
import '../controller/product_list_controller.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  Widget build(context, ProductListController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "ProductList",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: const [],
      ),
      body: ListView.builder(
        itemCount: controller.products.length,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var item = controller.products[index];
          return InkWell(
            onTap: () async {
              await Get.to(ProductFormView(
                item: item,
              ));
              controller.getProducts();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Card(
                child: ListTile(
                  title: Text(item["product"]),
                  subtitle: Text(item["price"].toString()),
                  trailing: IconButton(
                    onPressed: () => controller.deleteProduct(item["id"]),
                    icon: const Icon(
                      Icons.delete,
                      size: 24.0,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      // UNTUK CREATE
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
        onPressed: () async {
          await Get.to(const ProductFormView());
          controller.getProducts();
        },
      ),
    );
  }

  @override
  State<ProductListView> createState() => ProductListController();
}
