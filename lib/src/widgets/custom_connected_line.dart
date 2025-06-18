import 'dart:math';

import 'package:flutter/material.dart';

class ConnectedLine extends CustomPainter {
  const ConnectedLine({
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

    // final Offset startingPoint = Offset(0, size.height / 2);
    // final Offset endingPoint = Offset(size.width, size.height / 2);

    final Offset circleOffset = Offset(size.width / 2, size.height / 2);

    final Offset center = Offset(size.width / 2, size.height / 2);
    final double centerWidth = size.width / 2;

    // double startX = 0;
    // const double dashLength = 5;
    // const double dashGap = 8;

    // final double y = size.height / 2;

    // while (startX < size.width) {
    //   final double endX = (startX + dashLength).clamp(0, size.width);
    //   if (startX < centerWidth - radius || startX > centerWidth + radius) {
    //     canvas.drawLine(Offset(startX, y), Offset(endX, y), paint);
    //   }
    //   startX += dashLength + dashGap;
    // }

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
