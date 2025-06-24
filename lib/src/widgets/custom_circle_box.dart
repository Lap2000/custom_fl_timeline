import 'dart:math';

import 'package:flutter/material.dart';

import '../helper/helper.dart';
import 'base_widgets/one_line_text.dart';

class CustomCircleBox extends StatelessWidget {
  const CustomCircleBox({
    super.key,
    this.radius = 40,
    this.text,
    this.textStyle,
    this.child,
    this.filledColor,
    this.borderColor,
    required this.borderWidth,
    required this.painterType,
    required this.circle3D,
  });

  final double radius;
  final String? text;
  final TextStyle? textStyle;
  final Widget? child;
  final Color? filledColor;
  final PainterType painterType;
  final double borderWidth;
  final Color? borderColor;
  final bool circle3D;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius * 2,
      width: radius * 2,
      alignment: Alignment.center,
      child: Center(
        child: CustomPaint(
          painter: CirclePainter(
            radius: radius,
            filledColor: filledColor,
            painterType: painterType,
            borderWidth: borderWidth,
            borderColor: borderColor,
            shader3D: circle3D,
          ),
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
  const CirclePainter({
    this.filledColor,
    required this.radius,
    required this.painterType,
    required this.borderWidth,
    required this.shader3D,
    this.borderColor,
  });

  final double radius;
  final Color? filledColor;
  final PainterType painterType;
  final double borderWidth;
  final Color? borderColor;
  final bool shader3D;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paintCircle = Paint()
      ..color = borderColor ?? Colors.black
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;

    final Paint paintBorderCircle = Paint()
      ..color = borderColor ?? Colors.black
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.fill;

    final Paint paintFilledCircle = Paint()
      ..strokeWidth = 2
      ..color = filledColor ?? Colors.white
      ..style = PaintingStyle.fill;

    final Offset center = Offset(size.width / 2, size.height / 2);

    double startAngle = 0;

    const double circleLengthGap = pi / 18;

    if (painterType.isSolid) {
      canvas.drawCircle(center, radius, paintBorderCircle);
      if (shader3D) {
        /// Create a shader for the circle
        final Paint fillPaint = Paint()
          ..shader = RadialGradient(
            center: const Alignment(-0.3, -0.3),
            colors: <Color>[Colors.white, filledColor ?? Colors.blue],
            stops: const <double>[0.0, 1.0],
          ).createShader(Rect.fromCircle(center: center, radius: radius));
        canvas.drawCircle(center, radius, fillPaint);
      } else {
        canvas.drawCircle(center, radius - borderWidth, paintFilledCircle);
      }
    } else {
      canvas.drawCircle(center, radius - borderWidth / 2, paintFilledCircle);
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
