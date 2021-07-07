import 'package:bwa_ecom_prov/models/cart_model.dart';
import 'package:bwa_ecom_prov/providers/cart_provider.dart';
import 'package:bwa_ecom_prov/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartCard extends StatelessWidget {
  final CartModel cartModel;

  CartCard(this.cartModel);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image:
                        NetworkImage(cartModel.productModel.galleries[0].url),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartModel.productModel.name,
                      style: primaryTextStyle.copyWith(fontWeight: semiBold),
                    ),
                    Text(
                      '\$${cartModel.productModel.price}',
                      style: priceTextStyle,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartProvider.addQuantity(cartModel.id);
                    },
                    child: Image.asset(
                      'assets/button_add.png',
                      width: 16,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    cartModel.quantity.toString(),
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  GestureDetector(
                    onTap: () {
                      cartProvider.reduceQuantity(cartModel.id);
                    },
                    child: Image.asset(
                      'assets/button_min.png',
                      width: 16,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              cartProvider.removeCart(cartModel.id);    
            },
                      child: Row(
              children: [
                Image.asset(
                  'assets/icon_remove.png',
                  width: 10,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Remove',
                  style: alertTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
