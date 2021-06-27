import 'package:bwa_ecom_prov/pages/cart_page.dart';
import 'package:bwa_ecom_prov/pages/checkout_page.dart';
import 'package:bwa_ecom_prov/pages/detail_chat_page.dart';
import 'package:bwa_ecom_prov/pages/edit_profile_page.dart';
import 'package:bwa_ecom_prov/pages/main_page/main_page.dart';
import 'package:bwa_ecom_prov/pages/detail_product_page.dart';
import 'package:bwa_ecom_prov/pages/signin_page.dart';
import 'package:bwa_ecom_prov/pages/signup_page.dart';
import 'package:bwa_ecom_prov/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/signin': (context) => SignInPage(),
        '/signup': (context) => SignUpPage(),
        '/main': (context) => MainPage(),
        '/detail-chat': (context) => DetailChatPage(),
        '/edit-profile': (context) => EditProfilePage(),
        '/detail-product': (context) => DetailProductPage(),
        '/cart': (context) => CartPage(),
        '/checkout': (context) => CheckoutPage(),
      },
    );
  }
}
