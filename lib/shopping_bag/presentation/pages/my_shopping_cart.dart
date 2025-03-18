import 'package:flutter/material.dart';
import 'package:online_bike_shopping/home/presentation/pages/home.dart';
import 'package:online_bike_shopping/share_widget/custom_icon_button.dart';
import '../widgets/custom_cart_item.dart';
import '../widgets/custom_slide_confirm.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1F2E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 8),
          child: CustomIconButton(
            height: 20,
            width: 30,
            imageIcon: 'assets/icons/chevron.left.png',
            onTap: () {
              Navigator.popUntil(
                context,
                (route) => route.isFirst,
              );
            },
          ),
        ),
        title: Text(
          "My Shopping Cart",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomCartItemsList(),
          ),
          CustomSlideConfirm(),
        ],
      ),
    );
  }
}
