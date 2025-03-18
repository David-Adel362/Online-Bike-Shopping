import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedIndex = 0;
  final List<IconData> icons = [
    Icons.directions_bike,
    Icons.map,
    Icons.shopping_cart,
    Icons.person,
    Icons.insert_drive_file,
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = screenWidth / icons.length;

    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade900,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: List.generate(icons.length, (index) {
          final isSelected = index == selectedIndex;
          return Positioned(
            left: (index * itemWidth) + (itemWidth / 2) - 35,
            top: isSelected ? -30 : 20,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: isSelected
                  ? CustomNavigationBar(
                      width: 70,
                      height: 70,
                      icon: icons[index],
                      iconColor: Colors.white,
                    )
                  : Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                      child: Icon(
                        icons[index],
                        color: Colors.white.withOpacity(0.6),
                        size: 24,
                      ),
                    ),
            ),
          );
        }),
      ),
    );
  }
}

class CustomNavigationBar extends StatelessWidget {
  final double width;
  final double height;
  final IconData icon;
  final Color iconColor;

  const CustomNavigationBar({
    super.key,
    required this.width,
    required this.height,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(width, height),
            painter: RPSCustomPainter(),
          ),
          Icon(
            icon,
            color: iconColor,
            size: 30,
          ),
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(size.width * 0.5, size.height * 0.3),
        Offset(size.width * 0.8, size.height * 0.9),
        [Color(0xff34C8E8), Color(0xff4E4AF2)],
      )
      ..style = PaintingStyle.fill;
    Path path_0 = Path();
    path_0.moveTo(17, 28.198);
    path_0.cubicTo(17, 23.4312, 20.3646, 19.3271, 25.0388, 18.3922);
    path_0.lineTo(65.0388, 10.3922);
    path_0.cubicTo(71.2268, 9.15465, 77, 13.8876, 77, 20.198);
    path_0.lineTo(77, 47.802);
    path_0.cubicTo(77, 52.5688, 73.6354, 56.6729, 68.9612, 57.6078);
    path_0.lineTo(28.9612, 65.6078);
    path_0.cubicTo(22.7732, 66.8454, 17, 62.1124, 17, 55.802);
    path_0.lineTo(17, 28.198);
    path_0.close();

    canvas.drawPath(path_0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
