import 'package:flutter/material.dart';

class CustomBikeDetails extends StatefulWidget {
  const CustomBikeDetails({super.key});

  @override
  _CustomBikeDetailsState createState() => _CustomBikeDetailsState();
}

class _CustomBikeDetailsState extends State<CustomBikeDetails> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> images = [
    'assets/images/robert-bye-tG36rvCeqng-unsplash-removebg-preview 5.png',
    'assets/images/robert-bye-tG36rvCeqng-unsplash-removebg-preview 5.png',
    'assets/images/robert-bye-tG36rvCeqng-unsplash-removebg-preview 5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 250,
          child: PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset(images[index], fit: BoxFit.contain),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, (index) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: _currentIndex == index ? 20 : 8,
              decoration: BoxDecoration(
                color: _currentIndex == index ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            );
          }),
        ),
      ],
    );
  }
}
