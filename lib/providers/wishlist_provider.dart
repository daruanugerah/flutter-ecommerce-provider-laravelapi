import 'package:bwa_ecom_prov/models/product_model.dart';
import 'package:flutter/material.dart';

class WishlistProvider with ChangeNotifier {
  List<ProductModel> _wishlist = [];

  List<ProductModel> get wishlist => this._wishlist;

  set wishlist(List<ProductModel> value) {
    this._wishlist = value;
    notifyListeners();
  }

  setProduct(ProductModel productModel) {
    if (!isWishlist(productModel)) {
      _wishlist.add(productModel);
      notifyListeners();
    } else {
      _wishlist.removeWhere((element) => element.id == productModel.id);
    }

    notifyListeners();
  }

  isWishlist(ProductModel productModel) {
    // cek apakah produk id itu jika tidak ada di wishlist (berarti -1) maka return false
    if (_wishlist.indexWhere((element) => element.id == productModel.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
