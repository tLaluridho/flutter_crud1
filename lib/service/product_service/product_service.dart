import 'package:dio/dio.dart';

class ProductService {
  Future<List> get() async {
    var response = await Dio().get(
      "https://9code.id/demo/api/products",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    return obj["data"];
  }

  Future create({
    required String productName,
    required double price,
  }) async {
    await Dio().post(
      "https://9code.id/demo/api/products",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "product": productName,
        "price": price,
      },
    );
  }

  Future update({
    required int id,
    required String productName,
    required double price,
  }) async {
    await Dio().put(
      "https://9code.id/demo/api/products/$id",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "product": productName,
        "price": price,
      },
    );
  }

  Future delete(int id) async {
    await Dio().delete(
      "https://9code.id/demo/api/products/$id",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
  }
}
