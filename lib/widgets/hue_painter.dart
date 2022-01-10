// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HuePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final hueGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        HSVColor.fromAHSV(1.0, 0.0, 1.0, 1.0).toColor(),
        HSVColor.fromAHSV(1.0, 51.0, 1.0, 1.0).toColor(),
        HSVColor.fromAHSV(1.0, 102.0, 1.0, 1.0).toColor(),
        HSVColor.fromAHSV(1.0, 153.0, 1.0, 1.0).toColor(),
        HSVColor.fromAHSV(1.0, 204.0, 1.0, 1.0).toColor(),
        HSVColor.fromAHSV(1.0, 255.0, 1.0, 1.0).toColor(),
        HSVColor.fromAHSV(1.0, 306.0, 1.0, 1.0).toColor(),
        HSVColor.fromAHSV(1.0, 360.0, 1.0, 1.0).toColor(),
      ],
    ).createShader(Offset.zero & size);

    final paint = Paint()..shader = hueGradient;

    canvas.drawRRect(
      RRect.fromRectAndRadius(Offset.zero & size, Radius.circular(10.0)),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
