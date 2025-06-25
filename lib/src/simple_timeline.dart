import 'package:flutter/material.dart';
import 'helper/enums/enums.dart';
import 'model/model.dart';

import 'widgets/widgets.dart';

class SimpleTimeline extends StatelessWidget {
  const SimpleTimeline({
    super.key,
    this.circleRadius = 25,
    required this.values,
    this.timelineType = TimelineType.curve,
    this.timelineOrientation = TimelineOrientation.horizontal,
    this.circleBorderWidth = 2,
    this.circleBorderColor = Colors.black,
    this.circle3D = false,
  });

  /// circle radius.
  final double circleRadius;

  /// Main value.
  final List<TimelineMilestone> values;

  /// Timeline Type (curve, straight).
  final TimelineType timelineType;

  /// Timeline Orientation.
  final TimelineOrientation timelineOrientation;

  /// Width of the circle border.
  final double circleBorderWidth;

  /// Color of the circle border.
  final Color circleBorderColor;

  /// circle shader.
  final bool circle3D;

  @override
  Widget build(BuildContext context) {
    final double timelineHeight = timelineOrientation.isVertical
        ? timelineType.isCurve
            ? circleRadius * 6
            : circleRadius * 2
        : circleRadius * (values.length * 4) - circleRadius * 2;
    final double timelineWidth = timelineOrientation.isVertical
        ? circleRadius * (values.length * 4) - circleRadius * 2
        : timelineType.isCurve
            ? circleRadius * 6
            : circleRadius * 2;
    return Container(
      height: timelineHeight,
      width: timelineWidth,
      margin: const EdgeInsets.all(2),
      child: Stack(
        children: <Widget>[
          if (timelineType.isCurve && timelineOrientation.isVertical)
            ...List<Widget>.generate(
              values.length - 1,
              (int i) => Positioned(
                top: i.isEven ? circleRadius * 2 + 5 : circleRadius * 4 - 5,
                left: circleRadius * (2 + (4 * i)) + circleRadius,
                child: CustomPaint(
                  painter: CurveConnector(
                    radius: circleRadius * 2,
                    timelineOrientation: timelineOrientation,
                    curveConnectedLineType:
                        i.isEven ? CurveConnectorType.top : CurveConnectorType.bottom,
                  ),
                ),
              ),
            )
          else if (timelineOrientation.isVertical)
            ...List<Widget>.generate(
              values.length - 1,
              (int i) => Positioned(
                top: circleRadius,
                left: circleRadius * (2 + (4 * i)),
                child: CustomPaint(
                  painter: StraightConnector(
                    length: circleRadius * 2,
                    timelineOrientation: timelineOrientation,
                    hasArrow: false,
                  ),
                ),
              ),
            )
          else if (timelineType.isCurve)
            ...List<Widget>.generate(
              values.length - 1,
              (int i) => Positioned(
                top: circleRadius * (2 + (4 * i)) + circleRadius + 5,
                left: i.isEven ? circleRadius * 4 : circleRadius * 2,
                child: CustomPaint(
                  painter: CurveConnector(
                    radius: circleRadius * 2,
                    curveConnectedLineType:
                        i.isEven ? CurveConnectorType.left : CurveConnectorType.right,
                  ),
                ),
              ),
            )
          else
            ...List<Widget>.generate(
              values.length - 1,
              (int i) => Positioned(
                top: circleRadius * (2 + (4 * i)),
                left: circleRadius,
                child: CustomPaint(
                  painter: StraightConnector(
                    length: circleRadius * 2,
                  ),
                ),
              ),
            ),
          if (timelineOrientation.isVertical)
            ...List<Widget>.generate(
              values.length,
              (int i) => Positioned(
                left: i == 0 ? 0 : (4 * circleRadius * i),
                top: timelineType.isCurve ? circleRadius * 2 : 0,
                child: CustomCircleBox(
                  radius: circleRadius,
                  text: values[i].value,
                  filledColor: values[i].color,
                  painterType: PainterType.solid,
                  borderColor: circleBorderColor,
                  borderWidth: circleBorderWidth,
                  circle3D: circle3D,
                ),
              ),
            )
          else
            ...List<Widget>.generate(
              values.length,
              (int i) => Positioned(
                left: timelineType.isCurve ? circleRadius * 2 : 0,
                top: i == 0 ? 0 : (4 * circleRadius * i),
                child: CustomCircleBox(
                  radius: circleRadius,
                  text: values[i].value,
                  filledColor: values[i].color,
                  painterType: PainterType.dash,
                  borderColor: circleBorderColor,
                  borderWidth: circleBorderWidth,
                  circle3D: circle3D,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
