import 'dart:math';

import 'package:flutter/material.dart';

class CurveConnectedLine extends CustomPainter {
  const CurveConnectedLine({
    required this.radius,
    this.isLeft = true,
  });

  final double radius;
  final bool isLeft;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paintCircle = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width / 2, size.height / 2);

    double startAngle = isLeft ? -pi / 2 : pi / 2;

    const double circleLengthGap = pi / 40;

    if (isLeft) {
      while (startAngle < pi / 2) {
        canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius),
          startAngle,
          circleLengthGap,
          false,
          paintCircle,
        );
        startAngle += circleLengthGap + circleLengthGap;
      }
    } else {
      while (startAngle < pi * 3 / 2) {
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

class StraightConnectedLine extends CustomPainter {
  const StraightConnectedLine(this.radius);

  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    double startY = 2;
    const double dashLength = 5;
    const double dashGap = 5;

    final double x = 2.5;

    while (startY < radius) {
      final double endY = startY + dashLength;
      if (startY < radius || startY > radius) {
        canvas.drawLine(Offset(x, startY), Offset(x, endY), paint);
      }
      startY += dashLength + dashGap;
    }

    final double arrowSize = 5.0;
    final Offset arrowTip = Offset(x, startY); // endArrowPoint

    final Offset arrowLeft = Offset(
      x - arrowSize / 2,
      startY - arrowSize - 5,
    );
    final Offset arrowRight = Offset(
      x + arrowSize / 2,
      startY - arrowSize - 5,
    );

    canvas.drawLine(arrowTip, arrowLeft, paint);
    canvas.drawLine(arrowTip, arrowRight, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
