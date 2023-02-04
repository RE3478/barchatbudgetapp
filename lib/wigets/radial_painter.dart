import 'package:flutter/material.dart';

class RadialPainter extends CustomPainter {
  final Color bgColor;
  final Color lineColor;
  final double percentage;
  final double width;

  RadialPainter(
    this.bgColor,
    this.lineColor,
    this.percentage,
    this.width,
  );

  @override
  void paint(Canvas canvas, Size size) {}
  Paint bgLine = Paint()
    ..color = bgColor
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = width;

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
  }
}
