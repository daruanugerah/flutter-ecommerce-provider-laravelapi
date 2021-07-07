import 'package:bwa_ecom_prov/pages/cart_page.dart';
import 'package:bwa_ecom_prov/pages/checkout_page.dart';
import 'package:bwa_ecom_prov/pages/co_success_page.dart';
import 'package:bwa_ecom_prov/pages/detail_chat_page.dart';
import 'package:bwa_ecom_prov/pages/edit_profile_page.dart';
import 'package:bwa_ecom_prov/pages/main_page/main_page.dart';
import 'package:bwa_ecom_prov/pages/signin_page.dart';
import 'package:bwa_ecom_prov/pages/signup_page.dart';
import 'package:bwa_ecom_prov/pages/splash_page.dart';
import 'package:bwa_ecom_prov/providers/auth_provider.dart';
import 'package:bwa_ecom_prov/providers/cart_provider.dart';
import 'package:bwa_ecom_prov/providers/product_provider.dart';
import 'package:bwa_ecom_prov/providers/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/signin': (context) => SignInPage(),
          '/signup': (context) => SignUpPage(),
          '/main': (context) => MainPage(),
          '/detail-chat': (context) => DetailChatPage(),
          '/edit-profile': (context) => EditProfilePage(),
          //'/detail-product': (context) => DetailProductPage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccessPage(),
        },
      ),
    );
  }
}
