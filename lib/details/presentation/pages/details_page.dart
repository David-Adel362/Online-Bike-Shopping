import 'package:flutter/material.dart';
import 'package:online_bike_shopping/details/presentation/widgets/custom_app_bar.dart';
import 'package:online_bike_shopping/details/presentation/widgets/custom_bike_details.dart';
import 'package:online_bike_shopping/details/presentation/widgets/custom_container_details.dart';
import 'package:online_bike_shopping/share_widget/custom_triangle.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff242C3B),
      body: Stack(
        children: [
          CustomTriangle(
            center: .75,
            topRight: 0,
            topCenter: 0,
            left: -0.42,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 42,
                  bottom: 0,
                ),
                child: Column(
                  children: [
                    CustomAppBar(),
                    CustomBikeDetails(),
                    SizedBox(height: 25),
                  ],
                ),
              ),
              Expanded(
                child: CustomContainerDetails(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
