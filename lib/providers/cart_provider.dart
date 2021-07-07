import 'package:bwa_ecom_prov/models/cart_model.dart';
import 'package:bwa_ecom_prov/models/product_model.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];

  List<CartModel> get carts => this._carts;

  set carts(List<CartModel> value) {
    this._carts = value;
    notifyListeners();
  }

  addCart(ProductModel productModel) {
    if (productExist(productModel)) {
      // note: this is if same product add to cart, we will just add quantity
      int index = _carts
          .indexWhere((element) => element.productModel.id == productModel.id);
      _carts[index].quantity++;
    } else {
      _carts.add(
        CartModel(
          id: _carts.length,
          productModel: productModel,
          quantity: 1,
        ),
      );
    }

    notifyListeners();
  }

  removeCart(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

  addQuantity(int id) {
    _carts[id].quantity++;
    notifyListeners();
  }

  reduceQuantity(int id) {
    _carts[id].quantity--;

    if (_carts[id].quantity == 0) {
      _carts.removeAt(id);
    }

    notifyListeners();
  }

  totalItems() {
    int total = 0;

    for (var item in _carts) {
      total += item.quantity;
    }

    return total;
  }

  totalPrice() {
    double total = 0;

    for (var item in _carts) {
      total += (item.quantity * item.productModel.price);
    }

    return total;
  }

  productExist(ProductModel productModel) {
    if (_carts.indexWhere(
            (element) => element.productModel.id == productModel.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
