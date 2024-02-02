import 'package:flutter/material.dart';
import 'package:crud_flutter/core.dart';
import '../view/product_list_view.dart';

class ProductListController extends State<ProductListView> {
  static late ProductListController instance;
  late ProductListView view;

  @override
  void initState() {
    instance = this;
    getProducts();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List products = [];
  getProducts() async {
    products = await ProductService().get();
    setState(() {});
  }

  deleteProduct(int id) async {
    await ProductService().delete(id);
    getProducts();
  }
}
