import 'dart:convert';

import 'package:bwa_ecom_prov/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<List<ProductModel>> getProducts() async {
    var url = '$baseUrl/products';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> produtcs = [];

      for (var item in data) {
        produtcs.add(ProductModel.fromJson(item));
      }

      return produtcs;
    } else {
      throw Exception('Gagal mengambil data produk');
    }
  }
}
