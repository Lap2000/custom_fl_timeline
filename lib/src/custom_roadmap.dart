import 'package:flutter/material.dart';
import 'package:flutter_roadmap/src/model/model.dart';

import 'widgets/widgets.dart';

class RoadMap extends StatelessWidget {
  const RoadMap({super.key, required this.pointerRadius, required this.values});

  final double pointerRadius;
  final List<StepValue> values;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double roadmapHeight = pointerRadius * (values.length * 4 - 2) + 5;
    final Offset center =
        Offset(size.width / 2 - pointerRadius, size.height / 2 - pointerRadius);
    return SizedBox(
      height: roadmapHeight,
      width: size.width,
      child: Stack(
        children: <Widget>[
          ...List<Widget>.generate(
            values.length,
            (int i) => Positioned(
              left: center.dx,
              top: i == 0
                  ? 0
                  : (pointerRadius * (i + i) + pointerRadius * (i + i)),
              child: CustomStepRoadmap(
                radius: pointerRadius,
                text: values[i].value,
                filledColor: values[i].color,
              ),
            ),
          ),
          ...List<Widget>.generate(
            values.length - 1,
            (int i) => Positioned(
              top: pointerRadius * (2 + (4 * i)) + pointerRadius,
              left: i.isEven ? center.dx + pointerRadius * 2 + 5 : center.dx,
              child: CustomPaint(
                painter:
                    ConnectedLine(radius: pointerRadius * 2, isLeft: i.isEven),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
