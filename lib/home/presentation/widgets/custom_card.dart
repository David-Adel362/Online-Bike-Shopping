import 'package:flutter/material.dart';
import 'package:online_bike_shopping/details/presentation/pages/details_page.dart';
import 'package:online_bike_shopping/share_widget/colors.dart';

final ValueNotifier<List<CartItemData>> selectedItemsNotifier = ValueNotifier([]);
final ValueNotifier<Map<String, int>> cartQuantitiesNotifier = ValueNotifier({});

class ProductGrid extends StatelessWidget {
  final String imageCard;
  const ProductGrid({super.key, required this.imageCard});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(),
            ),
          ),
          child: CustomCard(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            imageCard: imageCard,
            title: "Product $index",
            price: "\$${(index + 1) * 100}",
          ),
        );
      },
    );
  }
}

class CustomCard extends StatelessWidget {
  final double? width;
  final double? height;
  final String imageCard;
  final String title;
  final String price;

  const CustomCard({
    super.key,
    this.width,
    this.height,
    required this.imageCard,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CardPainter(),
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.only(top: 0, left: 10, bottom: 0, right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: ValueListenableBuilder<List<CartItemData>>(
                valueListenable: selectedItemsNotifier,
                builder: (context, selectedItems, child) {
                  bool isFavorite = selectedItems.any((item) => item.title == title);
                  return IconButton(
                    icon: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        isFavorite ? AppColors.appColor2 : Colors.white54,
                        BlendMode.srcIn, // 🔥 تغيير لون الأيقونة مع الحفاظ على شكلها
                      ),
                      child: Image.asset(
                        isFavorite ? 'assets/icons/heart.png' : 'assets/icons/favor.png',
                        height: 20,
                        width: 20,
                      ),
                    ),
                    onPressed: () {
                      List<CartItemData> updatedItems = List.from(selectedItems);
                      if (isFavorite) {
                        updatedItems.removeWhere((item) => item.title == title);
                      } else {
                        updatedItems.add(CartItemData(
                          title: title,
                          price: price,
                          imagePath: imageCard,
                        ));
                      }
                      selectedItemsNotifier.value = updatedItems;
                    },
                  );
                },
              ),
            ),
            Image.asset(
              imageCard,
              alignment: Alignment.center,
              height: MediaQuery.sizeOf(context).height * .09,
              width: MediaQuery.sizeOf(context).width * .36,
            ),
            Text(
              "Road Bike",
              style: TextStyle(
                color: Colors.white54,
                fontSize: 14,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              price,
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = LinearGradient(
        colors: [Colors.blueGrey.shade900, Colors.blueGrey.shade800],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(20, 20)
      ..lineTo(size.width - 30, -1.5)
      ..quadraticBezierTo(size.width, -5, size.width, 30)
      ..lineTo(size.width, size.height - 25)
      ..quadraticBezierTo(size.width, size.height + 2, size.width - 30, size.height + 6)
      ..lineTo(35, size.height + 20)
      ..quadraticBezierTo(2, size.height + 25, 0, size.height - 10)
      ..lineTo(0, 50)
      ..quadraticBezierTo(0, 20, 40, 16)
      ..close();

    canvas.drawShadow(path, Colors.black.withOpacity(0.6), 15, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CartItemData {
  final String title;
  final String price;
  final String imagePath;

  CartItemData({required this.title, required this.price, required this.imagePath});
}
