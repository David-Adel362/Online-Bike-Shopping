import 'package:flutter/material.dart';
import 'package:online_bike_shopping/share_widget/colors.dart';
import 'package:online_bike_shopping/shopping_bag/presentation/pages/my_shopping_cart.dart';

class CustomContainerDetails extends StatefulWidget {
  const CustomContainerDetails({super.key});

  @override
  _CustomContainerDetailsState createState() => _CustomContainerDetailsState();
}

class _CustomContainerDetailsState extends State<CustomContainerDetails> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.appColor4,
            AppColors.appColor,
            AppColors.appColor5,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Tabs
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
              top: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTabButton("Description", 0),
                _buildTabButton("Specification", 1),
              ],
            ),
          ),
          SizedBox(height: 16),
          // Content
          if (selectedIndex == 0) _buildDescription() else _buildSpecification(),
          Spacer(),
          // Price & Button
          Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: Color(0xff262E3D),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ 1,999.99",
                  style: TextStyle(
                    color: Colors.blue.shade300,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.appColor2, AppColors.appColor3],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShoppingCartPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    bool isActive = selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
        decoration: BoxDecoration(
          color: isActive ? Color(0xFF222B3D) : Color(0xFF1A202C),
          borderRadius: BorderRadius.circular(12),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.8),
                    blurRadius: 10,
                    offset: Offset(4, 4),
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.1),
                    blurRadius: 5,
                    offset: Offset(-3, -3),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 6,
                    offset: Offset(3, 3),
                    // inset: true,
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.07),
                    blurRadius: 4,
                    offset: Offset(-3, -3),
                    // inset: true,
                  ),
                ],
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? AppColors.appColor2 : Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            shadows: [
              Shadow(
                color: isActive ? AppColors.appColor2.withOpacity(0) : Colors.black.withOpacity(0.3),
                blurRadius: isActive ? 15 : 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "PEUGEOT - LR01",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "The LR01 uses the same design as the most iconic bikes from PEUGEOT Cycles' 130-year history...",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecification() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Specifications",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "- 16-speed Shimano Claris drivetrain\n- Lugged steel frame\n- Black-and-white chequer design",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
