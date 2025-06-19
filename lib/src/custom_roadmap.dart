import 'package:flutter/material.dart';
import 'package:flutter_roadmap/src/helper/enums/enums.dart';
import 'package:flutter_roadmap/src/model/model.dart';

import 'widgets/widgets.dart';

class RoadMap extends StatelessWidget {
  const RoadMap({
    super.key,
    this.circleRadius = 25,
    required this.values,
    this.roadmapType = RoadmapType.curve,
    this.roadmapOrientation = RoadMapOrientation.horizontal,
    this.height = 0,
    this.width = 0,
  });

  final double circleRadius;
  final List<StepValue> values;
  final RoadmapType roadmapType;
  final RoadMapOrientation roadmapOrientation;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double roadmapHeight = roadmapOrientation.isVertical
        ? circleRadius * 6 + 15
        : circleRadius * (values.length * 4 - 2) + 5;
    final double roadmapWidth = roadmapOrientation.isVertical
        ? circleRadius * (values.length * 4 - 2) + 5
        : circleRadius * 6 + 15;
    final Offset center =
        Offset(size.width / 2 - circleRadius, size.height / 2 - circleRadius);
    return SizedBox(
      height: roadmapHeight,
      width: roadmapWidth,
      child: Stack(
        children: <Widget>[
          if (roadmapOrientation.isVertical)
            ...List<Widget>.generate(
              values.length,
              (int i) => Positioned(
                left: i == 0
                    ? 0
                    : (circleRadius * (i + i) + circleRadius * (i + i)),
                top: roadmapType.isCurve ? circleRadius * 2 + 5 : 0,
                child: CustomStepRoadmap(
                  radius: circleRadius,
                  text: values[i].value,
                  filledColor: values[i].color,
                ),
              ),
            )
          else
            ...List<Widget>.generate(
              values.length,
              (int i) => Positioned(
                left: circleRadius * 2 + 5,
                top: i == 0
                    ? 0
                    : (circleRadius * (i + i) + circleRadius * (i + i)),
                child: CustomStepRoadmap(
                  radius: circleRadius,
                  text: values[i].value,
                  filledColor: values[i].color,
                ),
              ),
            ),
          if (roadmapType.isCurve && roadmapOrientation.isVertical)
            ...List<Widget>.generate(
              values.length - 1,
              (int i) => Positioned(
                top: i.isEven ? circleRadius * 2 + 5 : circleRadius * 4 + 10,
                left: circleRadius * (2 + (4 * i)) + circleRadius + 2.5,
                child: CustomPaint(
                  painter: CurveConnectedLine(
                    radius: circleRadius * 2,
                    roadmapOrientation: roadmapOrientation,
                    curveConnectedLineType: i.isEven
                        ? CurveConnectedLineType.top
                        : CurveConnectedLineType.bottom,
                  ),
                ),
              ),
            )
          else if (roadmapOrientation.isVertical)
            ...List<Widget>.generate(
              values.length - 1,
              (int i) => Positioned(
                top: circleRadius + 2.5,
                left: circleRadius * (2 + (4 * i)) + 2.5,
                child: CustomPaint(
                  painter: StraightConnectedLine(
                    radius: circleRadius * 2 - 5,
                    roadmapOrientation: roadmapOrientation,
                  ),
                ),
              ),
            )
          else if (roadmapType.isCurve)
            ...List<Widget>.generate(
              values.length - 1,
              (int i) => Positioned(
                top: circleRadius * (2 + (4 * i)) + circleRadius,
                left: i.isEven ? circleRadius * 4 + 10 : circleRadius * 2 + 5,
                child: CustomPaint(
                  painter: CurveConnectedLine(
                    radius: circleRadius * 2,
                    curveConnectedLineType: i.isEven
                        ? CurveConnectedLineType.left
                        : CurveConnectedLineType.right,
                  ),
                ),
              ),
            )
          else
            ...List<Widget>.generate(
              values.length - 1,
              (int i) => Positioned(
                top: circleRadius * (2 + (4 * i)),
                left: center.dx + circleRadius,
                child: CustomPaint(
                  painter: StraightConnectedLine(radius: circleRadius * 2 - 5),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
