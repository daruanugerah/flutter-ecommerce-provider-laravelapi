import 'package:bwa_ecom_prov/models/product_model.dart';
import 'package:bwa_ecom_prov/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _productModel = [];

  List<ProductModel> get productModel => this._productModel;

  set productsModel(List<ProductModel> value) {
    this._productModel = value;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> productModel = await ProductService().getProducts();
      _productModel = productModel;
    } catch (e) {
      print(e);
    }
  }
}
