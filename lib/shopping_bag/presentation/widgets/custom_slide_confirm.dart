import 'package:flutter/material.dart';
import 'package:online_bike_shopping/home/presentation/pages/home.dart';
import 'package:online_bike_shopping/share_widget/colors.dart';
import 'package:slide_action/slide_action.dart';

final ValueNotifier<double> subtotalNotifier = ValueNotifier(0.0);
const double discountPercentage = 30;

class CustomSlideConfirm extends StatelessWidget {
  const CustomSlideConfirm({super.key});

  double calculateTotal(double subtotal) {
    return subtotal - (subtotal * (discountPercentage / 100));
  }



  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: subtotalNotifier,
      builder: (context, subtotal, child) {
        double total = calculateTotal(subtotal);
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFF292D3E),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Your cart qualifies for free shipping!',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              SizedBox(height: 16),
              SlideAction(
                rightToLeft: true,
                trackHeight: 50,
                thumbWidth: 130,
                trackBuilder: (context, state) {
                  return Container(
                    padding: EdgeInsets.only(left: 15),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.grey.shade900, Colors.grey.shade700],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.appColor5.withOpacity(0.5),
                          blurRadius: 15,
                          spreadRadius: 1,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Text(
                      "Slide to Confirm Order",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
                thumbBuilder: (context, state) {
                  return Container(
                    width: double.infinity,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.appColor2, AppColors.appColor3],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      shape: BoxShape.rectangle,
                    ),
                    child: Center(
                      child: Text(
                        'Apply',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
                action: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Order Confirmed!"),
                    ),
                  );
                },
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subtotal:",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "\$${subtotal.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery Fee:",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "\$0",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discount:",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "$discountPercentage%",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total:",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$${total.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 70,
                  right: 80,
                  bottom: 0,
                ),
                child: SlideAction(
                  rightToLeft: false,
                  trackHeight: 50,
                  thumbWidth: 55,
                  trackBuilder: (context, state) {
                    return Container(
                      padding: EdgeInsets.only(right: 40),
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.grey.shade900, Colors.grey.shade700],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.appColor5.withOpacity(0.5),
                            blurRadius: 15,
                            spreadRadius: 1,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Text(
                        "Checkout",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                  thumbBuilder: (context, state) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.appColor2, AppColors.appColor3],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        shape: BoxShape.rectangle,
                      ),
                      child: Image.asset(
                        'assets/icons/chevron.forward.png',
                        color: Colors.white,
                      ),
                    );
                  },
                  action: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Order Confirmed!"),
                      ),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
