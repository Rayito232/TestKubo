import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:example_api/models/product_response_model.dart';

class ProductService {
  Future<ProductResponseModel> getProducts({String input = ''}) async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://api.bazzaio.com/v5/listados/listar_productos_tienda/590/0/"));
      ProductResponseModel responseModel =
          ProductResponseModel.fromJson(json.decode(response.body));
      if (input.isNotEmpty) {
        List<Data>? list = responseModel.data?.where((element) =>
            (element.nombre ?? '').toLowerCase().startsWith(input.toLowerCase()))
            .toList();
        responseModel.setData(list);
      }

      return responseModel;
    } catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }
}
