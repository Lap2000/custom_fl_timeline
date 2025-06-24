import 'dart:math';

import 'package:flutter/material.dart';

import 'base_widgets/one_line_text.dart';

class CustomCircleBox extends StatelessWidget {
  const CustomCircleBox({
    super.key,
    this.radius = 40,
    this.text,
    this.textStyle,
    this.child,
    this.filledColor,
  });

  final double radius;
  final String? text;
  final TextStyle? textStyle;
  final Widget? child;
  final Color? filledColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius * 2,
      width: radius * 2,
      alignment: Alignment.center,
      child: Center(
        child: CustomPaint(
          painter: CirclePainter(radius: radius, filledColor: filledColor),
          child: child ??
              OneLineText(
                text ?? '',
                style: textStyle,
              ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  const CirclePainter({this.filledColor, required this.radius});

  final double radius;
  final Color? filledColor;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paintCircle = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final Paint paintFilledCircle = Paint()
      ..strokeWidth = 2
      ..color = filledColor ?? Colors.white
      ..style = PaintingStyle.fill;

    final Offset center = Offset(size.width / 2, size.height / 2);

    double startAngle = 0;

    const double circleLengthGap = pi / 18;

    if (filledColor != null) {
      canvas.drawCircle(center, radius, paintFilledCircle);
    } else {
      while (startAngle < 2 * pi) {
        canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius),
          startAngle,
          circleLengthGap,
          false,
          paintCircle,
        );
        startAngle += circleLengthGap + circleLengthGap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
