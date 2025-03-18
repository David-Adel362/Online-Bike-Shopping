import 'package:flutter/material.dart';
import 'package:online_bike_shopping/share_widget/colors.dart';

class CustomIconButton extends StatelessWidget {
  final double height;
  final double width;
  final String imageIcon;
  final GestureTapCallback onTap;

  const CustomIconButton({
    super.key,
    required this.height,
    required this.width,
    required this.imageIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [AppColors.appColor2, AppColors.appColor3],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Image.asset(
          imageIcon,
        ),
      ),
    );
  }
}
