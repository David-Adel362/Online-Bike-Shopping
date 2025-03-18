import 'package:flutter/material.dart';

class CustomTriangle extends StatelessWidget {
  final double topCenter;
  final double topRight;
  final double left;
  final double center;
  const CustomTriangle({
    super.key,
    required this.topCenter,
    required this.topRight,
    required this.left,
    required this.center,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BackgroundPainter(
        topRight: topRight,
        topCenter: topCenter,
        left: left,
        center: center,
      ),
      size: Size(
        MediaQuery.sizeOf(context).width,
        MediaQuery.sizeOf(context).height,
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final double topCenter;
  final double topRight;
  final double left;
  final double center;

  BackgroundPainter({
    required this.left,
    required this.center,
    required this.topRight,
    required this.topCenter,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = LinearGradient(
        colors: [Colors.blueAccent.shade700, Colors.blueGrey.shade900],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(size.width * center, topCenter)
      ..lineTo(425, topRight)
      ..lineTo(size.width + 40, size.height)
      ..lineTo(size.width * left, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
