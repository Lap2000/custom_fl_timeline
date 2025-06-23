import 'dart:math';

import 'package:flutter/material.dart';

import '../helper/helper.dart';

class CurveConnectedLine extends CustomPainter {
  const CurveConnectedLine({
    this.radius = 25,
    this.curveConnectedLineType = CurveConnectedLineType.left,
    this.roadmapOrientation = RoadMapOrientation.horizontal,
    this.color = Colors.black,
    this.strokeWidth = 2,
    this.circleDashGap = pi / 50,
    this.circleDashLength = pi / 40,
  });

  final double radius;
  final CurveConnectedLineType curveConnectedLineType;
  final RoadMapOrientation roadmapOrientation;
  final Color color;
  final double strokeWidth;
  final double circleDashGap;
  final double circleDashLength;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paintCircle = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width / 2, size.height / 2);

    double startAngle = roadmapOrientation.isVertical
        ? curveConnectedLineType.isTop
            ? pi
            : 0
        : curveConnectedLineType.isLeft
            ? -pi / 2
            : pi / 2;

    if (curveConnectedLineType.isLeft) {
      while (startAngle < pi / 2) {
        canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius),
          startAngle,
          circleDashLength,
          false,
          paintCircle,
        );
        startAngle += circleDashGap + circleDashLength;
      }
    } else if (curveConnectedLineType.isRight) {
      while (startAngle < pi * 3 / 2) {
        canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius),
          startAngle,
          circleDashLength,
          false,
          paintCircle,
        );
        startAngle += circleDashGap + circleDashLength;
      }
    } else if (curveConnectedLineType.isTop) {
      while (startAngle < pi * 4 / 2) {
        canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius),
          startAngle,
          circleDashLength,
          false,
          paintCircle,
        );
        startAngle += circleDashGap + circleDashLength;
      }
    } else if (curveConnectedLineType.isBottom) {
      while (startAngle < pi) {
        canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius),
          startAngle,
          circleDashLength,
          false,
          paintCircle,
        );
        startAngle += circleDashGap + circleDashLength;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class StraightConnectedLine extends CustomPainter {
  const StraightConnectedLine({
    this.lineLength,
    this.roadmapOrientation = RoadMapOrientation.horizontal,
    this.color = Colors.black,
    this.strokeWidth = 2,
    this.dashGap = 5,
    this.dashLength = 5,
    this.hasArrow = true,
    this.horizontalX = 2.5,
    this.horizontalY = 2,
    this.type = ConnectedLineType.solid,
    this.limitExpand = 0,
  });

  final double? lineLength;
  final RoadMapOrientation roadmapOrientation;
  final Color color;
  final double strokeWidth;
  final double dashGap;
  final double dashLength;
  final bool hasArrow;
  final double horizontalX;
  final double horizontalY;
  final ConnectedLineType type;
  final double limitExpand;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final double limit = lineLength ??
        (roadmapOrientation.isVertical ? size.width : size.height) +
            (type.isSolid ? 0 : limitExpand);

    if (roadmapOrientation.isVertical) {
      double startX = 0;

      const double y = 0;

      if (type.isSolid) {
        canvas.drawLine(Offset(startX, y), Offset(limit + 5, y), paint);
        startX = limit + 5;
      } else {
        while (startX < limit) {
          final double endX = startX + dashLength;
          if (startX < limit || startX > limit) {
            canvas.drawLine(Offset(startX, y), Offset(endX, y), paint);
          }
          startX += dashLength + dashGap;
        }
      }

      if (hasArrow) {
        const double arrowSize = 5.0;
        final Offset arrowTip = Offset(startX, y); // endArrowPoint

        final Offset arrowTop = Offset(
          startX - arrowSize - 5,
          y - arrowSize / 2,
        );
        final Offset arrowBottom = Offset(
          startX - arrowSize - 5,
          y + arrowSize / 2,
        );

        canvas.drawLine(arrowTip, arrowTop, paint);
        canvas.drawLine(arrowTip, arrowBottom, paint);
      }
    } else {
      double startY = horizontalY;

      final double x = horizontalX;

      if (type.isSolid) {
        canvas.drawLine(Offset(x, startY), Offset(x, limit + 7.5), paint);
        startY = limit + 7.5;
      } else {
        while (startY < limit) {
          final double endY = startY + dashLength;
          if (startY < limit || startY > limit) {
            canvas.drawLine(Offset(x, startY), Offset(x, endY), paint);
          }
          startY += dashLength + dashGap;
        }
      }

      if (hasArrow) {
        const double arrowSize = 5.0;
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
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
