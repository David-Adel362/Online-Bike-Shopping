import 'package:flutter/material.dart';
import 'package:online_bike_shopping/home/presentation/widgets/custom_button.dart';
import 'package:online_bike_shopping/home/presentation/widgets/custom_card.dart';
import 'package:online_bike_shopping/home/presentation/widgets/custom_container.dart';
import 'package:online_bike_shopping/home/presentation/widgets/custom_navigation_bar.dart';
import 'package:online_bike_shopping/share_widget/custom_triangle.dart';
import 'package:online_bike_shopping/share_widget/custom_icon_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff242C3B),
      appBar: AppBar(
        backgroundColor: Color(0xff242C3B),
        title: Text(
          'Choose Your Bike',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          CustomIconButton(
            height: 44,
            width: 44,
            imageIcon: 'assets/icons/Vector (2).png',
            onTap: () {},
          ),
          SizedBox(width: 12),
        ],
      ),
      body: Stack(
        children: [
          CustomTriangle(
            center: 0.65,
            topRight: 200,
            topCenter: 90,
            left: 0.06,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              right: 20,
              left: 20,
              bottom: 0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomContainer(
                    width: 350,
                    height: 220,
                    image: 'assets/images/Electric%20Bicycle.I05 2.png',
                  ),
                  SizedBox(height: 60),
                  CustomButton(),
                  ProductGrid(
                    imageCard: 'assets/images/mikkel-bech-yjAFnkLtKY0-unsplash-removebg-preview 3.png',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
