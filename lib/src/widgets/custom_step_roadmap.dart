import 'dart:math';

import 'package:flutter/material.dart';

class CustomStepRoadmap extends StatelessWidget {
  const CustomStepRoadmap({
    super.key,
    this.radius = 40,
    this.text,
    this.textStyle,
    this.child,
    this.filledColor,
    this.pixelPadding = 5,
    this.padding = const EdgeInsets.all(8),
  });

  final double radius;
  final String? text;
  final TextStyle? textStyle;
  final Widget? child;
  final Color? filledColor;
  final double pixelPadding;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius * 2 + pixelPadding,
      width: radius * 2 + pixelPadding,
      padding: padding,
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Center(
            child: CustomPaint(
              painter: CirclePainter(radius: radius, filledColor: filledColor),
            ),
          ),
          child ??
              Center(
                child: FittedBox(
                  child: Text(
                    text ?? '',
                    style: textStyle,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                ),
              )
        ],
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
