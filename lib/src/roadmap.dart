import 'package:flutter/material.dart';
import 'helper/enums/enums.dart';
import 'model/model.dart';

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
    final double roadmapHeight = roadmapOrientation.isVertical
        ? roadmapType.isCurve
            ? circleRadius * 6
            : circleRadius * 2
        : circleRadius * (values.length * 4);
    final double roadmapWidth = roadmapOrientation.isVertical
        ? circleRadius * (values.length * 4)
        : roadmapType.isCurve
            ? circleRadius * 6
            : circleRadius * 2;
    return SizedBox(
      height: roadmapHeight,
      width: roadmapWidth,
      child: Stack(
        children: <Widget>[
          if (roadmapType.isCurve && roadmapOrientation.isVertical)
            ...List<Widget>.generate(
              values.length - 1,
              (int i) => Positioned(
                top: i.isEven ? circleRadius * 2 + 5 : circleRadius * 4 - 5,
                left: circleRadius * (2 + (4 * i)) + circleRadius,
                child: CustomPaint(
                  painter: CurveConnector(
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
                top: circleRadius,
                left: circleRadius * (2 + (4 * i)),
                child: CustomPaint(
                  painter: StraightConnector(
                    length: circleRadius * 2,
                    roadmapOrientation: roadmapOrientation,
                    hasArrow: false,
                  ),
                ),
              ),
            )
          else if (roadmapType.isCurve)
            ...List<Widget>.generate(
              values.length - 1,
              (int i) => Positioned(
                top: circleRadius * (2 + (4 * i)) + circleRadius + 5,
                left: i.isEven ? circleRadius * 4 : circleRadius * 2,
                child: CustomPaint(
                  painter: CurveConnector(
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
                left: circleRadius,
                child: CustomPaint(
                  painter: StraightConnector(
                    length: circleRadius * 2,
                  ),
                ),
              ),
            ),
          if (roadmapOrientation.isVertical)
            ...List<Widget>.generate(
              values.length,
              (int i) => Positioned(
                left: i == 0 ? 0 : (4 * circleRadius * i),
                top: roadmapType.isCurve ? circleRadius * 2 : 0,
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
                left: roadmapType.isCurve ? circleRadius * 2 : 0,
                top: i == 0 ? 0 : (4 * circleRadius * i),
                child: CustomStepRoadmap(
                  radius: circleRadius,
                  text: values[i].value,
                  filledColor: values[i].color,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
