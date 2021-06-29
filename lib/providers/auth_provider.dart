import 'package:bwa_ecom_prov/models/user_model.dart';
import 'package:bwa_ecom_prov/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  UserModel _userModel;

  UserModel get userModel => this._userModel;

  set userModel(UserModel value) {
    this._userModel = value;
    notifyListeners();
  }

  Future<bool> register(
      {String name, String username, String email, String password}) async {
    try {
      UserModel userModel = await AuthService().register(
        name: name,
        username: username,
        email: email,
        password: password,
      );

      _userModel = userModel;

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
