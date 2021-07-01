import 'package:bwa_ecom_prov/models/product_model.dart';
import 'package:bwa_ecom_prov/providers/wishlist_provider.dart';
import 'package:bwa_ecom_prov/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistCard extends StatelessWidget {
  final ProductModel productModel;

  const WishlistCard(this.productModel);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      padding: EdgeInsets.only(
        top: 10,
        left: 12,
        bottom: 14,
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor4,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              productModel.galleries[0].url,
              width: 60,
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
                  productModel.name,
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),
                ),
                Text(
                  '\$${productModel.price}',
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              wishlistProvider.setProduct(productModel);
            },
            child: Image.asset(
              'assets/button_wishlist_blue.png',
              width: 34,
            ),
          ),
        ],
      ),
    );
  }
}
