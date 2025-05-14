import 'package:flutter/material.dart';
import 'package:online_bike_shopping/share_widget/colors.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  int activeIndex = 0;

  final List<String> imageIcons = [
    'assets/icons/All.png',
    'assets/icons/Subtract.png',
    'assets/icons/Road.png',
    'assets/icons/Union (1).png',
    'assets/icons/Union.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        imageIcons.length,
        (index) {
          bool isActive = activeIndex == index;

          double middle = (imageIcons.length - 5.5);
          double offsetY = -(index - middle).toDouble() * 12.5;

          return Transform.translate(
            offset: Offset(0, offsetY),
            child: AnimatedContainer(
              duration: Duration(seconds: 3),
              margin: EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                gradient: isActive
                    ? LinearGradient(
                        colors: [AppColors.appColor2, AppColors.appColor3],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : LinearGradient(
                        colors: [Colors.grey.shade900, Colors.grey.shade700],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  if (isActive)
                    BoxShadow(
                      color: AppColors.appColor3.withOpacity(0.5),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                ],
              ),
              child: IconButton(
                icon: Image.asset(
                  imageIcons[index],
                  width: 28,
                  height: 28,
                  color: Colors.white,
                ),
                iconSize: 28,
                onPressed: () {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
