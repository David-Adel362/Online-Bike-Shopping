import 'package:flutter/material.dart';
import '../../../details/presentation/pages/details_page.dart';

class CustomContainer extends StatelessWidget {
  String? image;
  double width;
  double height;
  CustomContainer({
    super.key,
    this.image,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(),
        ),
      ),
      child: CustomPaint(
        painter: CardPainter(),
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset('$image'),
              Text(
                "30% Off",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
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
        colors: [Colors.blueGrey.shade900, Colors.blue.shade700],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(20, 0) // 👈 نقطة البداية (أعلى يسار)
      ..lineTo(size.width - 20, 0) // خط مستقيم لأعلى اليمين
      ..quadraticBezierTo(size.width, 0, size.width, 20) // انحناء خفيف للزاوية العلوية اليمنى
      ..lineTo(size.width, size.height - 20) // خط مستقيم للأسفل
      ..quadraticBezierTo(
          size.width, size.height, size.width - 20, size.height + 5) // انحناء خفيف للزاوية السفلية اليمنى
      ..lineTo(35, size.height + 40) // خط مستقيم لليسار
      ..quadraticBezierTo(0, size.height + 45, 0, size.height + 20) // 🔥 انحناء مائل للأعلى في الزاوية السفلية اليسرى
      ..lineTo(0, 20) // خط مستقيم للأعلى
      ..quadraticBezierTo(0, 0, 20, 0) // انحناء للزاوية العلوية اليسرى
      ..close(); // إغلاق المسار

    canvas.drawPath(path, paint);

    // ✅ رسم الـ border الأبيض
    Paint borderPaint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
