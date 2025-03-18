import 'package:flutter/material.dart';
import 'package:online_bike_shopping/home/presentation/widgets/custom_card.dart';
import 'package:online_bike_shopping/share_widget/colors.dart';

import 'custom_slide_confirm.dart';

class CustomCartItemsList extends StatelessWidget {
  const CustomCartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<CartItemData>>(
      valueListenable: selectedItemsNotifier,
      builder: (context, selectedItems, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: selectedItems.length,
          itemBuilder: (context, index) {
            final item = selectedItems[index];
            return CartItem(title: item.title, price: item.price, imagePath: item.imagePath);
          },
        );
      },
    );
  }
}

class CartItem extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;

  const CartItem({
    super.key,
    required this.title,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFF292D3E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [Color(0xff4B566E), Color(0xff363F51)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Image.asset(
              imagePath,
              // width: 40,
              // height: 40,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(price, style: TextStyle(color: Colors.blueAccent)),
              ],
            ),
          ),
          ValueListenableBuilder<Map<String, int>>(
            valueListenable: cartQuantitiesNotifier,
            builder: (context, cartQuantities, child) {
              int quantity = cartQuantities[title] ?? 1;

              return Container(
                // margin: EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 0),
                padding: EdgeInsets.all(0),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [Colors.grey.shade900, Colors.grey.shade700],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            colors: [AppColors.appColor2, AppColors.appColor3],
                          ),
                        ),
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        if (quantity > 1) {
                          cartQuantitiesNotifier.value = {
                            ...cartQuantities,
                            title: quantity - 1,
                          };
                        } else {
                          // حذف المنتج إذا وصل الكمية لـ 0
                          selectedItemsNotifier.value = List.from(selectedItemsNotifier.value)
                            ..removeWhere((item) => item.title == title);
                          cartQuantitiesNotifier.value = {
                            ...cartQuantities,
                            title: 0,
                          };
                        }
                        updateSubtotal();
                      },
                    ),
                    SizedBox(width: 8),
                    Text(
                      quantity.toString(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8),
                    GestureDetector(
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            colors: [AppColors.appColor2, AppColors.appColor3],
                          ),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        cartQuantitiesNotifier.value = {
                          ...cartQuantities,
                          title: quantity + 1,
                        };
                        updateSubtotal();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void updateSubtotal() {
    double subtotal = 0.0;

    for (var item in selectedItemsNotifier.value) {
      int quantity = cartQuantitiesNotifier.value[item.title] ?? 1;
      double itemPrice = double.parse(
        item.price.replaceAll("\$", ""),
      );
      subtotal += itemPrice * quantity;
    }

    subtotalNotifier.value = subtotal;
  }
}
