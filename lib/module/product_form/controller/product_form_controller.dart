import 'package:crud_flutter/state_util.dart';
import 'package:flutter/material.dart';
import 'package:crud_flutter/core.dart';
import '../view/product_form_view.dart';

class ProductFormController extends State<ProductFormView> {
  static late ProductFormController instance;
  late ProductFormView view;

  @override
  void initState() {
    instance = this;
    if (isEditMode) {
      productName = widget.item!["product"];
      price = double.parse(widget.item!["price"].toString());
    }
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  bool get isEditMode {
    return widget.item != null;
  }

  //UNTUK MENAMPUNG PRODUCT KE SERVICE CREATE
  String? productName;
  double? price;

  save() async {
    if (isEditMode) {
      await ProductService().update(
        id: widget.item!["id"],
        productName: productName!,
        price: price!,
      );
    } else {
      await ProductService().create(
        productName: productName!,
        price: price!,
      );
    }
    Get.back();
  }
}
