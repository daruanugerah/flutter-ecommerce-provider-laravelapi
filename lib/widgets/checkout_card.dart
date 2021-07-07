import 'package:bwa_ecom_prov/models/cart_model.dart';
import 'package:bwa_ecom_prov/theme.dart';
import 'package:flutter/material.dart';

class CheckoutCard extends StatelessWidget {
  final CartModel cartModel;

  CheckoutCard(this.cartModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(cartModel.productModel.galleries[0].url),
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
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  '\$${cartModel.productModel.price}',
                  style: priceTextStyle,
                )
              ],
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            cartModel.quantity == 1
                ? '${cartModel.quantity.toString()} Item' 
                : '${cartModel.quantity.toString()} Items',
            style: secondaryTextStyle.copyWith(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
