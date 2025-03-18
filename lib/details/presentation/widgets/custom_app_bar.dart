import 'package:flutter/material.dart';
import 'package:online_bike_shopping/share_widget/custom_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            height: 44,
            width: 44,
            imageIcon: 'assets/icons/chevron.left.png',
            onTap: () => Navigator.pop(context),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * .6,
            child: Text(
              'PEUGEOT - LR01',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
