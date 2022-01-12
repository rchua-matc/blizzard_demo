import 'package:flutter/material.dart';

/// A [CustomPainter] to create the spectrum of colors on the color selector.
class HuePainter extends CustomPainter {
  /// Paints the color selector widget.
  @override
  void paint(Canvas canvas, Size size) {
    final hueGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        const HSVColor.fromAHSV(1.0, 0.0, 1.0, 1.0).toColor(),
        const HSVColor.fromAHSV(1.0, 51.0, 1.0, 1.0).toColor(),
        const HSVColor.fromAHSV(1.0, 102.0, 1.0, 1.0).toColor(),
        const HSVColor.fromAHSV(1.0, 153.0, 1.0, 1.0).toColor(),
        const HSVColor.fromAHSV(1.0, 204.0, 1.0, 1.0).toColor(),
        const HSVColor.fromAHSV(1.0, 255.0, 1.0, 1.0).toColor(),
        const HSVColor.fromAHSV(1.0, 306.0, 1.0, 1.0).toColor(),
        const HSVColor.fromAHSV(1.0, 360.0, 1.0, 1.0).toColor(),
      ],
    ).createShader(Offset.zero & size);

    final paint = Paint()..shader = hueGradient;

    canvas.drawRRect(
      RRect.fromRectAndRadius(Offset.zero & size, const Radius.circular(10.0)),
      paint,
    );
  }

  /// Conditions when the canvas should be repainted: never.
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
